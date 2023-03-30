struct Merchandise {
    var name: String = ""
    var pricePerUnit: Double = 10.0 {
            willSet {
                print("Сменяме цената с нова \(newValue)")
                print("Старата цена е \(pricePerUnit)")
            }
            didSet(oldPrice) {
                if oldPrice > pricePerUnit {
                    print("Намаление!")
                } else {
                    print("Всичко поскъпва!")
                }
            }
        }
    var isAvailable: Bool = false
    
// this causes a problem with the default init
//    var _tax: Double = 0.0

//    var tax: Double {
//        get {
//            _tax
//        }
//        set {
//            _tax = newValue
//        }
//    }
    var tax: Double {
        0
    }
    var tax2: Double {
        get {
            return tax * 2
        }
    }

//    mutating func setTax(tax: Double) {
//        self._tax = tax
//    }
    
//s
    
    func printInfoFor() {
        print("Product : \(self.name) - \(self.pricePerUnit) (Tax: \(self.tax)) - \(self.isAvailable ? "available" : "unavailable")")
    }

    func storeIn(str: inout String) -> () {
        str = "Product : \(self.name) - \(self.pricePerUnit) (Tax: \(self.tax)) - \(self.isAvailable ? "available" : "unavailable")"
    }

    subscript(index: String) -> String? {
        switch index {
        case "name" :
            return name
        case "pricePerUnit" :
            return "\(pricePerUnit)"
        case "isAvailable" :
            return "\(isAvailable ? "available" : "missing")"
        default:
            return nil
        }
    }
}

struct Store {
    var m: Merchandise
}

var phone = Merchandise(pricePerUnit: 200, isAvailable: false)
phone.name = "iPhone X"
phone.pricePerUnit -= 100
//phone.setTax(tax: 20)
//print(phone.tax2)
//phone.printInfoFor()
//
//let p2 = Merchandise()
////p2.name = "what ever"
//p2.printInfoFor()
//
//var toPrint = ""
//p2.storeIn(str: &toPrint)
//print("Saved: \(toPrint)")
//
//func maxValue(_ numbers: Int..., str strings: String...) -> Int {
//    var max = Int.min
//    for v in numbers {
//        if max < v {
//            max = v
//        }
//    }
//
//    for s in strings {
//        print(s)
//    }
//
//    return max
//}
//
//print(maxValue(1,2,3,4,5,6,7,8,9,10, str: "a", "b", "v"))
//
////let integers = [1, 2, 3]
////print(integers)
////print(integers[1])
//
//print("Price \(p2["what?"] ?? "???")")
//
//var store = Store(m: phone)
//
////var keyPathTax = \Merchandise.tax2
////var keyPathStoreM = \Store.m
////var path = keyPathStoreM.appending(path: keyPathTax)
//store[keyPath: \.m.tax] = 100
//print(store[keyPath: \.m.tax])

let m = Merchandise(name: "name")
let mFull = Merchandise(name: "name", pricePerUnit: 0.0, isAvailable: false)

// стойности по подразбиране във функции
func sumWith(a: Int, b: Int = 5, c: Int) -> Int {
    return a + b + c
}

//print(sumWith(a: 10, b: 5, c: 10))
//print(sumWith(a: 10, b: 10, c: 10))
//print(sumWith(a: 10, c: 10)) //

struct LazyStruct {
    var count: Int
    init (count: Int) {
        print("\(LazyStruct.self) се конструира чрез -> \(#function)")
        self.count = count
    }
}

struct NormalStruct {
    var count: Int
    init (count:Int) {
        print("\(NormalStruct.self) се конструира чрез -> \(#function)")
        self.count = count
    }
}
    
struct ExampleLazyProperty {
    lazy var s:LazyStruct = LazyStruct(count: 5)
    var normal:NormalStruct = NormalStruct(count: 10)
    var regularInt = 5
        
    init() {
        print("\(ExampleLazyProperty.self) се конструира чрез -> \(#function)")
    }
}
    
var lazyPropExample = ExampleLazyProperty()
lazyPropExample.regularInt = 15
print("Стойноста в нормалното пропърти 'regularInt' e \(lazyPropExample.regularInt)")
print("Стойноста в нормалното пропърти 'normal' e \(lazyPropExample.normal.count)")
print("Стойноста на мързеливото пропърти е \(lazyPropExample.s.count)")
print("Стойноста в нормалното пропърти 'regularInt' е \(lazyPropExample.regularInt)")

let c = Car()
print(c.color)
//c.color = "#555"



struct Bicycle {
    var name: String
}

extension Bicycle {
    init() {
        self.name = "no name"
    }
}

var b = Bicycle()
