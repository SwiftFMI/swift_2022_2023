import UIKit

var greeting = "Hello, playground"


typealias Coordinate = (Int, Int)


//func f1(a: Int, b: Int) -> Int {
//    return a + b
//}
//typealias Callback = () -> ()
//typealias IntIntInt = (Int, Int) -> Int
//let fPointer: IntIntInt = f1
//print(fPointer(1, 1))

struct Maze {
    let visitedSymbol = "1"
    var data: [String] =
    ["$$$$$$$$$$^^^^^",
     "$$$$$оооо^^^^^^",
     "$$$$$оо^^^^хххх",
     "хх%ххххххххх**х",
     "х%%ххх$$ххххххх"]
    
    var visited: [[Int]] =
    [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,],
     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,]]
    
    var position: Coordinate = (0, 0)
    
    mutating func mark(x: Int, y: Int, symbol: Int = 1) {
        self.visited[y][x] = symbol // индексирането е обратно
        print("mark: \(x) \(y)")
    }
    
    var debug: String {
        print(data[0])
        return ""
    }
    
    var debugVisited: String {
        visited.forEach { row in
            var r = ""
            row.forEach { cell in
                r += "\(cell)"
            }
            print(r)
        }
        return ""
    }
    
    var isFullyVisite: Bool {
        for row in visited {
            if row.contains(where: { item in
                item == 0
            }) {
                return false
            }
        }
        
        return true
    }
    
    func neighbours(x: Int, y: Int) -> [(Int, Int)] {
        [(x, y+1), (x-1, y), (x, y-1), (x+1, y)] // тук не смятах правилно съседите
    }
    
    func neighboursNotVisited(x: Int, y: Int) -> [(Int, Int)] {
        let n = neighbours(x: x, y: y)
        print("N = \(n)")
        return n.filter { postion in
            !isVisited(position: position) // грешката е в m.isVisited(position: position)
            || !isOutOfBounds(postion)
        }
    }
    
    func isVisited(position: (Int, Int)) -> Bool {
        let x = position.0
        let y = position.1
        
        return visited[y][x] != 0 // тук пак индексите са разменени
    }
    
    func isOutOfBounds(_ position:(Int, Int)) -> Bool {
        let x = position.0
        let y = position.1
        if x < 0 || x >= data[0].count {
            return true
        }
        
        if y < 0 || y >= data.count {
            return true
        }
        
        return false
    }
    
    func symbol(at position: (x: Int, y: Int), equalsTo: String) -> Bool {
        let r = data[position.y]
        let startIndex = r.index(r.startIndex, offsetBy: position.x)
        // тук се борави с индекси
        let s = r[startIndex...startIndex]
            
        return s == equalsTo
    }
}

extension Maze {
    var middlePoint: (Int, Int) {
        (data[0].count / 2, data.count / 2)
    }
    
    var topLeading: (Int, Int) {
        (0, 0)
    }
    
//    func outOfBounds(position: Int, Int)) -> Bool {
//        return self.isOutOfBounds(position)
//    }
}


var m = Maze()
//m.debug
//m.debugVisited
// някакви тестове
print ("Middle: \(m.middlePoint)")
print ("Is in Bounds: \(!m.isOutOfBounds(m.middlePoint))")
print("S = \(m.symbol(at: (0, 0), equalsTo: "$"))")

func solution(maze m: inout Maze, position: (x: Int, y: Int), currentColor: String) -> Int {
    if m.isFullyVisite || m.isOutOfBounds(position) || m.isVisited(position: position)
        || !m.symbol(at: position, equalsTo: currentColor){
        return 0
    }
    m.mark(x: position.0, y: position.1)
    let ns = m.neighboursNotVisited(x: position.x, y: position.y)
    
    print ("N: \(ns)")
    for n in ns {
       solution(maze: &m, position: n, currentColor: currentColor)
    }
    
    
    return 0
}

solution(maze: &m, position: m.topLeading, currentColor: "$")
m.debugVisited
//print(input)


// да се допише цялостно решени, което се движи по станалата част от картата

