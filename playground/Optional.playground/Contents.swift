//: Playground - noun: a place where people can play

import UIKit






// nested function(outer, inner function)
func outerFunc(base:Int)->(Int)->String{
    func innerFunc(inc:Int)->String{
        return "return \(inc)"
    }
    return innerFunc
}
let nf1 = outerFunc(base: 3)
let nf2 = nf1(10)

func outerFunc2(base:Int)->(Int)->Int{
    let value = base+20
    func innerFunc2(inc:Int)->Int{
        return inc+value
    }
    return innerFunc2
}
let nf3 = outerFunc2(base: 10)
let nf4 = nf3(10)


// function3
func myFuncP1(param:Int)->Int{
    return param+1
}
func myFuncP2(base:Int, function f:(Int)->Int)->Int{
    return f(base)
}
myFuncP2(base: 10, function: myFuncP1)



func plus(a:Int, b:Int)->Int{
    return a+b
}
func minus(a:Int, b:Int)->Int{
    return a-b
}
func multiply(a:Int, b:Int)->Int{
    return a*b
}
func divide(a:Int, b:Int)->Int{
    guard b != 0 else {
        return 0
    }
    return a/b
}

func calc(_ operand:String)-> (Int,Int)->Int{
    switch operand {
    case "+":
        return plus
    case "-":
        return minus
    case "*":
        return multiply
    case "/":
        return divide
    default:
        return plus
    }
}

let c = calc("+")
c(3,4)








// function2
func foo(base:Int)->String{
    return "result is \(base+1)"
}
let f = foo
f(5)

func myFunc1()->String{
    return "this is myFunc1"
}
func myFunc2()->()->String{
    return myFunc1
}
let f2 = myFunc2
f2()()









// function
func sayHello(){
    print("hello world")
}
sayHello()

func sayHello2()->String{
    return "hello world"
}
print( sayHello() )

func sayHello3(name:String)->String{
    return "hello \(name)"
}
print( sayHello3(name: "jhjh550"))

func sayHelloWithMsg(name:String, welcomeMessage msg:String){
    print("hello \(name) \(msg)")
}
sayHelloWithMsg(name: "jh", welcomeMessage: "welcome function")

func sayHelloWithMsg2(name:String, _ msg:String){
    print("hello \(name) \(msg)")
}
sayHelloWithMsg2(name: "jhjh", "welcome")







var str = "Hello, playground"
var myVal:Int?
myVal = 3
print(myVal)

// forced unwrapping
if myVal != nil{
    let res = myVal! + 4
    print(res)
}else{
    print("myValue is nil")
}

// optional binding
if let val = myVal{
    print(val)
}else{
    print("myValue is nil")
}

var capital = ["kr":"seoul","en":"london", "fr":"paris"]
if let val = capital["jp"]{
    print(val)
}

if myVal == 3 {
    print("myvalue is 3")
}else{
    print("myVlue is not 3")
}








