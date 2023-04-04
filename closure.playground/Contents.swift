//(Int, Int) -> Int
func sum(a: Int, b: Int) -> Int {
    return a + b
}

//(Int, Int) -> Int
func product(a: Int, b: Int) -> Int {
    return a * b
}

typealias Callback = () -> Void
typealias SuccessCallback = (Bool) -> Void
typealias Int_Int_Int = (Int, Int) -> Int

var genericFunction: Int_Int_Int = sum

print(genericFunction(1, 1))
genericFunction = product
print(genericFunction(1, 1))


func action(fn: Int_Int_Int, a: Int, b:Int) -> Int {
    return fn(a, b)
}

func action(fn: String, a: Int, b:Int) -> Int {
    var f: Int_Int_Int
    
    //(Int, Int) -> Int
    func sum1(a: Int, b: Int) -> Int {
        return a + b
    }

    //(Int, Int) -> Int
    func product1(a: Int, b: Int) -> Int {
        return a * b
    }
    
    switch fn {
    case "sum":
        f = sum1
    case "c":
        f = { a, b in
            return (a + b) * 2
        }
    default:
        f = product1
    }
    return f(a, b)
}

print("Product \(action(fn: product, a: 1, b: 1))")
print("Sum \(action(fn: sum, a: 1, b: 1))")

print("Product \(action(fn: "product", a: 1, b: 1))")
print("Sum \(action(fn: "sum", a: 1, b: 1))")


let x = { a, b in
    return (a + b) * 2
}(3, 5)

func trailingClosure(i: Int, predicate: (Int)->Bool) {
    print("Проверка за \(i)")
    if predicate(i) {
        print("Предикатът е удволетворен.")
    }
}

//нормалното извикване
trailingClosure(i: 1, predicate: { (a) -> Bool in
    return a % 2 == 0
})

trailingClosure(i: 1, predicate: { (a) -> Bool in
    a % 2 == 0
})

trailingClosure(i: 1) { (a) -> Bool in
    a % 2 == 0
}

trailingClosure(i: 1) { p1 in
    p1 % 2 == 0
}

trailingClosure(i: 1) { $0 % 2 == 0 }


func trailingClosure(i: Int, predicate: (Int) -> Bool, predicate2: (Int) -> Bool) {
    print("Проверка за \(i)")
    if predicate(i) {
        print("Предикатът е удволетворен.")
    }
    if predicate2(i) {
        print("Предикатът #2 е удволетворен.")
    }
}

trailingClosure(i: 6, predicate: { $0 % 2 == 0 }) { $0 % 3 == 0 }
trailingClosure(i: 6) { $0 % 2 == 0 } predicate2: { $0 % 3 == 0 }

