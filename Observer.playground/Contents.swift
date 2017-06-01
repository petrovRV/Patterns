import UIKit

func ==(lhs: StandardObserver, rhs: StandardObserver) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

//create class observer
class StandardObserver: Hashable {
    var hashValue: Int { return "\(Mirror(reflecting: self).subjectType)".hashValue}
    
    func valuedChanged(name: String, value: String) {}
}

//create protocol subject
protocol StandardSubject {
    func addObserver(observer: StandardObserver)
    func removeObserver(observer: StandardObserver)
    func notifyObjects()
}

//create realization subject
class StandardSubjectImplementation: StandardSubject {
    
    private var name: String!
    private var value: String!
    
    var observerCollection = Set<StandardObserver>()
    
    func addObserver(observer: StandardObserver) {
        observerCollection.insert(observer)
    }
    
    func removeObserver(observer: StandardObserver) {
        observerCollection.remove(observer)
    }
    
    func notifyObjects() {
        for observer in observerCollection {
            observer.valuedChanged(name: name, value: value)
        }
    }
    
    func changeValue(name: String, value: String) {
        self.name = name
        self.value = value
        notifyObjects()
    }
}

//create observers
class SomeSubscriber: StandardObserver {
    override func valuedChanged(name: String, value: String) {
        print("And some subscriber tells: Hmm, value \(value) changed to \(name)")
    }
}

class OtherSubscriber: StandardObserver {
    override func valuedChanged(name: String, value: String) {
        print("And some another tells: Hmm, value \(value) changed to \(name)")
    }
}

//example
let subj = StandardSubjectImplementation()
let someSubscriber = SomeSubscriber()
let otherSubscriber = OtherSubscriber()

subj.addObserver(observer: someSubscriber)
subj.addObserver(observer: otherSubscriber)

subj.changeValue(name: "trange value", value: "newValue")

class KVOSubject: NSObject {
    var changeableProperty: String!
}

class KVOObserver: NSObject {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("KVO: Value changed;")
    }
}

let kvoSubj = KVOSubject()
let kvoObserver = KVOObserver()

kvoSubj.addObserver(kvoObserver, forKeyPath: "changeableProperty", options: .new, context: nil)

kvoSubj.setValue("new value", forKey: "changeableProperty")
kvoSubj.removeObserver(kvoObserver, forKeyPath: "changeableProperty")