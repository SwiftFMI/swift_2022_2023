import Foundation

open class Car {
    public var name: String
    
    public init(name: String = "") {
        self.name = name
    }
    
    deinit {
        self.name = ""
        print("deinit Car \(#function)" )
    }
}
