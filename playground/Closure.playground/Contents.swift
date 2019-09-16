//: Playground - noun: a place where people can play

import UIKit

// method
struct Resolution{
    var width = 0
    var height = 0
    func desc()->String{
        let desc = "resolution is \(self.width) \(self.height)"
        return desc
    }
}

struct MyPoint{
    var x=0.0, y=0.0
    mutating func move(deltaX x:Double, deltaT y:Double){
        self.x = x
        self.y = y
    }
}


class TypeClass{
    class func myFuncTypeClass(){
        
    }
}

TypeClass.myFuncTypeClass()
var tc = TypeClass()









// property observer
struct Job{
    var income : Int = 0 {
        willSet(newIncome){
            print("income will be \(newIncome)")
        }
        didSet{
            if income>oldValue{
                print("income increase \(income-oldValue)")
            }else{
                print("income decrease \(oldValue-income)")
            }
        }
    }
}
var job = Job(income: 100)
job.income = 200


// type property //
class TypeTest{
    static var sTest = "hello type property"
    
    class var s2Test : Int{
        return 100
    }
}
TypeTest.sTest





// class/struct
struct MyLength{
    let startValue:Int
    var length:Int
}
var myLength = MyLength(startValue: 10, length: 20)
myLength.length = 30
print(myLength.length)

class MyCreate{
    init(){
        print("MyCreate!!")
    }
}

class LazyTest{
    var base = 0
    lazy var late = MyCreate()
    
    init(){
        print("Lazy Test!!!")
    }
}
let lz = LazyTest()
lz.late


struct MyRect{
    var originX:Double = 0.0
    var originY:Double = 0.0
    var sizeX:Double = 0.0
    var sizeY:Double = 0.0
    
    var centerX:Double{
        get{
            return originX + (sizeX/2)
        }
        set(newCenterX){
           originX = newCenterX - (sizeX/2)
        }
    }
    var centerY:Double{
        get{
            return originY + (sizeY/2)
        }
        set(newCenterY){
            originY = newCenterY - (sizeY/2)
        }
    }
}

var square = MyRect(originX: 0.0, originY: 0.0, sizeX: 10.0, sizeY: 10.0)
print("center : \(square.centerX), \(square.centerY)")
square.centerX = 100.0






// closure
var cf1 = {()->() in
    print("closure")
}
cf1()

let cf2 = {(s1:Int, s2:String)->() in
    print("s1:\(s1) s2:\(s2)")
}
cf2(1,"hello")


var myArray = [1,9,5,7,3,2]

func order(s1:Int, s2:Int)->Bool{
    if s1>s2 {
        return true
    }else{
        return false
    }
}
myArray.sort(by: order)

myArray.sorted(by:{ $0>$1 })







