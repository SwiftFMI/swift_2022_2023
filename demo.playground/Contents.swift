import Foundation

var greeting:String = "Hello, playground"
//Optional<Int>
//Int?

let greeting1 = "Hello, playground"

let x = 123 // дхаскдхсуакх

//greeting1 = "Hi!"

print(greeting)

// коментар


/*
 коментар на
 няколко реда
 
 */

// Типове


//Bool
//Int
//Double
//Float
//String
var five = 10
let numberOneV2: Int? = nil
if let numberOneV3 = numberOneV2 {
    if numberOneV3 > 2 {
        five = -5
    } else {
        five = 5
    }
} else {
//    numberOneV3
}

//Array //
let names = ["Емил", "Иван", "Спас"]
let names1: [String] = ["Емил", "Иван", "Спас"]
let names2: Array<String> = ["Емил", "Иван", "Спас"]
print(names[0])
//Dictionary - key -> value

let students = [123: "Иван", 124: "Митко"]
let r = students[123]
if let r {
    print(r)
}
var myIndex = 0
for name in names {
    print("My item with index \(myIndex) \(name) ")
    myIndex += 1
}

for (key, value) in students {
    print("\(key) - \(value)")
}

//var point: (Int, String) = (123, "123")

var shouldExecute = !true
var times = 3
while shouldExecute { // 0+
    if times == 2 {
        times -= 1
        continue
    }
    print("\(times) Hello!!!!");
    if times == 0 {
        shouldExecute = false
    } else {

    }
    times -= 1
}

repeat { //1+
//    if flag {
//        break
//    }
    print("\(times) Hello!!!!")
    if times == 0 {
        shouldExecute = false
    } else {

    }
    times -= 1
} while shouldExecute


//var x1 = 100
//var y = x1
//y = 101
//print("X1 = \(x1 * y)")


let count = 0
let things = "компютри"

switch count {
case 0:
    print("николко")
    fallthrough
case 1..<3:
    print("най-много 3")
case 4...7: //[4,8) == 4...7
    print("най-много 7")
case 8:
    print("точно 8")
default:
    print("много")
}

let point = (1, 1, 3)
switch point {
case let (x, y, z):
    print("My point [\(x),\(y),\(z)]")
case (1,1, _):
    print("My point \(point), \(point.2)")
case (1,1, -2...5): //[-2, 5]
    print("My point \(point)!")

default:
    print("Some point, somewhere.")
}

var numberOne: Int? = 5

let realOne = numberOne ?? 2

let `for` = 5
var v = 1
for _ in 1...10 {
       v += 1
    print("V = \(v)")
   }


