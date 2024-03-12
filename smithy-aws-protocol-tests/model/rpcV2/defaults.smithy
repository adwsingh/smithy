$version: "2.0"

namespace aws.protocoltests.rpcv2Cbor

use smithy.protocols#rpcv2Cbor
use smithy.test#httpRequestTests
use smithy.test#httpResponseTests

apply OperationWithDefaults @httpRequestTests([
    {
        id: "RpcV2CborClientPopulatesDefaultValuesInInput"
        documentation: "Client populates default values in input."
        protocol: rpcv2Cbor
        appliesTo: "client"
        tags: ["defaults"]
        method: "POST"
        uri: "/"
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        },
        bodyMediaType: "application/cbor"
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=v2hkZWZhdWx0c7JtZGVmYXVsdFN0cmluZ2JoaW5kZWZhdWx0Qm9vbGVhbvVrZGVmYXVsdExpc3SAcmRlZmF1bHREb2N1bWVudE1hcKB1ZGVmYXVsdERvY3VtZW50U3RyaW5nYmhpdmRlZmF1bHREb2N1bWVudEJvb2xlYW71c2RlZmF1bHREb2N1bWVudExpc3SAcGRlZmF1bHRUaW1lc3RhbXAAa2RlZmF1bHRCbG9iZFlXSmprZGVmYXVsdEJ5dGUBbGRlZmF1bHRTaG9ydAFuZGVmYXVsdEludGVnZXIKa2RlZmF1bHRMb25nGGRsZGVmYXVsdEZsb2F0%2Bz%2FwAAAAAAAAbWRlZmF1bHREb3VibGX7P%2FAAAAAAAABqZGVmYXVsdE1hcKBrZGVmYXVsdEVudW1jRk9PbmRlZmF1bHRJbnRFbnVtAf8%3D
        body: "v2hkZWZhdWx0c7JtZGVmYXVsdFN0cmluZ2JoaW5kZWZhdWx0Qm9vbGVhbvVrZGVmYXVsdExpc3SAcmRlZmF1bHREb2N1bWVudE1hcKB1ZGVmYXVsdERvY3VtZW50U3RyaW5nYmhpdmRlZmF1bHREb2N1bWVudEJvb2xlYW71c2RlZmF1bHREb2N1bWVudExpc3SAcGRlZmF1bHRUaW1lc3RhbXAAa2RlZmF1bHRCbG9iZFlXSmprZGVmYXVsdEJ5dGUBbGRlZmF1bHRTaG9ydAFuZGVmYXVsdEludGVnZXIKa2RlZmF1bHRMb25nGGRsZGVmYXVsdEZsb2F0+z/wAAAAAAAAbWRlZmF1bHREb3VibGX7P/AAAAAAAABqZGVmYXVsdE1hcKBrZGVmYXVsdEVudW1jRk9PbmRlZmF1bHRJbnRFbnVtAf8="
        params: {
            defaults: {}
        }
    }
    {
        id: "RpcV2CborClientSkipsTopLevelDefaultValuesInInput"
        documentation: "Client skips top level default values in input."
        appliesTo: "client"
        tags: ["defaults"]
        protocol: rpcv2Cbor
        method: "POST"
        bodyMediaType: "application/cbor"
        uri: "/"
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        },
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=v%2F8%3D
        body: "v/8="
        params: {
        }
    }
    {
        id: "RpcV2CborClientUsesExplicitlyProvidedMemberValuesOverDefaults"
        documentation: "Client uses explicitly provided member values over defaults"
        appliesTo: "client"
        tags: ["defaults"]
        protocol: rpcv2Cbor
        method: "POST"
        bodyMediaType: "application/cbor"
        uri: "/"
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        },
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=v2hkZWZhdWx0c7NtZGVmYXVsdFN0cmluZ2NieWVuZGVmYXVsdEJvb2xlYW71a2RlZmF1bHRMaXN0gWFhcmRlZmF1bHREb2N1bWVudE1hcKFkbmFtZWRKYWNrdWRlZmF1bHREb2N1bWVudFN0cmluZ2NieWV2ZGVmYXVsdERvY3VtZW50Qm9vbGVhbvVzZGVmYXVsdERvY3VtZW50TGlzdIFhYnNkZWZhdWx0TnVsbERvY3VtZW50Z25vdE51bGxwZGVmYXVsdFRpbWVzdGFtcAFrZGVmYXVsdEJsb2JiaGlrZGVmYXVsdEJ5dGUCbGRlZmF1bHRTaG9ydAJuZGVmYXVsdEludGVnZXIUa2RlZmF1bHRMb25nGMhsZGVmYXVsdEZsb2F0%2B0AAAAAAAAAAbWRlZmF1bHREb3VibGX7QAAAAAAAAABqZGVmYXVsdE1hcKFkbmFtZWRKYWNra2RlZmF1bHRFbnVtY0JBUm5kZWZhdWx0SW50RW51bQL%2F
        body: "v2hkZWZhdWx0c7NtZGVmYXVsdFN0cmluZ2NieWVuZGVmYXVsdEJvb2xlYW71a2RlZmF1bHRMaXN0gWFhcmRlZmF1bHREb2N1bWVudE1hcKFkbmFtZWRKYWNrdWRlZmF1bHREb2N1bWVudFN0cmluZ2NieWV2ZGVmYXVsdERvY3VtZW50Qm9vbGVhbvVzZGVmYXVsdERvY3VtZW50TGlzdIFhYnNkZWZhdWx0TnVsbERvY3VtZW50Z25vdE51bGxwZGVmYXVsdFRpbWVzdGFtcAFrZGVmYXVsdEJsb2JiaGlrZGVmYXVsdEJ5dGUCbGRlZmF1bHRTaG9ydAJuZGVmYXVsdEludGVnZXIUa2RlZmF1bHRMb25nGMhsZGVmYXVsdEZsb2F0+0AAAAAAAAAAbWRlZmF1bHREb3VibGX7QAAAAAAAAABqZGVmYXVsdE1hcKFkbmFtZWRKYWNra2RlZmF1bHRFbnVtY0JBUm5kZWZhdWx0SW50RW51bQL/"
        params: {
            defaults: {
                defaultString: "bye",
                defaultBoolean: true,
                defaultList: ["a"],
                defaultDocumentMap: {name: "Jack"},
                defaultDocumentString: "bye",
                defaultDocumentBoolean: true,
                defaultDocumentList: ["b"],
                defaultNullDocument: "notNull",
                defaultTimestamp: 1,
                defaultBlob: "hi",
                defaultByte: 2,
                defaultShort: 2,
                defaultInteger: 20,
                defaultLong: 200,
                defaultFloat: 2.0,
                defaultDouble: 2.0,
                defaultMap: {name: "Jack"},
                defaultEnum: "BAR",
                defaultIntEnum: 2
            }
        }
    }
    {
        id: "RpcV2CborServerPopulatesDefaultsWhenMissingInRequestBody"
        documentation: "Server populates default values when missing in request body."
        appliesTo: "server"
        tags: ["defaults"]
        protocol: rpcv2Cbor
        method: "POST"
        bodyMediaType: "application/cbor"
        uri: "/"
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Accept": "application/cbor",
            "Content-Type": "application/cbor"
        },
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=v2hkZWZhdWx0c6D%2F
        body: "v2hkZWZhdWx0c6D/"
        params: {
            defaults: {
                defaultString: "hi"
                defaultBoolean: true
                defaultList: []
                defaultDocumentMap: {}
                defaultDocumentString: "hi"
                defaultDocumentBoolean: true
                defaultDocumentList: []
                defaultTimestamp: 0
                defaultBlob: "abc"
                defaultByte: 1
                defaultShort: 1
                defaultInteger: 10
                defaultLong: 100
                defaultFloat: 1.0
                defaultDouble: 1.0
                defaultMap: {}
                defaultEnum: "FOO"
                defaultIntEnum: 1
            },
            topLevelDefault: "hi"
        }
    }
])

