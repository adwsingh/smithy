/*
 * Copyright 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

package software.amazon.smithy.rulesengine.language.syntax.expressions.literal;

import static software.amazon.smithy.rulesengine.language.RulesComponentBuilder.javaLocation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import software.amazon.smithy.model.FromSourceLocation;
import software.amazon.smithy.model.node.ArrayNode;
import software.amazon.smithy.model.node.BooleanNode;
import software.amazon.smithy.model.node.Node;
import software.amazon.smithy.model.node.NodeVisitor;
import software.amazon.smithy.model.node.NullNode;
import software.amazon.smithy.model.node.NumberNode;
import software.amazon.smithy.model.node.ObjectNode;
import software.amazon.smithy.model.node.StringNode;
import software.amazon.smithy.rulesengine.language.eval.RuleEvaluator;
import software.amazon.smithy.rulesengine.language.eval.Scope;
import software.amazon.smithy.rulesengine.language.eval.type.RecordType;
import software.amazon.smithy.rulesengine.language.eval.type.TupleType;
import software.amazon.smithy.rulesengine.language.eval.type.Type;
import software.amazon.smithy.rulesengine.language.eval.value.Value;
import software.amazon.smithy.rulesengine.language.syntax.Identifier;
import software.amazon.smithy.rulesengine.language.syntax.expressions.Expression;
import software.amazon.smithy.rulesengine.language.syntax.expressions.Template;
import software.amazon.smithy.rulesengine.language.visit.ExpressionVisitor;
import software.amazon.smithy.rulesengine.language.visit.TemplateVisitor;
import software.amazon.smithy.utils.SmithyUnstableApi;

/**
 * Literals allow rules and properties to define arbitrarily nested JSON structures (e.g.for properties)
 * <p>
 * They support template strings, but _do not_ support template objects since that creates ambiguity. {@link Template}s
 * are a basic example of literals–literal strings. Literals can also be booleans, objects, integers or tuples.
 */
@SmithyUnstableApi
public abstract class Literal extends Expression {
    Literal(FromSourceLocation sourceLocation) {
        super(sourceLocation.getSourceLocation());
    }

    /**
     * Constructs a tuple literal of values.
     *
     * @param values the values.
     * @return the tuple literal.
     */
    public static Literal tupleLiteral(List<Literal> values) {
        return new TupleLiteral(values, javaLocation());
    }

    /**
     * Constructs a record literal of values.
     *
     * @param record a map of values to be converted to a record.
     * @return the record literal.
     */
    public static Literal recordLiteral(Map<Identifier, Literal> record) {
        return new RecordLiteral(record, javaLocation());
    }

    /**
     * Constructs a string literal from a {@link Template} value.
     *
     * @param value the template value.
     * @return the string literal.
     */
    public static Literal stringLiteral(Template value) {
        return new StringLiteral(value, javaLocation());
    }

    /**
     * Constructs an integer literal from an integer value.
     *
     * @param value the integer value.
     * @return the integer literal.
     */
    public static Literal integerLiteral(int value) {
        return new IntegerLiteral(Node.from(value), javaLocation());
    }

    /**
     * Constructs a bool literal from a boolean value.
     *
     * @param value the boolean value.
     * @return the bool literal.
     */
    public static Literal booleanLiteral(boolean value) {
        return new BooleanLiteral(Node.from(value), javaLocation());
    }

    /**
     * Constructs a literal from a {@link Node} based on the Node's type.
     *
     * @param node a node to construct as a literal.
     * @return the literal representation of the node.
     */
    public static Literal fromNode(Node node) {
        return node.accept(new NodeVisitor<Literal>() {
            @Override
            public Literal arrayNode(ArrayNode arrayNode) {
                List<Literal> elements = arrayNode.getElementsAs(node -> node.accept(this));
                return new TupleLiteral(elements, arrayNode.getSourceLocation());
            }

            @Override
            public Literal booleanNode(BooleanNode booleanNode) {
                return new BooleanLiteral(booleanNode, booleanNode.getSourceLocation());
            }

            @Override
            public Literal nullNode(NullNode nullNode) {
                throw new RuntimeException("null node not supported");
            }

            @Override
            public Literal numberNode(NumberNode numberNode) {
                return new IntegerLiteral(numberNode, numberNode.getSourceLocation());
            }

            @Override
            public Literal objectNode(ObjectNode objectNode) {
                Map<Identifier, Literal> members = new LinkedHashMap<>();
                objectNode.getMembers().forEach((k, v) -> members.put(Identifier.of(k), v.accept(this)));
                return new RecordLiteral(members, objectNode.getSourceLocation());
            }

            @Override
            public Literal stringNode(StringNode stringNode) {
                return new StringLiteral(new Template(stringNode), stringNode.getSourceLocation());
            }
        });
    }

