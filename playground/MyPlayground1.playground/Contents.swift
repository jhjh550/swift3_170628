//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"
let a = 123

print(str)

var abc:Int
abc = 1234

for _ in 1..<5{
    
}

var n = 2
while n < 1000 {
    n = n*2
}

//repeat {
//    n = n * 2
//} while  n < 1000


var val = 2
switch val {
case 1...5:
    print("val is 1")
case 4:
    print("val is 2")
default:
    print("not match")
}

var list = [String]()
list.append("hello")
list.append("world")
list.insert("abc", at: 1)

var alphabet = ["a","b","c","d","e"]
alphabet[0...2]
alphabet[1...2] = ["1", "2", "3"]
alphabet

var genre:Set = ["Classic", "Rock"]
genre.insert("Classic")


let myTuple:(String, Character, Int, Bool) = ("a", "b", 1, true)
myTuple.2

let myStr = "c"
let myChar:Character = "d"


let (aa,b,c,d) = ("ab", 1, 2.1, true)
aa

var capital = [String:String]()
capital["kr"] = "seoul"
capital["en"] = "london"
capital["fr"] = "paris"
capital["en"] = nil
capital.updateValue("tokyo", forKey: "jp")
print(capital)

for row in capital{
    let (key, value) = row
    print(key)
}


// optional
var myVal:Int?
myVal = 3
//myVal = myVal+5
print(myVal!)

var str1 = "1231"
var num = Int(str1)

if num != nil{
    print("success")
}else{
    print("fail")
}

// optional binding
if let initNum = Int(str1){
    print("success : \(initNum)")
}else{
    print("fail")
}

print(capital["fr"])
print(num)
if num == 1231 {
    print("num is same")
}else{
    print("num is different")
}
//switch num {
//case 1231:
//    print("num is same")
//default:
//    print("num is different")
//}

func sayHello(){
    print("hello world")
}
sayHello()
func sayHelloWithName(name:String){
    print("hello \(name)")
}
sayHelloWithName(name: "john")
func sayHelloWithName2(name:String,welcomeMessage msg:String)->String{
    return "hello \(name), \(msg)"
}
print( sayHelloWithName2(name: "abcde", welcomeMessage:"welcome"))

func sayHelloWithName3(name:String, _ msg:String){
    print("hello \(name) \(msg)")
}
sayHelloWithName3(name: "asdf", "welcome")

func myEcho(message: String="hello", newLine:Bool){
    print(message)
}

myEcho(message: "world", newLine: false)



func myFunc(base:Int)->String{
    return "result is \(base+1)"
}
let f = myFunc
f(10)


func myFunc2()->String{
    return "this is myFunc2"
}
func myFunc3()->()->String{
    return myFunc2
}
let f2 = myFunc3()
let f3 = myFunc3

func myFunc5(param:Int)->Int{
    return param+1
}
func myFunc4(base:Int, varFunc:(Int)->Int)->Int{
    return varFunc(base)
}
myFunc4(base: 10, varFunc: myFunc5)


// let c = calc("-")
// c(3,4)
func plus(a:Int, b:Int)->Int{
    return a+b
}
func minus(a:Int, b:Int)->Int{
    return a-b
}
func times(a:Int, b:Int)->Int{
    return a*b
}
func divide(a:Int, b:Int)->Int{
    guard b != 0 else {
        return 0
    }
    
    return a/b
}
func calc(_ operand:String)->(Int,Int)->Int{
    switch operand {
    case "+":
        return plus
    case "-":
        return minus
    case "*":
        return times
    case "/":
        return divide
    default:
        return plus
    }
}
let c1 = calc("+")
c1(5,6)

// nested function
func outerFunc(base:Int)->(Int)->String{
    let value = base+20
    func innerFunc(inc:Int)->String{
        return "\(inc+value)를 반환합니다."
    }
    return innerFunc
}

let n1 = outerFunc(base: 5)
n1(10)

// closure
let cl1 = {()->() in
    print("hello closure")
}
cl1()


var valueArray = [1,9,5,7,2,3]
valueArray.sort(by: {(s1:Int, s2:Int)->Bool in
    if s1<s2{
        return true
    }else{
        return false
    }
})

valueArray.sort(by: { $0>$1 })

// struct
struct MyStruct{
    var myVal = 10
}
struct MyRect{
    var originX = 0.0
    var originY = 0.0
    var sizeX = 0.0
    var sizeY = 0.0
    
    var centerX : Double{
        return originX+(sizeX/2)
    }
}

var rect = MyRect(originX: 0, originY: 0, sizeX: 10, sizeY: 10)
rect.centerX
//rect.centerX = 8


// property observer
struct Job{
    var income:Int = 0 {
        willSet(newIncome){
            print("new income is \(newIncome)")
        }
        didSet{
            print("income increase \(income - oldValue)")
        }
    }
}
var job = Job(income: 100)
job.income = 50


