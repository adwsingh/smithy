namespace com.example

map A {
  key: smithy.api#String,
  value: smithy.api#String
}
map B{key:String, value:String}

@deprecated
map C {
  key: String,
  value: String
}

@deprecated
@since("1.0")
map D { key : String ,value: String }

@deprecated
@since("1.0")
map E {
  @sensitive @since("1.1") key: String ,
  value:String, // trailing comma
}

@deprecated @since("1.0")
map F {
  @sensitive
  @since("1.1")
  key: String,

  @sensitive
  @since("1.1")
  value: String
}

@deprecated @since("1.0")
map G {
@sensitive
@since("1.1")
key: String
,
@since("1.2")
value: String
}

string String
