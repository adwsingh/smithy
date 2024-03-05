$version: "2.0"

namespace aws.protocoltests.rpcv2Cbor

use smithy.protocols#rpcv2Cbor
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests


@httpRequestTests([
    {
        id: "RpcV2CborSimpleScalarProperties",
        protocol: rpcv2Cbor,
        documentation: "Serializes simple scalar properties",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        }
        method: "POST",
        bodyMediaType: "application/cbor",
        uri: "/service/RpcV2Protocol/operation/SimpleScalarProperties",
        body: "v2lieXRlVmFsdWUFa2RvdWJsZVZhbHVl+z/+OVgQYk3TcWZhbHNlQm9vbGVhblZhbHVl9GpmbG9hdFZhbHVl+kDz989saW50ZWdlclZhbHVlGQEAaWxvbmdWYWx1ZRkmkWpzaG9ydFZhbHVlGSaqa3N0cmluZ1ZhbHVlZnNpbXBsZXB0cnVlQm9vbGVhblZhbHVl9f8="
        params: {
            byteValue: 5,
            doubleValue: 1.889,
            falseBooleanValue: false,
            floatValue: 7.624,
            integerValue: 256,
            longValue: 9873,
            shortValue: 9898,
            stringValue: "simple",
            trueBooleanValue: true
        }
    },
    {
        id: "RpcV2CborSimpleScalarPropertiesUsingIndefiniteLength",
        protocol: rpcv2Cbor,
        documentation: "Serializes simple scalar properties using definite length map",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        }
        method: "POST",
        bodyMediaType: "application/cbor",
        uri: "/service/RpcV2Protocol/operation/SimpleScalarProperties",
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=qWlieXRlVmFsdWUFa2RvdWJsZVZhbHVl%2Bz%2F%2BOVgQYk3TcWZhbHNlQm9vbGVhblZhbHVl9GpmbG9hdFZhbHVl%2BkDz989saW50ZWdlclZhbHVlGQEAaWxvbmdWYWx1ZRkmkWpzaG9ydFZhbHVlGSaqa3N0cmluZ1ZhbHVlZnNpbXBsZXB0cnVlQm9vbGVhblZhbHVl9Q%3D%3D
        body: "qWlieXRlVmFsdWUFa2RvdWJsZVZhbHVl+z/+OVgQYk3TcWZhbHNlQm9vbGVhblZhbHVl9GpmbG9hdFZhbHVl+kDz989saW50ZWdlclZhbHVlGQEAaWxvbmdWYWx1ZRkmkWpzaG9ydFZhbHVlGSaqa3N0cmluZ1ZhbHVlZnNpbXBsZXB0cnVlQm9vbGVhblZhbHVl9Q=="
        params: {
            byteValue: 5,
            doubleValue: 1.889,
            falseBooleanValue: false,
            floatValue: 7.624,
            integerValue: 256,
            longValue: 9873,
            shortValue: 9898,
            stringValue: "simple",
            trueBooleanValue: true
        }
    },
    {
        id: "RpcV2CborClientDoesntSerializeNullStructureValues",
        documentation: "RpcV2 Cbor should not serialize null structure values",
        protocol: rpcv2Cbor,
        method: "POST",
        uri: "/service/RpcV2Protocol/operation/SimpleScalarProperties",
        body: "v/8=",
        bodyMediaType: "application/cbor",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        }
        params: {
            stringValue: null
        },
        appliesTo: "client"
    },
    {
        id: "RpcV2CborServerDoesntDeSerializeNullStructureValues",
        documentation: "RpcV2 Cbor should not deserialize null structure values",
        protocol: rpcv2Cbor,
        method: "POST",
        uri: "/service/RpcV2Protocol/operation/SimpleScalarProperties",
        body: "v2tzdHJpbmdWYWx1Zfb/",
        bodyMediaType: "application/cbor",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        }
        params: {},
        appliesTo: "server"
    },
    {
        id: "RpcV2CborSupportsNaNFloatInputs",
        protocol: rpcv2Cbor,
        documentation: "Supports handling NaN float values.",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        }
        method: "POST",
        bodyMediaType: "application/cbor",
        uri: "/service/RpcV2Protocol/operation/SimpleScalarProperties",
        body: "v2tkb3VibGVWYWx1Zft/+AAAAAAAAGpmbG9hdFZhbHVl+n/AAAD/"
        params: {
            doubleValue: "NaN",
            floatValue: "NaN"
        }
    },
    {
        id: "RpcV2CborSupportsInfinityFloatInputs",
        protocol: rpcv2Cbor,
        documentation: "Supports handling Infinity float values.",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        }
        method: "POST",
        bodyMediaType: "application/cbor",
        uri: "/service/RpcV2Protocol/operation/SimpleScalarProperties",
        body: "v2tkb3VibGVWYWx1Zft/8AAAAAAAAGpmbG9hdFZhbHVl+n+AAAD/"
        params: {
            doubleValue: "Infinity",
            floatValue: "Infinity"
        }
    },
    {
        id: "RpcV2CborSupportsNegativeInfinityFloatInputs",
        protocol: rpcv2Cbor,
        documentation: "Supports handling Infinity float values.",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        }
        method: "POST",
        bodyMediaType: "application/cbor",
        uri: "/service/RpcV2Protocol/operation/SimpleScalarProperties",
        body: "v2tkb3VibGVWYWx1Zfv/8AAAAAAAAGpmbG9hdFZhbHVl+v+AAAD/"
        params: {
            doubleValue: "-Infinity",
            floatValue: "-Infinity"
        }
    },
    {
        id: "RpcV2CborSupportsIndefiniteLengthStrings",
        protocol: rpcv2Cbor,
        documentation: "Supports indefinite length text strings.",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        }
        method: "POST",
        bodyMediaType: "application/cbor",
        uri: "/service/RpcV2Protocol/operation/SimpleScalarProperties",
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=oWtzdHJpbmdWYWx1ZX94HUFuIGV4YW1wbGUgaW5kZWZpbml0ZSBzdHJpbmcscSBjaHVua2VkIG9uIGNvbW1h%2Fw%3D%3D
        body: "oWtzdHJpbmdWYWx1ZX94HUFuIGV4YW1wbGUgaW5kZWZpbml0ZSBzdHJpbmcscSBjaHVua2VkIG9uIGNvbW1h/w=="
        params: {
            stringValue: "An example indefinite string, chunked on comma"
        }
    },
    {
        id: "RpcV2CborSupportsIndefiniteLengthByteStrings",
        protocol: rpcv2Cbor,
        documentation: "Supports indefinite length byte strings.",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        }
        method: "POST",
        bodyMediaType: "application/cbor",
        uri: "/service/RpcV2Protocol/operation/SimpleScalarProperties",
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=oWtzdHJpbmdWYWx1ZV9YIkFuIGV4YW1wbGUgaW5kZWZpbml0ZS1ieXRlIHN0cmluZyxRIGNodW5rZWQgb24gY29tbWH%2F
        body: "oWtzdHJpbmdWYWx1ZV9YIkFuIGV4YW1wbGUgaW5kZWZpbml0ZS1ieXRlIHN0cmluZyxRIGNodW5rZWQgb24gY29tbWH/"
        params: {
            stringValue: "An example indefinite-byte string, chunked on comma"
        }
    },
    {
        id: "RpcV2CborSupportsUpcastingData",
        protocol: rpcv2Cbor,
        documentation: "Supports upcasting from a smaller byte representation of the same date type.",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        }
        method: "POST",
        bodyMediaType: "application/cbor",
        uri: "/service/RpcV2Protocol/operation/SimpleScalarProperties",
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=v2tkb3VibGVWYWx1Zfk%2FjmpmbG9hdFZhbHVl%2BUegbGludGVnZXJWYWx1ZRg4aWxvbmdWYWx1ZRkBAGpzaG9ydFZhbHVlCv8%3D
        body: "v2tkb3VibGVWYWx1Zfk/jmpmbG9hdFZhbHVl+UegbGludGVnZXJWYWx1ZRg4aWxvbmdWYWx1ZRkBAGpzaG9ydFZhbHVlCv8="
        params: {
            doubleValue: 1.889,
            floatValue: 7.624,
            integerValue: 56,
            longValue: 256,
            shortValue: 10
        }
    },
])
@httpResponseTests([
    {
        id: "RpcV2CborSimpleScalarProperties",
        protocol: rpcv2Cbor,
        documentation: "Serializes simple scalar properties",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Content-Type": "application/cbor"
        }
        bodyMediaType: "application/cbor",
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=v3B0cnVlQm9vbGVhblZhbHVl9XFmYWxzZUJvb2xlYW5WYWx1ZfRpYnl0ZVZhbHVlBWtkb3VibGVWYWx1Zfs%2F%2FjlYEGJN02pmbG9hdFZhbHVl%2BkDz989saW50ZWdlclZhbHVlGQEAanNob3J0VmFsdWUZJqprc3RyaW5nVmFsdWVmc2ltcGxl%2Fw%3D%3D
        body: "v3B0cnVlQm9vbGVhblZhbHVl9XFmYWxzZUJvb2xlYW5WYWx1ZfRpYnl0ZVZhbHVlBWtkb3VibGVWYWx1Zfs//jlYEGJN02pmbG9hdFZhbHVl+kDz989saW50ZWdlclZhbHVlGQEAanNob3J0VmFsdWUZJqprc3RyaW5nVmFsdWVmc2ltcGxl/w=="
        code: 200,
        params: {
            trueBooleanValue: true,
            falseBooleanValue: false,
            byteValue: 5,
            doubleValue: 1.889,
            floatValue: 7.624,
            integerValue: 256,
            shortValue: 9898,
            stringValue: "simple"
        }
    },
    {
        id: "RpcV2CborClientDoesntDeSerializeNullStructureValues",
        documentation: "RpcV2 Cbor should deserialize null structure values",
        protocol: rpcv2Cbor,
        body: "v2tzdHJpbmdWYWx1Zfb/",
        code: 200,
        bodyMediaType: "application/cbor",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Content-Type": "application/cbor"
        }
        params: {}
        appliesTo: "client"
    },
    {
        id: "RpcV2CborServerDoesntSerializeNullStructureValues",
        documentation: "RpcV2 Cbor should not serialize null structure values",
        protocol: rpcv2Cbor,
        body: "v/8=",
        code: 200,
        bodyMediaType: "application/cbor",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Content-Type": "application/cbor"
        }
        params: {
            stringValue: null
        },
        appliesTo: "server"
    },
    {
        id: "RpcV2CborSupportsNaNFloatOutputs",
        protocol: rpcv2Cbor,
        documentation: "Supports handling NaN float values.",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Content-Type": "application/cbor"
        },
        code: 200,
        bodyMediaType: "application/cbor",
        body: "v2tkb3VibGVWYWx1Zft/+AAAAAAAAGpmbG9hdFZhbHVl+n/AAAD/"
        params: {
            doubleValue: "NaN",
            floatValue: "NaN"
        }
    },
    {
        id: "RpcV2CborSupportsInfinityFloatOutputs",
        protocol: rpcv2Cbor,
        documentation: "Supports handling Infinity float values.",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Content-Type": "application/cbor"
        },
        code: 200,
        bodyMediaType: "application/cbor",
        body: "v2tkb3VibGVWYWx1Zft/8AAAAAAAAGpmbG9hdFZhbHVl+n+AAAD/"
        params: {
            doubleValue: "Infinity",
            floatValue: "Infinity"
        }
    },
    {
        id: "RpcV2CborSupportsNegativeInfinityFloatOutputs",
        protocol: rpcv2Cbor,
        documentation: "Supports handling Negative Infinity float values.",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Content-Type": "application/cbor"
        },
        code: 200,
        bodyMediaType: "application/cbor",
        body: "v2tkb3VibGVWYWx1Zfv/8AAAAAAAAGpmbG9hdFZhbHVl+v+AAAD/"
        params: {
            doubleValue: "-Infinity",
            floatValue: "-Infinity"
        }
    }
])
operation SimpleScalarProperties {
    input: SimpleScalarStructure,
    output: SimpleScalarStructure
}

