import Foundation

public struct Car {
    public private(set) var color = "silver"
    internal private(set) var brand = "tesla"
    
    public var myColor: String {
        color
    }
    
    public init(color: String = "silver", brand: String = "tesla") {
        self.color = color
        self.brand = brand
    }
}
