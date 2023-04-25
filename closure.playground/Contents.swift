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
typealias Int_Int_Int = (Int, Int) -> Int // = (Int, Int) -> Bool

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
}

let resultX = x(3, 5)

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

//Брой на параметрите n, първия клоужър е на i позиция, i + 1 ....
func trailingClosure(i: Int, predicate: (Int) -> Bool, predicate2: (Int) -> Bool) {
    print("Проверка за \(i)")
    if predicate(i) {
        print("Предикатът е удволетворен.")
    }
    if predicate2(i) {
        print("Предикатът #2 е удволетворен.")
    }
}

trailingClosure(i: 6, predicate: { $0 % 2 == 0 }, predicate2: { $0 % 3 == 0 })

trailingClosure(i: 6, predicate: { $0 % 2 == 0 }) { $0 % 3 == 0 } //swift < 5.6
// SwiftUI
trailingClosure(i: 6) { $0 % 2 == 0 }
    predicate2: { $0 % 3 == 0 }

infix operator >>> : DefaultPrecedence
extension String {
    static func >>>(left: String, right: String) -> Bool {
        left > right
    }
}


let names = ["aaa", "ccc", "bbb"]
//let sorted = names.sorted(by: { l, r in
//    l > r
//})

//let sorted = names.sorted { l, r in
//    l > r
//}

//let sorted = names.sorted { $0 > $1 }
let sorted = names.sorted(by: <)

print(sorted)

struct Student {
    let name: String
    let fn: Int
}

extension Student: CustomStringConvertible {
    var description: String {
        "[fn:\(fn) - name: \(name)]"
    }
}

extension Student {
    static func >>>(left: Student, right: Student) -> Bool {
        left.fn < right.fn
    }
    
    static func >(left: Student, right: Student) -> Bool {
        left.name < right.name
    }
}

let students = [Student(name: "Иван", fn: 100), Student(name: "Мартина", fn: 120), Student(name: "Мартина", fn: 102), Student(name: "Петър", fn: 110)]

//let sortedStudentsByFn = students.sorted { f, s in
//    f.fn < s.fn
//}

//let sortedStudentsByFn = students.sorted(by: >>>)
//let sortedStudentsByFn = students.sorted(by: >)

let sortedStudentsByFn = students.sorted { f, s in
    if f.name == s.name {
        return f.fn < s.fn
    }
    return f.name < s.name
}

print(sortedStudentsByFn)



var handlers: [Callback] = [] //[() -> Void]
//трябва да добавим атрибута @escaping иначе няма да се компилира
func escapingClosure(f: @escaping () -> Void) {
    print("LOG: f was added to the handlers collection.")
    handlers.append(f)
}

handlers.append {
    print("test")
}
//
escapingClosure {
    print("test 2")
}

//handlers.append({ print("Item 1")})
//handlers.append({ print("Item 2")})

//активираме всички функции
for f in handlers {
    f()
}

let hello = "Hello"

typealias IntTransformer = (Int) -> Int
typealias IntGenerator = () -> Int
//func createGen(start: Int, modify: @escaping (Int) -> Int ) -> () -> Int {
func createGen(start: Int, modify: @escaping IntTransformer) -> IntGenerator {
    var myStart = start
    return {
        let oldResult = myStart
        myStart = modify(myStart)
        return oldResult
    }
}

var next = createGen(start: 0) {
    $0 + 2
}

print(next()) //0
print(next()) //2
print(next()) //4
print(next()) //6


func funcAutoclosure(pred: @autoclosure () -> Bool) {
    if pred() {
        print("It's true")
    } else {
        print("It's НОТ true")
    }
}

let s = Student(name: "Иван", fn: 101)

func log(message: @autoclosure @escaping () -> Void) {
    print("Evaluate a closure.")
    message()
    handlers.append(message)
}


//log(message: { print(s.description)} )
//print("Evaluation: \(s.description)")
log(message: print(s.description))
func f1(noParam: Void)  {
    print("F1 body")
}

f1(noParam: print(s.description))

//
//funcAutoclosure(pred: 11 > 12)
//funcAutoclosure(pred: { () -> Bool in return 2 > 1}())
//
////допълнителен пример
//func funcAutoclosureComplex(pred: @autoclosure () -> ()) {
//    print("body of \(#function)")
//}

//
//func funcAutoclosureComplexVoid(pred:()) {
//    print("body of \(#function)")
//}
//
//funcAutoclosureComplex(pred: print("the function is wrapped in a closure and it's never called."))
//
//funcAutoclosureComplexVoid(pred: print("the function print() is called"))
//Това е изходът от горния код:
//body of funcAutoclosureComplex(pred:)
//the function print() is called
//body of funcAutoclosureComplexVoid(pred:)


//активираме всички функции
for f in handlers {
    f()
}
