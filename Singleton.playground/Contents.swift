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


/*class SingletonObject {
    
    private var property: String!
    
    var Property: String! {
        get {
            return property
        }
        set {
            if property == nil {
               property = newValue
            }
        }
    }
    
    private static let obj: SingletonObject = {
        return SingletonObject()
    }()
    
    class func singleton() -> SingletonObject {
        return obj
    }
}*/

SingletonObject.singleton().tempProrty = "Hello 3 You!"
print(SingletonObject.singleton().tempProrty)

SingletonObject.singleton().tempProrty = "Hello 2 You!"
print(SingletonObject.singleton().tempProrty)