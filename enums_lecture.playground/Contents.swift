var direction: String

let allPossibleDirections = ["up", "down", "left", "right"]


var directionInt: Int
let UP = 1              // 000001
let DOWN = 2 // 2 ->  0010
let LEFT = 4 // 4 -> 0100
let RIGHT = 8 // 8 -> 1000
let allPossibleDirectionsInt = [UP, DOWN, LEFT, RIGHT]

protocol Printable {
    func printDirection()
}

enum Direction: String {
    case left = "Left"
    case up = "Up"
    case down = "Down"
    case right = "Right"
}

extension Direction: Printable {
    func printDirection() {
        switch self {
        case .left:
            print(" <- ")
        case .up:
            print(" ^ ")
        case .down:
            print(" down ")
        case .right:
            print(" -> ")
        }
    }
}

//var playerPrintable: Printable = Direction.left
//playerPrintable.printDirection()
var playerDirection = Direction.right

print(playerDirection)
print(playerDirection.rawValue)
playerDirection.printDirection()



//enum Trade {
//    case buy
//    case sell
//}
//
//func executeTrade(_ tradeType: Trade, stock: String, amount: Int) { ... }

enum Trade {
    case buy(stock: String, amount: Int)
    case sell(stock: String, amount: Int)
}

// swift
protocol MyProtocol {
    func sum(a: Int, b: Int)
}
// HTTP
//
let name: String? = nil
// Swift 5.7
if let name = name {
    print("Name = \(name)")
}

enum API {
    case ask(prompt: String) // https://chat.open.ai/send/prompt GET
    case ask(prompt: String, p2: Int) // https://chat.open.ai/send/prompt GET
}

func executeTrade(_ trade: Trade) {
    switch trade {
    
    case .buy(stock: let stock, amount: let amount):
        print("Buy \(stock) \(amount)")
    case .sell(stock: let stock, amount: let amount):
        print("Sell \(stock) \(amount)")
    }
}

var x: Optional<Int> = 6
var x1: Int? = Optional<Int>(5)

//print(x)
//print(x1)


executeTrade(.sell(stock: "APPL", amount: 1))

protocol AccountCompatible {
  var remainingFunds: Int { get }
  mutating func addFunds(amount: Int) throws
  mutating func removeFunds(amount: Int) throws
}

enum Account {
  case empty
  case funds(remaining: Int)
  case credit(amount: Int)

  var remainingFunds: Int {
    switch self {
    case .empty:
        return 0
    case .funds(let remaining):
        return remaining
    case .credit(let amount):
        return amount
    }
  }
}

extension Account: AccountCompatible {

  mutating func addFunds(amount: Int) throws {
    var newAmount = amount
    if case let .funds(remaining) = self {
      newAmount += remaining
    }
    if newAmount < 0 {
        self = .credit(amount: newAmount)
    } else if newAmount == 0 {
      self = .empty
    } else {
      self = .funds(remaining: newAmount)
    }
  }

  mutating func removeFunds(amount: Int) throws {
      try self.addFunds(amount: -amount)
  }
}

var account = Account.funds(remaining: 20)
print(account)
try? account.addFunds(amount:10)
print(account)
try? account.removeFunds(amount:115)
print(account)




    // TODO: rawValue
    // TODO: indirect

enum FileNode {
  case file(name: String)
  indirect case folder(name: String, files: [FileNode])
}


let f = FileNode.file(name: "f.txt")
let folder = FileNode.folder(name: "games", files: [f])

print(folder)