apply OperationWithDefaults @httpResponseTests([
    {
        id: "RpcV2CborClientPopulatesDefaultsValuesWhenMissingInResponse"
        documentation: "Client populates default values when missing in response."
        appliesTo: "client"
        tags: ["defaults"]
        protocol: rpcv2Cbor
        code: 200
        bodyMediaType: "application/cbor"
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Content-Type": "application/cbor"
        },
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=v%2F8%3D
        body: "v/8="
        params: {
            defaultString: "hi"
            defaultBoolean: true
            defaultList: []
            defaultDocumentMap: {}
            defaultDocumentString: "hi"
            defaultDocumentBoolean: true
            defaultDocumentList: []
            defaultTimestamp: 0
            defaultBlob: "abc"
            defaultByte: 1
            defaultShort: 1
            defaultInteger: 10
            defaultLong: 100
            defaultFloat: 1.0
            defaultDouble: 1.0
            defaultMap: {}
            defaultEnum: "FOO"
            defaultIntEnum: 1
        }
    }
    {
        id: "RpcV2CborClientIgnoresDefaultValuesIfMemberValuesArePresentInResponse"
        documentation: "Client ignores default values if member values are present in the response."
        appliesTo: "client"
        tags: ["defaults"]
        protocol: rpcv2Cbor
        code: 200
        bodyMediaType: "application/cbor"
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Content-Type": "application/cbor"
        },
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=v21kZWZhdWx0U3RyaW5nY2J5ZW5kZWZhdWx0Qm9vbGVhbvRrZGVmYXVsdExpc3SBYWFyZGVmYXVsdERvY3VtZW50TWFwoWRuYW1lZEphY2t1ZGVmYXVsdERvY3VtZW50U3RyaW5nY2J5ZXZkZWZhdWx0RG9jdW1lbnRCb29sZWFu9HNkZWZhdWx0RG9jdW1lbnRMaXN0gWFic2RlZmF1bHROdWxsRG9jdW1lbnRnbm90TnVsbHBkZWZhdWx0VGltZXN0YW1wAmtkZWZhdWx0QmxvYmJoaWtkZWZhdWx0Qnl0ZQJsZGVmYXVsdFNob3J0Am5kZWZhdWx0SW50ZWdlchRrZGVmYXVsdExvbmcYyGxkZWZhdWx0RmxvYXT7QAAAAAAAAABtZGVmYXVsdERvdWJsZftAAAAAAAAAAGpkZWZhdWx0TWFwoWRuYW1lZEphY2trZGVmYXVsdEVudW1jQkFSbmRlZmF1bHRJbnRFbnVtAv8%3D
        body: "v21kZWZhdWx0U3RyaW5nY2J5ZW5kZWZhdWx0Qm9vbGVhbvRrZGVmYXVsdExpc3SBYWFyZGVmYXVsdERvY3VtZW50TWFwoWRuYW1lZEphY2t1ZGVmYXVsdERvY3VtZW50U3RyaW5nY2J5ZXZkZWZhdWx0RG9jdW1lbnRCb29sZWFu9HNkZWZhdWx0RG9jdW1lbnRMaXN0gWFic2RlZmF1bHROdWxsRG9jdW1lbnRnbm90TnVsbHBkZWZhdWx0VGltZXN0YW1wAmtkZWZhdWx0QmxvYmJoaWtkZWZhdWx0Qnl0ZQJsZGVmYXVsdFNob3J0Am5kZWZhdWx0SW50ZWdlchRrZGVmYXVsdExvbmcYyGxkZWZhdWx0RmxvYXT7QAAAAAAAAABtZGVmYXVsdERvdWJsZftAAAAAAAAAAGpkZWZhdWx0TWFwoWRuYW1lZEphY2trZGVmYXVsdEVudW1jQkFSbmRlZmF1bHRJbnRFbnVtAv8="
        params: {
            defaultString: "bye",
            defaultBoolean: false,
            defaultList: ["a"],
            defaultDocumentMap: {name: "Jack"},
            defaultDocumentString: "bye",
            defaultDocumentBoolean: false,
            defaultDocumentList: ["b"],
            defaultNullDocument: "notNull",
            defaultTimestamp: 2,
            defaultBlob: "hi",
            defaultByte: 2,
            defaultShort: 2,
            defaultInteger: 20,
            defaultLong: 200,
            defaultFloat: 2.0,
            defaultDouble: 2.0,
            defaultMap: {name: "Jack"},
            defaultEnum: "BAR",
            defaultIntEnum: 2
        }
    }
    {
        id: "RpcV2CborServerPopulatesDefaultsInResponseWhenMissingInParams"
        documentation: "Server populates default values in response when missing in params."
        appliesTo: "server"
        tags: ["defaults"]
        protocol: rpcv2Cbor
        code: 200
        bodyMediaType: "application/cbor"
        headers: {
            "smithy-protocol": "rpc-v2-cbor",
            "Content-Type": "application/cbor"
        },
        // http://ec2-54-84-9-83.compute-1.amazonaws.com/hex?value=v21kZWZhdWx0U3RyaW5nYmhpbmRlZmF1bHRCb29sZWFu9WtkZWZhdWx0TGlzdIByZGVmYXVsdERvY3VtZW50TWFwoHVkZWZhdWx0RG9jdW1lbnRTdHJpbmdiaGl2ZGVmYXVsdERvY3VtZW50Qm9vbGVhbvVzZGVmYXVsdERvY3VtZW50TGlzdIBwZGVmYXVsdFRpbWVzdGFtcABrZGVmYXVsdEJsb2JkWVdKamtkZWZhdWx0Qnl0ZQFsZGVmYXVsdFNob3J0AW5kZWZhdWx0SW50ZWdlcgprZGVmYXVsdExvbmcYZGxkZWZhdWx0RmxvYXT7P%2FAAAAAAAABtZGVmYXVsdERvdWJsZfs%2F8AAAAAAAAGpkZWZhdWx0TWFwoGtkZWZhdWx0RW51bWNGT09uZGVmYXVsdEludEVudW0B%2Fw%3D%3D
        body: "v21kZWZhdWx0U3RyaW5nYmhpbmRlZmF1bHRCb29sZWFu9WtkZWZhdWx0TGlzdIByZGVmYXVsdERvY3VtZW50TWFwoHVkZWZhdWx0RG9jdW1lbnRTdHJpbmdiaGl2ZGVmYXVsdERvY3VtZW50Qm9vbGVhbvVzZGVmYXVsdERvY3VtZW50TGlzdIBwZGVmYXVsdFRpbWVzdGFtcABrZGVmYXVsdEJsb2JkWVdKamtkZWZhdWx0Qnl0ZQFsZGVmYXVsdFNob3J0AW5kZWZhdWx0SW50ZWdlcgprZGVmYXVsdExvbmcYZGxkZWZhdWx0RmxvYXT7P/AAAAAAAABtZGVmYXVsdERvdWJsZfs/8AAAAAAAAGpkZWZhdWx0TWFwoGtkZWZhdWx0RW51bWNGT09uZGVmYXVsdEludEVudW0B/w=="
        params: {}
    }
])

operation OperationWithDefaults {
    input := {
        defaults: Defaults

        topLevelDefault: String = "hi" // Client should ignore default values in input shape
    }

    output := with [DefaultsMixin] {}
}

structure Defaults with [DefaultsMixin] {}

@mixin
structure DefaultsMixin {
    defaultString: String = "hi"
    defaultBoolean: Boolean = true
    defaultList: TestStringList = []
    defaultTimestamp: Timestamp = 0
    defaultBlob: Blob = "abc"
    defaultByte: Byte = 1
    defaultShort: Short = 1
    defaultInteger: Integer = 10
    defaultLong: Long = 100
    defaultFloat: Float = 1.0
    defaultDouble: Double = 1.0
    defaultMap: TestStringMap = {}
    defaultEnum: TestEnum = "FOO"
    defaultIntEnum: TestIntEnum = 1
}

list TestStringList {
    member: String
}

map TestStringMap {
    key: String
    value: String
}

enum TestEnum {
    FOO
    BAR
    BAZ
}

intEnum TestIntEnum {
    ONE = 1
    TWO = 2
}
