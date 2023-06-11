// три вида грешки

// бъгове - при компилиране (OK) и логически (No Way)
// малки грешки при парсване на данни - OK
let usersInput = "хи"
let integer = Int(usersInput)
// възвратими грешки

enum FileError: Error {
    case accessDenied
    case fileDoesNotExist
    case readError
}


func read(file: String) throws -> String {
    throw FileError.accessDenied
    return "file content"
}


 let result = try? read(file: "Demo.txt")

do
{
    try read(file: "New file")
}
catch let err {
   print(err)
}

var list = [(String) throws -> String]()
let callback2 = read

func readComplex(file: String, callback: @escaping (String) throws -> String) rethrows -> String {
    list.append(callback)
    try callback(file)
    //try callback2(file) // не е възможно и води до грешка при компилиране
    return "file content"
}


func readComplex2(file: String, callback: @escaping (String) throws -> String) throws -> String {
//    list.append(callback)
//    try!
//    try?
    
    do {
        try callback(file)
    } catch {
        throw FileError.readError
        print("Error \(error)")
    }
    //try callback2(file) // не е възможно и води до грешка при компилиране
    return "file content"
}

func f1() throws {
    try readComplex2(file: "Hello") { path in
        throw FileError.fileDoesNotExist
        return path
    }
}