apply RecursiveShapes @httpRequestTests([
    {
        id: "RpcV2CborRecursiveShapes",
        documentation: "Serializes recursive structures",
        protocol: rpcv2Cbor,
        method: "POST",
        uri: "/service/RpcV2Protocol/operation/RecursiveShapes",
        body: "v2ZuZXN0ZWS/Y2Zvb2RGb28xZm5lc3RlZL9jYmFyZEJhcjFvcmVjdXJzaXZlTWVtYmVyv2Nmb29kRm9vMmZuZXN0ZWS/Y2JhcmRCYXIy//////8=",
        bodyMediaType: "application/cbor",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        },
        params: {
            nested: {
                foo: "Foo1",
                nested: {
                    bar: "Bar1",
                    recursiveMember: {
                        foo: "Foo2",
                        nested: {
                            bar: "Bar2"
                        }
                    }
                }
            }
        }
    }
])

apply RecursiveShapes @httpResponseTests([
    {
        id: "RpcV2CborRecursiveShapes",
        documentation: "Serializes recursive structures",
        protocol: rpcv2Cbor,
        code: 200,
        body: "v2ZuZXN0ZWS/Y2Zvb2RGb28xZm5lc3RlZL9jYmFyZEJhcjFvcmVjdXJzaXZlTWVtYmVyv2Nmb29kRm9vMmZuZXN0ZWS/Y2JhcmRCYXIy//////8=",
        bodyMediaType: "application/cbor",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Content-Type": "application/cbor"
        },
        params: {
            nested: {
                foo: "Foo1",
                nested: {
                    bar: "Bar1",
                    recursiveMember: {
                        foo: "Foo2",
                        nested: {
                            bar: "Bar2"
                        }
                    }
                }
            }
        }
    }
])

