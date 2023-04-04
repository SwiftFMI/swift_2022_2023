class Tesla: Car {
    var color: String
    
    init(name: String, color: String) {
        self.color = color
        super.init(name: name)
        print("name: \(name)")
    }
    
    deinit {
        print("deinit Tesla \(#function)" )
    }
    
    convenience init() {
        self.init(name: "Default Name", color: "no color")
    }
    
 
 }

//struct Tesla {
//    var name = "red"
//    var color = "red"
//}

extension Tesla {
    struct Hello {
        var greeting = "Hi!"
    }
    
    var f: Int {
        123
    }
    
    
}


var t: Tesla? = Tesla(name: "Model X", color: "silver")
var t2: Tesla? = Tesla()
//t.name = "Model X"
//print(t.name)
print(t?.color)
var x: Tesla? = t
print(t2?.color)


t = nil
x = nil

//: ### Protocols

protocol Progress {
    /// 0 - 1, 1 is 100%
    var progress: Double { set get } //OK
    
    var isComplete: Bool { get } // ?
    
    init(progress: Double)
}

extension Progress {
    var isComplete: Bool {
        progress == 1.0
    }
}


struct Book {
    var title: String
    var author: String
    var progress: Double
}

extension Book {
    init(progress: Double) {
        self.init(title: "???", author: "???", progress: progress)
    }
}

extension Book {
    var isComplete: Bool {
        progress > 0.8
    }
}
//:- print
extension Book {
    func printInfo() {
        print("Книгата \(title) \(isComplete ? "е прочетена" : "не е прочетена").")
    }
}

extension Book: Progress {
}

var b = Book(title: "Swift", author: "Apple", progress: 1.0)
b.printInfo()

var js = Book(title: "JS: The good parts", author: "???", progress: 0.95)
js.printInfo()

var unknownBook = Book(progress: 0.0)
unknownBook.printInfo()
// POP

// Struct + Protocol vs. Classes & Inheritance

// OOP

let b2 = Book(progress: 0.0)
func isEqual(first: Book, second: Book) -> Bool {
    return first.title == second.title && first.author == second.author && first.progress == second.progress
//    return (first.title, first.author, first.progress) == (second.title, second.author, second.progress)
}

extension Book: Equatable {
    static func ==(lhs: Book, rhs: Book) -> Bool {
        return isEqual(first: lhs, second: rhs)
    }
}

if b2 != unknownBook {
    print("They are NOT equal!")
} else {
    print("They are equal, ofc! :)")
}
