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