operation RecursiveShapes {
    input: RecursiveShapesInputOutput,
    output: RecursiveShapesInputOutput
}

structure RecursiveShapesInputOutput {
    nested: RecursiveShapesInputOutputNested1
}

structure RecursiveShapesInputOutputNested1 {
    foo: String,
    nested: RecursiveShapesInputOutputNested2
}

structure RecursiveShapesInputOutputNested2 {
    bar: String,
    recursiveMember: RecursiveShapesInputOutputNested1,
}


structure SimpleScalarStructure {
    trueBooleanValue: Boolean,
    falseBooleanValue: Boolean,
    byteValue: Byte,
    doubleValue: Double,
    floatValue: Float,
    integerValue: Integer,
    longValue: Long,
    shortValue: Short,
    stringValue: String,
}


apply DefaultFieldInputOutput @httpRequestTests([
    {
        id: "RpcV2CborEmptyInputShouldSerializeDefaultValues",
        documentation: "Serializes an empty input with default values filled in.",
        protocol: rpcv2Cbor,
        method: "POST",
        uri: "/service/RpcV2Protocol/operation/DefaultFieldInputOutput",
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=qWlieXRlVmFsdWUFa2RvdWJsZVZhbHVl%2Bz%2F%2BOVgQYk3TcWZhbHNlQm9vbGVhblZhbHVl9GpmbG9hdFZhbHVl%2BkDz989saW50ZWdlclZhbHVlGQEAaWxvbmdWYWx1ZRkmkWpzaG9ydFZhbHVlGSaqa3N0cmluZ1ZhbHVlZnNpbXBsZXB0cnVlQm9vbGVhblZhbHVl9Q%3D%3D        body: "qWlieXRlVmFsdWUFa2RvdWJsZVZhbHVl+z/+OVgQYk3TcWZhbHNlQm9vbGVhblZhbHVl9GpmbG9hdFZhbHVl+kDz989saW50ZWdlclZhbHVlGQEAaWxvbmdWYWx1ZRkmkWpzaG9ydFZhbHVlGSaqa3N0cmluZ1ZhbHVlZnNpbXBsZXB0cnVlQm9vbGVhblZhbHVl9Q=="
        bodyMediaType: "application/cbor",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        },
        params: {
        }
    },
    {
        id: "RpcV2CborEmptyInputServerShouldFillDefault",
        documentation: "Server should fill in the default values when it deserializes an empty input.",
        protocol: rpcv2Cbor,
        method: "POST",
        uri: "/service/RpcV2Protocol/operation/DefaultFieldInputOutput",
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=oA%3D%3D
        body: "oA=="
        bodyMediaType: "application/cbor",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        },
        params: {
            byteValue: 5,
            doubleValue: 1.889,
            falseBooleanValue: false,
            floatValue: 7.624,
            integerValue: 256,
            longValue: 9873,
            shortValue: 9898,
            stringValue: "simple",
            trueBooleanValue: true
        },
        appliesTo: "server"
    },
    {
        id: "RpcV2CborSomeDefaultValuesLeftOut",
        documentation: "Left over default values should be filled in.",
        protocol: rpcv2Cbor,
        method: "POST",
        uri: "/service/RpcV2Protocol/operation/DefaultFieldInputOutput",
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=qWlieXRlVmFsdWUAa2RvdWJsZVZhbHVl%2B0AHHKwIMSbpcWZhbHNlQm9vbGVhblZhbHVl9WpmbG9hdFZhbHVl%2BkBPXClsaW50ZWdlclZhbHVlGDhpbG9uZ1ZhbHVlGSaRanNob3J0VmFsdWUZJqprc3RyaW5nVmFsdWVmc2ltcGxlcHRydWVCb29sZWFuVmFsdWX0
        body: "qWlieXRlVmFsdWUAa2RvdWJsZVZhbHVl+0AHHKwIMSbpcWZhbHNlQm9vbGVhblZhbHVl9WpmbG9hdFZhbHVl+kBPXClsaW50ZWdlclZhbHVlGDhpbG9uZ1ZhbHVlGSaRanNob3J0VmFsdWUZJqprc3RyaW5nVmFsdWVmc2ltcGxlcHRydWVCb29sZWFuVmFsdWX0"
        bodyMediaType: "application/cbor",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        },
        params: {
            byteValue: 0,
            doubleValue: 2.889,
            falseBooleanValue: true,
            floatValue: 3.24,
            integerValue: 56,
            trueBooleanValue: false
        },
    },
    {
        id: "RpcV2CborServerShouldFillLeftoutDefaultValues",
        documentation: "The server should populate the remaining default values when it receives
            a request that lacks values for fields with defaults defined in the model.",
        protocol: rpcv2Cbor,
        method: "POST",
        uri: "/service/RpcV2Protocol/operation/DefaultFieldInputOutput",
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=pmlieXRlVmFsdWUAa2RvdWJsZVZhbHVl%2B0AHHKwIMSbpcWZhbHNlQm9vbGVhblZhbHVl9WpmbG9hdFZhbHVl%2BkBPXClsaW50ZWdlclZhbHVlGDhwdHJ1ZUJvb2xlYW5WYWx1ZfQ%3D
        body: "pmlieXRlVmFsdWUAa2RvdWJsZVZhbHVl+0AHHKwIMSbpcWZhbHNlQm9vbGVhblZhbHVl9WpmbG9hdFZhbHVl+kBPXClsaW50ZWdlclZhbHVlGDhwdHJ1ZUJvb2xlYW5WYWx1ZfQ="
        bodyMediaType: "application/cbor",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        },
        params: {
            byteValue: 0,
            doubleValue: 2.889,
            falseBooleanValue: true,
            floatValue: 3.24,
            integerValue: 56,
            longValue: 9873,
            shortValue: 9898,
            stringValue: "simple",
            trueBooleanValue: false
        },
        appliesTo: "server"
    }
])

