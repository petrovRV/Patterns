protocol Product {
    var price: Int { get }
    var name: String { get }
    
    func getTotalPrice(sum: Int) -> Int
    func saveObject()
}

extension Product {
    func getTotalPrice(sum: Int) -> Int {
        return price + sum
    }
}

class Toy: Product {
    var price = 50
    var name = "Toy"
    
    func saveObject() {
        print("Saving objec into Toys database")
    }
}

class Dress: Product {
    var price = 150
    var name = "Dress"
    
    func saveObject() {
        print("Saving object into Dress database")
    }
}

class ProductGenerator {
    func getProduct(price: Int) -> Product? {
        switch price {
        case 0..<100:
            return Toy()
        case 100..<Int.max:
            return Dress()
        default:
            return nil
        }
    }
}

func saveExpenses(price: Int) {
    let pd = ProductGenerator()
    let expense = pd.getProduct(price: price)
    expense?.saveObject()
}

saveExpenses(price: 50)
saveExpenses(price: 56)
saveExpenses(price: 79)
saveExpenses(price: 79)
saveExpenses(price: 100)
saveExpenses(price: 123)
saveExpenses(price: 51)