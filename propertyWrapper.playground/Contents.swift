//@propertyWrapper
//struct Trace {
//    private var value: String = ""
//    var wrappedValue: String {
//        get {
//            print("=> Get value \(value)")
//            return value
//        }
//
//        set {
//            print("=> Set value \(newValue)")
//            value = newValue
//        }
//    }
//}

@propertyWrapper
struct Trace {
    private var value: String = ""

    init(wrappedValue: String) {
        self.value = wrappedValue
    }

    var wrappedValue: String {
        get {
            print("=> Get value \(value)")
            return value
        }
        
        set {
            print("=> Set value \(newValue)")
            value = newValue
        }
    }
}



struct ElectricCar {
    //Important: A constructor is required!
    init(model: String, speed: Int) {
        self.speed = speed
//        self.model = model
        self._model = Trace(wrappedValue: model)
//        self._model.wrappedValue =
    }
    
    init(model: String) {
        self.speed = 0
        self.model = model
    }
    
    @Trace var model: String
    var speed:Int
}


var tesla = ElectricCar(model:"Tesla", speed: 300) // отпечатва => Set value Tesla
print(tesla.model) // отпечатва => Get value Tesla
// отпечатва Tesla
tesla.model = "Tesla X"// отпечатва => Set value Tesla X

struct ElectricCar2 {
    @Trace var model: String
    var speed:Int
}
var t = Trace(wrappedValue: "Tesla")
t.wrappedValue = "Tesla"

//var tesla2 = ElectricCar(model: t, speed: 300)

//var tesla2 = ElectricCar2(model: TraceV1(wrappedValue: "Tesla"), speed: 300)

struct ElectricCar3 {
    //Important: A constructor is required!
    init(model: String, speed: Int) {
        // this is a setter function
        // self.speed = speed should be done before self.model = model
        self.speed = speed // this is a property
        self.model = model
    }
    
    @Trace var model: String
    var speed:Int
// не може да се компилира
// error: 'self' used before all stored properties are initialized
}

var tesla3 = ElectricCar3(model:"Tesla", speed: 300)

struct ElectricCar4 {
    @Trace var model: String = "Tesla"
    
//    private var _model = Trace(wrappedValue: "Tesla")
//    var model: String {
//        get {
//            return _model.wrappedValue
//        }
//        set {
//            _model.wrappedValue = newValue
//        }
//    }
    
    var speed:Int
}

@propertyWrapper
struct MaxValue {
    private var value: Int = 0
    private var maxValue: Int = 100

    init(wrappedValue: Int) {
        self.value = min(maxValue, wrappedValue)
    }

    init(wrappedValue: Int, maximum: Int) {
        self.maxValue = maximum
        self.value = min(maxValue, wrappedValue)
    }

    var wrappedValue: Int {
        get {
            return value
        }
        
        set {
            value = min(maxValue, newValue)
        }
    }
}

struct EV {
    //Important: A constructor is required!
    init(model: String, speed: Int) {
        self.speed = speed
        self.model = model
    }

    init(speed: Int) {
        self.speed = speed
    }
    
    @Trace var model = "Generic EV" // this calls init(wrappedValue: String)
    //it's converted to var model = Trace(wrappedValue: "Generic EV")
    @MaxValue2(maximum: 150) var speed: Int = 120
    
    //    private var _speed = MaxValue(wrappedValue: 120, maximum: 250)
    //    var speed: String {
    //        get {
    //            return _speed.wrappedValue
    //        }
    //        set {
    //            _speed.wrappedValue = newValue
    //        }
    //    }
}

@propertyWrapper
struct MaxValue2 {
    private var value: Int = 0
    private var maxValue: Int = 100

    private(set) var projectedValue = (false, 0)

    init(wrappedValue: Int) {
        self.value = min(maxValue, wrappedValue)
    }

    init(wrappedValue: Int, maximum: Int) {
        self.maxValue = maximum
        self.value = min(maxValue, wrappedValue)
    }

    var wrappedValue: Int {
        get {
            return value
        }
        
        set {
            if newValue > maxValue {
                projectedValue = (true, newValue)
            }
            value = min(maxValue, newValue)
        }
    }
}

extension MaxValue2 {
    init(value: Int, max: Int) {
        self.maxValue = max
        if value > maxValue {
            projectedValue = (true, value)
        }
        self.value = min(maxValue, value)
    }
}

var ev = EV(speed: 100)
print(ev.speed) // отпечатва 150
// така достъпваме проекцията
print(ev.$speed) // отпечатва (true, 300)