apply DefaultFieldInputOutput @httpResponseTests([
    {
        id: "RpcV2CborEmptyOutputShouldSerializeDefaultValues",
        documentation: "Serializes an empty output with default values filled in.",
        protocol: rpcv2Cbor,
        code: 200,
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=qWlieXRlVmFsdWUFa2RvdWJsZVZhbHVl%2Bz%2F%2BOVgQYk3TcWZhbHNlQm9vbGVhblZhbHVl9GpmbG9hdFZhbHVl%2BkDz989saW50ZWdlclZhbHVlGQEAaWxvbmdWYWx1ZRkmkWpzaG9ydFZhbHVlGSaqa3N0cmluZ1ZhbHVlZnNpbXBsZXB0cnVlQm9vbGVhblZhbHVl9Q%3D%3D
        body: "qWlieXRlVmFsdWUFa2RvdWJsZVZhbHVl+z/+OVgQYk3TcWZhbHNlQm9vbGVhblZhbHVl9GpmbG9hdFZhbHVl+kDz989saW50ZWdlclZhbHVlGQEAaWxvbmdWYWx1ZRkmkWpzaG9ydFZhbHVlGSaqa3N0cmluZ1ZhbHVlZnNpbXBsZXB0cnVlQm9vbGVhblZhbHVl9Q=="
        bodyMediaType: "application/cbor",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Content-Type": "application/cbor"
        },
        params: {
        }
    },
    {
        id: "RpcV2CborSomeDefaultValuesLeftOut",
        documentation: "Left over default values should be filled in.",
        protocol: rpcv2Cbor,
        code: 200,
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=qWlieXRlVmFsdWUAa2RvdWJsZVZhbHVl%2B0AHHKwIMSbpcWZhbHNlQm9vbGVhblZhbHVl9WpmbG9hdFZhbHVl%2BkBPXClsaW50ZWdlclZhbHVlGDhpbG9uZ1ZhbHVlGSaRanNob3J0VmFsdWUZJqprc3RyaW5nVmFsdWVmc2ltcGxlcHRydWVCb29sZWFuVmFsdWX0
        body: "qWlieXRlVmFsdWUAa2RvdWJsZVZhbHVl+0AHHKwIMSbpcWZhbHNlQm9vbGVhblZhbHVl9WpmbG9hdFZhbHVl+kBPXClsaW50ZWdlclZhbHVlGDhpbG9uZ1ZhbHVlGSaRanNob3J0VmFsdWUZJqprc3RyaW5nVmFsdWVmc2ltcGxlcHRydWVCb29sZWFuVmFsdWX0"
        bodyMediaType: "application/cbor",
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Content-Type": "application/cbor"
        },
        params: {
            byteValue: 0,
            doubleValue: 2.889,
            falseBooleanValue: true,
            floatValue: 3.24,
            integerValue: 56,
            trueBooleanValue: false
        },
    }
])

operation DefaultFieldInputOutput {
    input: DefaultFieldStructure,
    output: DefaultFieldStructure
}

structure DefaultFieldStructure {
    @default(true)
    trueBooleanValue: Boolean,
    @default(false)
    falseBooleanValue: Boolean,
    @default(1)
    byteValue: Byte,
    @default(1.889)
    doubleValue: Double,
    @default(7.624)
    floatValue: Float,
    @default(256)
    integerValue: Integer,
    @default(9873)
    longValue: Long,
    @default(9898)
    shortValue: Short,
    @default("simple"),
    stringValue: String,
}