// type property
class MyTypeClass{
    class var value2:Int{
        return 100
    }
    static var value:Int{
        return 10
    }
    static var value1="Hello world"
}
MyTypeClass.value1


// class inheritance
class Vehicle{
    var currentSpeed = 0.0
    var description:String{
        return "move \(currentSpeed)"
    }
}
class Bicycle:Vehicle{
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 20.0
print("bicycle : \(bicycle.description)")

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
}
let car = Car()
let vehicle : Vehicle
vehicle = bicycle as Vehicle

let car1 : Car?
car1 = vehicle as? Car

// init
class Resolution{
    var width = 0
    var height = 0
    var depth = 0
    init(width:Int){
        self.width = width
    }
}
var res = Resolution(width: 10)
class Res2:Resolution{
    override init(width:Int){
        super.init(width: width)
    }
}

// optional chain
struct Human{
    var name:String?
    var man:Bool = true
}
var boy:Human? = Human(name: "john", man: true)
if boy != nil {
    if boy!.name != nil {
        print("name is \(boy!.name!)")
    }
}
if let b = boy{
    if let name = b.name{
        print("name is \(name)")
    }
}
struct Company{
    var ceo:Human?
    var companyName:String?
}
var myCompany : Company? = Company(ceo: boy, companyName: "HelloCompay")

if let company = myCompany{
    if let ceo = company.ceo {
        if let name = ceo.name{
            print("ceo name is \(name)")
        }
    }
}
if let name = myCompany?.ceo?.name {
    print("ceo name is \(name)!!!!!!!")
}
print(myCompany?.ceo?.man)

// enum
enum Direction{
    case North
    case South
    case East, West
}
var dir = Direction.North
dir = .South

enum HTTPCode : Int{
    case Test0, Test10
    case OK = 200
    case NOT_MODIFY = 304
    case NOT_FOUND = 404
    case SERVER_ERROR = 500
    case Test1, Test2, Test3
    
    var value:String{
        return "HTTPCode number is \(self.rawValue)"
    }
    func getDescription()->String{
        switch self {
        case .OK:
            return "success HTTPCode is \(self.rawValue)"
        default:
            return "not match"
        }
    }
}
print(HTTPCode.OK.value)
print(HTTPCode.OK.getDescription())
HTTPCode.Test10.rawValue


// extension
extension Double{
    var km : Double{ return self*1000.0 }
    var m : Double{ return self }
    var cm : Double{ return self / 100.0 }
    var mm : Double { return self / 1000.0 }
    var description:String {
        return "\(self)km is \(self.km)m, \(self)cm is \(self.cm)m \(self)mm is \(self.mm)m"
    }
}
5.5.km
125.0.mm
print(5.5.description)

extension Int{
    func repeatition(task:()->()){
        for _ in 0..<self{
            task()
        }
    }
}
3.repeatition(task: {
    print("hello world")
})
3.repeatition {
    print("asdf qwer")
}

// protocol
protocol MyProtocol{
    var name : String{ get set }
    var description : String{ get }
    init()
    init(param:String)
    
}
class ParentTest{
    init(){
        
    }
}
class MyProtocolImpl:ParentTest, MyProtocol{
    var name = "john"
    var description: String{
        return "name is \(name)"
    }
    override required init(){
        
    }
    required init(param:String){
        
    }
}

class Dice{
    let sides:Int
    init(sides:Int){
        self.sides = sides
    }
    func roll()->Int{
        return Int(arc4random()) % sides + 1
    }
}

protocol DiceGameDelegate{
    func gameDidStart(_ game:DiceGame)
    func gameDidEnd(_ game:DiceGame)
    func game(_ game:DiceGame, didStartNewTurnWithDiceRoll diceRoll:Int)
}
protocol DiceGame{
    var dice:Dice{get}
    func play()
}

class SnakeAndLadder:DiceGame{
    let finalSquare = 25
    var square = 0
    var delegate:DiceGameDelegate?
    
    let dice = Dice(sides: 6)
    func play(){
        square = 0
        delegate?.gameDidStart(self)
        while square < finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            square += diceRoll
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker : DiceGameDelegate{
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        print("The game is using \(game.dice.sides) sided dice.")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns)")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    
}

let game = SnakeAndLadder()
let tracker = DiceGameTracker()
game.delegate = tracker

game.play()


// error handling
enum DateParingError : Error{
    case OverSizeString
    case UnderSizeString
}
func parseDate(param:String) throws -> Int{
    guard param.count == 10 else{
        if param.count > 10{
           throw DateParingError.OverSizeString
        }else{
            throw DateParingError.UnderSizeString
        }
    }
    return 10
}

do{
    try parseDate(param: "1234")
}catch let error {
    print(error.localizedDescription)
}







class Foo{
    class func fooTypeMethod(){
        print("hello world")
    }
}

class FooChild:Foo{
    override class func fooTypeMethod(){
        print("hello child world")
    }
}
Foo.fooTypeMethod()
FooChild.fooTypeMethod()













