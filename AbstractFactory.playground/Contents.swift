//general
protocol GenericIPhone {
    var osName: String { get }
    var productName: String { get }
}

protocol GenericIPad {
    var osName: String { get }
    var productName: String { get }
    var screenSize: Double { get }
}

protocol IPhoneFactory {
    func getIPhone() -> GenericIPhone
    func getIPad() -> GenericIPad
}

//apple
class AppleIPhone: GenericIPhone {
    var osName = "iOS"
    var productName = "iPhone"
}
class AppleIPad: GenericIPad {
    var osName = "iOS"
    var productName = "iPad"
    var screenSize = 7.7
}

//china
class ChinaPhone: GenericIPhone {
    var osName = "Android"
    var productName = "Chi Huan Hua Phone"
}

class ChinaPad: GenericIPad {
    var osName = "Windows CE"
    var productName = "Buan Que Ipado Killa"
    var screenSize = 12.5
}

//apple
class AppleFactory: IPhoneFactory {
    func getIPhone() -> GenericIPhone {
        return AppleIPhone()
    }
    func getIPad() -> GenericIPad {
        return AppleIPad()
    }
}

//china
class ChinaFactory: IPhoneFactory {
    func getIPhone() -> GenericIPhone {
        return ChinaPhone()
    }
    func getIPad() -> GenericIPad {
        return ChinaPad()
    }
}

var isThirdWorld = true
func getFactory() -> IPhoneFactory {
    return isThirdWorld ? AppleFactory() : ChinaFactory()
}

isThirdWorld = false
let factory = getFactory()
let ipad = factory.getIPad()
let iphone = factory.getIPhone()
print("IPad named : \(ipad.productName), osname : \(ipad.osName), screensize : \(ipad.screenSize)")
print("IPhone named = \(iphone.productName), osname = \(iphone.osName)")
