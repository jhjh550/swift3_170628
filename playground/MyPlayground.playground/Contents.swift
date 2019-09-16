//: Playground - noun: a place where people can play

import UIKit


// dictionary
var capital = ["kr":"seoul", "en":"london", "fr":"paris"]
capital["jp"]="tokyo"
for cap in capital{
    let (key, value) = cap
    print("key: \(key) value: \(value)")
}




// tuple
let myTuple = ("hello", "world", 1, true)
let(a,b,c,d) = myTuple
b

let tupleValue:(String, Character, Int, Bool) = ("a", "b", 1, false)



// set
var genre : Set = ["Rock", "Ballad"]
genre.insert("Classic")
genre.insert("Classic")
genre.remove("Rock")
genre


// Array
//var cityRow = Array<String>()
//cityRow.append("hello")



var list = [String]()
list.append("hello")
list.append("world")
list.insert("oraclejava", at: 1)

var alphabet = ["a", "b", "c", "d", "e"]
alphabet[0...2]
alphabet[1...2] = ["1", "2", "4"]
alphabet


var myVal = 2
switch myVal {
case 0...5:
    print("value is \(myVal)")
default:
    print("hello world")
}

let age = 20
let adult = 19
if age < adult {
    print("미성년자입니다.")
}else{
    print("성인입니다.")
}


var n = 1000
while n < 1000 {
    n = n * 2
}

var n1 = 1000
repeat{
    n1 = n1 * 2
}while n1 < 1000

print("end of while")


for row in 1..<5 {
    print("\(row) hello world");
}
//
//for(int row=1; row<=5; row++){
//    
//}
