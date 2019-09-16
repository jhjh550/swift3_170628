//: Playground - noun: a place where people can play

import UIKit

// error handling
enum DateParsingError : Error{
    case OversizeString
    case UndersizeString
}
// 2017-06-27
struct MyDate{
    var year:Int=0
    var month:Int=0
    var date:Int=0
}
func parseDate(param:String)throws->MyDate{
    guard param.count == 10 else{
        if param.count < 10{
            throw DateParsingError.UndersizeString
        }else{
            throw DateParsingError.OversizeString
        }
        
    }
    return MyDate()
}
do{
    var myDate = try parseDate(param: "1111")
}catch DateParsingError.UndersizeString {
    print("under size error")
}
//var test = try! parseDate(param: "1234")










// protocol
protocol SampleProtocol{
    var name:String { get set }
    var description:String { get }
    func excute(param:String)->String
    init()
    init(cmd:String)
}
class ImplParent{
    init(){
        print("implParent")
    }
}
class ImplProtocol:ImplParent, SampleProtocol{
    var name = "john"
    var description: String{
        return "name is \(name)"
    }
    func excute(param: String) -> String {
        return "hello \(param)"
    }
    required init(cmd: String) {
        print("init \(cmd)")
    }
    override required init(){
        
    }
}

class Man{
    var name:String?
    init(name:String){
        self.name = name
    }
}
protocol Job{
    func doWork()
}
extension Man:Job{
    func doWork() {
        print("\(self.name) is working")
    }
}
let man = Man(name: "john")
man.doWork()

// protocol inheritance
protocol A{
    func doA()
}
protocol B:class{
    func doB()
}
protocol C:A,B{
    func doC()
}
class ABC:C{
    func doA() {
        
    }
    func doB(){
        
    }
    func doC(){
        
    }
}
let abc : C = ABC()
abc.doC()
let a:A = ABC()
a.doA()






// extension
extension Double{
    var km:Double{ return self*1000.0 }
    var m:Double{ return self }
    var cm:Double{ return self/100.0 }
    var mm:Double{ return self/1000.0 }
    var description:String{
        return "\(self)km is \(self.km)m, \(self)cm is \(self.cm)m, \(self)mm is \(self.mm)m"
    }
}
2.km
5.5.cm
print(7.0.description)

extension Int{
    func repeatition(task:()->()){
        for _ in 0..<self {
            task()
        }
    }
    mutating func square(){
        self = self*self
    }
    
}
var d = 3
d.square()

d.repeatition(task: {()->() in
    print("hello world")
})
d.repeatition {
    print("hello world2")
}













// enum
enum Direction{
    case North
    case South
    case East, West
}
var d1 : Direction

var directionToHead = Direction.North
directionToHead = .West

switch directionToHead {
case .North:
    print("North")
case .South:
    print("South")
case .East:
    print("East")
case .West:
    print("West")
}

enum HTTPCode : Int{
    case OK = 200
    case NOT_MODIFY = 304
    case NOT_FOUND = 404
    case SERVER_ERROR = 500
    case Test1
    case Test2
    
    var value : String{
        return "HTTPCode number is \(self.rawValue)"
    }
    
    func getDescription()->String{
        switch self {
        case .OK:
            return "success response. http code is \(self.rawValue)"
        default:
            return "default value. http code is \(self.rawValue)"
        }
    }
    static func getName()->String{
        return "This Enumeration is HTTPCode"
    }
}

HTTPCode.NOT_FOUND.rawValue
HTTPCode.Test1.rawValue
HTTPCode.Test2.rawValue

var response = HTTPCode.OK
print(response.value)
print(response.getDescription())
print(HTTPCode.getName())








// optional chain
struct Human{
    var name:String?
    var man = true
}
var boy:Human? = Human(name: "John", man: true)
if boy != nil{
    if boy!.name != nil{
        print("name is \(boy!.name!)")
    }
}
// optional binding
if let b = boy{
    if let name = b.name{
        print("name is \(name)")
    }
}

struct Company{
    var ceo:Human?
    var companyName:String?
}
var myCompany:Company? = Company(ceo: boy, companyName: "helloCompany")

if let company = myCompany{
    if let ceo = company.ceo{
        if let name = ceo.name{
            print("ceo name is \(name)")
        }
    }
}
if let name = myCompany?.ceo?.name{
    print("ceo name is \(name)")
}

// optional chain value is optional
print(myCompany?.ceo?.man)










// init
struct Resolution{
    var width = 0
    var height:Int
    
    init(width:Int){
        self.width = width
        height = 0
    }
    init(height:Int){
        self.height = height
    }
}
var resolution = Resolution(width: 1024)


// init override
class Base{
    var baseValue:Double
    init(inputValue:Double){
        self.baseValue = inputValue
    }
}

class ExBase:Base{
    override init(inputValue: Double) {
        super.init(inputValue: 10.0)
    }
}








class Vehicle{
    var currentSpeed = 0.0
    
    var description : String{
        return "move \(currentSpeed) per hour"
    }
    func makeNoise(){
        
    }
}

class Car:Vehicle{
    var gear = 0
    var engineLevel = 0
    
    override var currentSpeed: Double{
        get{
            return Double(engineLevel*50)
        }
        set{
            
        }
    }
    override var description: String{
        get{
            return "Car:engineLevel=\(engineLevel) currentSpeed=\(currentSpeed)"
        }
        set{
            print("New Value is \(newValue)")
        }
    }
}
let c = Car()
c.engineLevel = 5
c.currentSpeed
c.description = "New Class Car"
c.description



class Bicycle:Vehicle{
    var hasBasket = false
}

class Tandem:Bicycle{
    var passensers = 0
}

var b = Bicycle()
b is Vehicle

//Button btn = (Button)findviewById(R.id.aaa);

// Vehicle
// Bicycle
// Tandem


var v : Vehicle = b as Vehicle // upcasting
var b1 : Bicycle = v as! Bicycle // downcasting

var v2 = Vehicle()
var b2 : Bicycle? = v2 as? Bicycle // downcasting
if b2 != nil{
    print("b2 is not nil")
}

var obj:AnyObject = Tandem()
if var myTandem = obj as? Tandem{
    print("casting success")
}

func name(param:Any){
    print("\(param)")
}

name(param: 3)
name(param: false)
name(param: [1,2,3])










