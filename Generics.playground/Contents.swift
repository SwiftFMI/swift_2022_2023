class Car {
    let name: String
    
    init(name: String = "") {
        self.name = name
    }
}


// apply only to classes
//protocol Printable : AnyObject {
//    func printMe()
//}

protocol Printable {
    associatedtype Element
    var name: Element { get }
    func printMe()
}


struct Train {
    let name: String
    
    init(name: String = "") {
        self.name = name
    }
}

//extension Train: Printable {
//    func printMe() {
//        print("[Train] \(name)")
//    }
//}

extension Car: Printable {
    func printMe() {
        print("[Car] \(name)")
    }
}

var c = Car()
var tesla = Car(name: "Tesla")

//tesla.printMe()

func printGeneric<T: Printable>(item: T) -> Void where T:AnyObject, T.Element:Equatable {
    item.printMe()
}

let train = Train(name: "Arrow")
printGeneric(item: tesla)
//printGeneric(item: train)

protocol CollectionEquatable {
    associatedtype Element
    var count:Int { get }
    subscript (i:Int) -> Element {get}
}

func isEqual<T:CollectionEquatable, U:CollectionEquatable>(left:T, right:U) -> Bool where T.Element:Equatable, U.Element == T.Element {
    if left.count == right.count {
        for i in 0..<right.count {
            if left[i] != right[i] {
                return false
            }
        }
        
        return true
    }
    
    return false
}

let d = ["key": "value", "key1": "value1"]
print(d["key5", default: "default"])
