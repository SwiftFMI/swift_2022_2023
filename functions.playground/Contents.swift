

func severalActions() {
    print("Action 1")
    print("Action 2")
    print("Action 3")
}

//func draw(image: String, inCanvas canvas: String) {
//
//}

func functionName(_ variableName: String) -> String {
    let returnedValue = variableName + " was passed"
    return returnedValue
}

//ето и извикването на функцията
var nothing = "Nothing"
let x = functionName(nothing)




let person = (name: "Иван", familyName: "Петров", age: 25)
let p:(String, String, age: Int)? = person
print("Здравей, \(person.name)!")
        
print("Здравей, г-н \(person.familyName)!")
        
print("Здравей, г-н \(person.1)!")
if let pp = p, pp.age > 20 {
    print("Г-н \(pp.1), Вие сте на \(pp.age) години.")
}


func maxItemIndex(inCollection numbers:[Int]) -> (item: Int, index: Int)? {
    var index = -1
    var max = Int.min
    
    for (i, val) in numbers.enumerated() {
        if max < val {
          max = val
          index = i
        }
    }
        
    return index >= 0 ? (max, index) : nil
}
        

if let maxItemTuple = maxItemIndex(inCollection: [12, 2, 6, 3, 4, 5, 2, 10]) {
    print("Max item is \(maxItemTuple.item).")
    print("With index \(maxItemTuple.index).")
}
var sideEffectVariable = 100
func updateVar(oldVariable x: inout Int, newValue: Int = 5) {
    x = newValue
    sideEffectVariable += 1
    func draw(image img: String, inCanvas c: String) {
        ///
        print("Do the drawing here ...")
    }
    draw(image: "hi", inCanvas: "canvas")
}


func createStream() -> (() -> Int) {
    var x = 0
    func increment() -> Int {
        x += 1
        return x
    }
    return increment
}

let stream = createStream()
let stream2 = createStream()
print(stream())
print(stream2())
print(stream())
print(stream())


var ten = 10
print(ten)
print(sideEffectVariable)
updateVar(oldVariable: &ten, newValue: 15)
print(ten)
print(sideEffectVariable)

var sumAB:Int = 0
func sum(a: Int, b: Int,in sum: inout Int) {
    sum = a + b
}
 sum(a:3, b:4, in:&sumAB)
print(" A + B = \(sumAB)")

//homework

extension String {
        static func * (left: String, right: Int) -> String {
            if  right <= 0 {
                return ""
            }
            
            var result = left
            for _ in 1..<right {
                result += left
            }
            return result
        }
    }

func `repeat`(left: String, right: Int) -> String {
    if  right <= 0 {
        return ""
    }
    
    var result = left
    for _ in 1..<right {
        result += left
    }
    return result
}

let r = "Hi!" * 3
let r2 = `repeat`(left: "Hi!", right: 3)
print(r)
print(r2)


// / /game.s /game.s/socoban /game.s/socoban/socoban.app

// ->  / /game.s
//  / /game.s /game.s/socoban /game.s/socoban/socoban.app

//[String]

func solution1(collection: [String]) -> Int {
    var dic: [String: Bool] = [:]
    var status: [(String, Bool)] = []
    for item in collection {
        status.append((item, false))
    }
    ///
    ///
}
