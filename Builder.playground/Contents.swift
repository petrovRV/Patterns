class AndroidPhone {
    var osVersion: String!
    var name: String!
    var cpuCodeName: String!
    var RAMsize: Int!
    var osVersionCode: Double!
    var launcher: String!
}

protocol BPAndroidPhoneBuilder {
    var phone: AndroidPhone { get }
    
    func setOSVersion()
    func setName()
    func setCPUCodeName()
    func setRAMSize()
    func setOSVersionCode()
    func setLauncher()
}

class LowPricePhoneBuilder: BPAndroidPhoneBuilder {
    var phone = AndroidPhone()
    
    func setOSVersion() {
        phone.osVersion = "Android 2.3"
    }
    
    func setName() {
        phone.name = "Low price phone!"
    }
    
    func setCPUCodeName() {
        phone.cpuCodeName = "Some shitty CPU"
    }
    
    func setRAMSize() {
        phone.RAMsize = 256
    }
    
    func setOSVersionCode() {
        phone.osVersionCode = 3.0
    }
    
    func setLauncher() {
        phone.launcher = "Hia Tsung!"
    }
}

class HighPricePhoneBuilder: BPAndroidPhoneBuilder {
    var phone = AndroidPhone()
    func setOSVersion() {
        phone.osVersion = "Android 4.1"
    }
    func setName() {
        phone.name = "High price phone!"
    }
    func setCPUCodeName() {
        phone.cpuCodeName = "Some shitty but expensive CPU"
    }
    func setRAMSize() {
        phone.RAMsize = 1024
    }
    func setOSVersionCode() {
        phone.osVersionCode = 4.1
    }
    func setLauncher() {
        phone.launcher = "Samsung Launcher"
    }
}

class FactorySalesMan {
    private var builder: BPAndroidPhoneBuilder!
    
    var phone: AndroidPhone {
        return builder.phone
    }
    
    func setBuilder(builder: BPAndroidPhoneBuilder) {
        self.builder = builder
    }
    
    func constructPhone() {
        builder.setOSVersionCode()
        builder.setName()
        builder.setCPUCodeName()
        builder.setRAMSize()
        builder.setOSVersion()
        builder.setOSVersionCode()
        builder.setLauncher()
    }
}

let cheapPhoneBuilder = LowPricePhoneBuilder()
let expensivePhoneBuilder = HighPricePhoneBuilder()

let salesMan = FactorySalesMan()
salesMan.setBuilder(builder: cheapPhoneBuilder)
salesMan.constructPhone()

var phone = salesMan.phone
print("Phone Name = \(phone.name!), osVersion = \(phone.osVersion!), cpu code name = \(phone.cpuCodeName!), ram size = \(phone.RAMsize!), osversion code = \(phone.osVersionCode!), launcher = \(phone.launcher!)")

salesMan.setBuilder(builder: expensivePhoneBuilder)
salesMan.constructPhone()
phone = salesMan.phone
print("Phone Name = \(phone.name!), osVersion = \(phone.osVersion!),cpu code name = \(phone.cpuCodeName!), ram size = \(phone.RAMsize!), osversion code = \(phone.osVersionCode!), launcher = \(phone.launcher!)")