    private Type nodeToType(Literal value, Scope<Type> scope) {
        return value.accept(new LiteralVisitor<Type>() {
            @Override
            public Type visitBoolean(boolean b) {
                return Type.booleanType();
            }

            @Override
            public Type visitString(Template value) {
                return value.typeCheck(scope);
            }

            @Override
            public Type visitRecord(Map<Identifier, Literal> members) {
                Map<Identifier, Type> tpe = new LinkedHashMap<>();
                ((RecordLiteral) value).members().forEach((k, v) -> {
                    tpe.put(k, v.typeCheck(scope));
                });
                return new RecordType(tpe);
            }

            @Override
            public Type visitTuple(List<Literal> members) {
                List<Type> tuples = new ArrayList<>();
                for (Literal el : ((TupleLiteral) value).members()) {
                    tuples.add(el.typeCheck(scope));
                }
                return new TupleType(tuples);
            }

            @Override
            public Type visitInteger(int value) {
                return Type.integerType();
            }
        });
    }

    @Override
    public <R> R accept(ExpressionVisitor<R> visitor) {
        return visitor.visitLiteral(this);
    }

    @Override
    public Type typeCheckLocal(Scope<Type> scope) {
        return nodeToType(this, scope);
    }

    /**
     * @param evaluator the rule-set evaluator.
     * @return the resulting value.
     */
    public Value evaluate(RuleEvaluator evaluator) {
        Literal literal = this;
        return accept(new LiteralVisitor<Value>() {
            @Override
            public Value visitBoolean(boolean b) {
                return Value.booleanValue(b);
            }

            @Override
            public Value visitString(Template value) {
                return Value.stringValue(value.accept(new TemplateVisitor<String>() {
                    @Override
                    public String visitStaticTemplate(String value) {
                        return value;
                    }

                    @Override
                    public String visitSingleDynamicTemplate(Expression value) {
                        return value.accept(evaluator).expectStringValue().getValue();
                    }

                    @Override
                    public String visitStaticElement(String value) {
                        return value;
                    }

                    @Override
                    public String visitDynamicElement(Expression value) {
                        return value.accept(evaluator).expectStringValue().getValue();
                    }

                    @Override
                    public String startMultipartTemplate() {
                        return "";
                    }

                    @Override
                    public String finishMultipartTemplate() {
                        return "";
                    }
                }).collect(Collectors.joining()));
            }

            @Override
            public Value visitRecord(Map<Identifier, Literal> members) {
                Map<Identifier, Value> tpe = new HashMap<>();
                members.forEach((k, v) -> tpe.put(k, v.accept(evaluator)));
                return Value.recordValue(tpe);
            }

            @Override
            public Value visitTuple(List<Literal> members) {
                List<Value> tuples = new ArrayList<>();
                for (Literal el : ((TupleLiteral) literal).members()) {
                    tuples.add(el.accept(evaluator));
                }
                return Value.arrayValue(tuples);
            }

            @Override
            public Value visitInteger(int value) {
                return Value.integerValue(value);
            }
        });
    }

    public abstract <T> T accept(LiteralVisitor<T> visitor);

    public Optional<Boolean> asBoolean() {
        return Optional.empty();
    }

    public Optional<Template> asString() {
        return Optional.empty();
    }

    public Optional<Map<Identifier, Literal>> asRecord() {
        return Optional.empty();
    }

    public Optional<List<Literal>> asTuple() {
        return Optional.empty();
    }

    public Optional<Integer> asInteger() {
        return Optional.empty();
    }
}
