class SingletonObject {
    
    var tempProrty: String!
    
    private static let obj: SingletonObject = {
        return SingletonObject()
    }()
    
    class func singleton() -> SingletonObject {
        return obj
    }
}

SingletonObject.singleton().tempProrty = "Hello 2 You!"
print(SingletonObject.singleton().tempProrty)