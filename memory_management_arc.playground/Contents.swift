class Car {
    private var name:String
    
    init(name:String) {
        self.name = name
        print("Initalize a car instance with name: \(name)")
    }
    
    deinit {
        print("Deinit a car instance with name \(self.name) ")
    }
}
    
//var tesla: Car? = Car(name: "Tesla") // 1, 0
////...
////tesla = nil // 0
//
//
//tesla = Car(name: "Tesla X") // 1, 0
//print ("Ref counter is 1.")
////...
//tesla = nil // 0


// Примерите имат деструктор, който показва кога дадената инстанция е премахната от паметта.

// A -> B
// B ?-> A


class Book {
    let title: String
    let author: Author
    var genre: String?
    var pages: Int = 0
    
    init(title: String, author: Author) {
        self.title = title
        self.author = author
    }
    
    deinit {
        print("Deinit a book instance with title \(self.title) ")
    }
}

class Author {
    let name: String
    //трябва да добавим weak пред пропъртито, за да
    //можем да прекъснем цикъла
    weak var book: Book?
//    var book: Book?
    var age: Int
    var isAlive: Bool
    
    init(name: String, age: Int, isAlive: Bool) {
        self.name = name
        self.age = age
        self.isAlive = isAlive
    }
    
    deinit {
        print("Deinit an Auhtor instance with name \(self.name) ")
    }
}

// Този пример показва цикъл, който може да бъде избегнат с weak модификатор.


//var author: Author? = Author(name: "Достоевски", age: 73, isAlive: false)
//var book: Book? = Book(title: "53", author: author! )
//
//author!.book = book
//
//print(author!.book!)
////не можем да го прекъснем
//book = nil
//print(author!.book ?? "missing")
//author = nil

//Author(name: "no name", age: 1000, isAlive: false)


class Student {
    let name: String
    var age = 19
    var card: StudentCard?
    
    init(name:String, age:Int) {
        self.name = name
        self.age = age
        print("Init a student instance.")
    }
    
    func printStrudent() {
        print("Name: \(name) ")
        print("Age: \(age) ")
    }
    
    deinit {
        print("deInit a student instance")
    }
}

class StudentCard {
    let university: String
    let number: String
    
    
//    unowned(unsafe) let student:Student
    unowned let student:Student
//    let student: Student
    
    init(uni:String, number:String, student:Student) {
        university = uni
        self.number = number
        self.student = student
        print("Init a StudentCard \(uni) - \(number) - \(student[keyPath: \.name]).")
    }
    
    deinit {
        print("deInit a student-card instance - \(self.number)")
    }
}

// Този пример показва цикъл, който може да бъде избегнат с unowned модификатор.

//var student:Student? = Student(name: "Г. Петров", age: 21)
//var studentId:StudentCard? = StudentCard(uni: "СУ св. 'Климент Охридски'", number: "35123", student: student!)
//
//student?.card = studentId
//
//studentId = nil
//print(studentId?[keyPath: \.student])
//student = nil


class DataType {
    let name: String
    var properties: Array<String> //[String]
    
    let prettyPrint = true
    
    init(name:String) {
        self.name = name
        properties = []
    }
    
    lazy var toSwift: () -> String = {
    //списъка с променливите в клоужъра ни
    //позволява да упражним допълнителен контрол и да премахнем "силните" референции (тези, които увеличават брояча на референциите с 1)
//        [weak self] in
        [unowned self, name = self.name] in
        
        var swiftCode:String = "class \(self.name) {"

        if self.prettyPrint {
            swiftCode += "\n"
        }

        for property in self.properties {
            if self.prettyPrint {
                swiftCode += "\t"
            }
            swiftCode += property
        }

        if self.prettyPrint {
            swiftCode += "\n"
        }

        swiftCode += "}"

        return swiftCode
    }
    
    deinit {
        print("Deinit dataType instance \(self.name)")
    }
}

// Този пример показва цикъл, който може да бъде избегнат с weak или unowned модификатор в capture списъка на функция.
// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/automaticreferencecounting#Resolving-Strong-Reference-Cycles-for-Closures

var studentDataType: DataType? = DataType(name: "Student")
studentDataType?.properties.append("var name: String = \"Без име\"")
print(studentDataType!.toSwift())
studentDataType = nil
