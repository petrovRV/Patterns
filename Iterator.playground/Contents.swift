//External iterator
/*let internallArrayCollection = ["A", "B", "C"]
 var iterator = internallArrayCollection.makeIterator()
 
 while let str = iterator.next() {
 print(str)
 }
 
 var block: (Int, String, inout Bool) -> () = { index, str, stop in
 print("Index: \(index) Value: \(str)")
 if index == 1 {
 stop = true
 }
 }
 
 for (index, str) in internallArrayCollection.enumerated() {
 var stop = false
 block(index, str, &stop)
 if stop { break }
 }*/

class ItemInShop {
    let name: String
    let isBroken: Bool
    
    init(name: String, isBroken: Bool) {
        self.name = name
        self.isBroken = isBroken
    }
}

class ShopWarehouse {
    private var allItems = [ItemInShop]()
    
    var goodItemsIterator: GoodItemsIterator {
        return GoodItemsIterator(items: allItems)
    }
    
    var badItemsIterator: BadItemsIterator {
        return BadItemsIterator(items: allItems)
    }
    
    func addItem(item: ItemInShop) {
        allItems.append(item)
    }
}

protocol BasicIterator: IteratorProtocol {
    init(items: [ItemInShop])
    func allObjects() -> [ItemInShop]
}

class BadItemsIterator: BasicIterator {
    typealias Element = ItemInShop
    
    private var items: [ItemInShop]
    private var internalIterator: IndexingIterator<[ItemInShop]>
    
    required init(items: [ItemInShop]) {
        self.items = items.filter { $0.isBroken }
        internalIterator = self.items.makeIterator()
    }
    
    func allObjects() -> [ItemInShop] {
        return items
    }
    
    func next() -> ItemInShop? {
        return internalIterator.next()
    }
}

class GoodItemsIterator: BasicIterator {
    typealias Element = ItemInShop
    
    private var items: [ItemInShop]
    private var internalIterator: IndexingIterator<[ItemInShop]>
    
    required init(items: [ItemInShop]) {
        self.items = items.filter { !$0.isBroken }
        internalIterator = self.items.makeIterator()
    }
    
    func allObjects() -> [ItemInShop] {
        return items
    }
    
    func next() -> ItemInShop? {
        return internalIterator.next()
    }
}

let shopWarehouse = ShopWarehouse()
shopWarehouse.addItem(item: ItemInShop(name: "Item1", isBroken: false))
shopWarehouse.addItem(item: ItemInShop(name: "Item2", isBroken: false))
shopWarehouse.addItem(item: ItemInShop(name: "Item3", isBroken: true))
shopWarehouse.addItem(item: ItemInShop(name: "Item4", isBroken: true))
shopWarehouse.addItem(item: ItemInShop(name: "Item5", isBroken: false))

let goodIterator = shopWarehouse.goodItemsIterator
let badIterator = shopWarehouse.badItemsIterator

while let element = goodIterator.next() {
    print("Good Item = \(element.name)")
}

while let element = badIterator.next() {
    print("Bad Item = \(element.name)")
}