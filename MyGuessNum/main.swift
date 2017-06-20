//
//  main.swift
//  MyGuessNum
//
//  Created by iii on 2017/6/12.
//  Copyright © 2017年 iii. All rights reserved.
//

import Foundation

//產生謎底
func createAnswer(d:Int) -> String {
    var rs = Set<Int>()
    var rand: Int
    while rs.count < d {
        rand = Int(arc4random_uniform(10))
        rs.insert(rand)
    }
    var ret = ""
    for v in rs {
        ret += String(v)
        
    }
    
    return ret
}

//比對
func checkAB(answer:String, guess:String) -> String {
    var A = 0, B = 0
    var ca:String, cg:String
    for i in 0..<answer.characters.count{
        ca = substring(str: answer, start: i, len: 1)
        cg = substring(str: guess, start: i, len: 1)
        if ca == cg {
            A += 1
        }else  if answer.contains(cg) {
            B += 1
        }
    }
    return "\(A)A\(B)B"
}

func substring(str:String, start:Int, len:Int) -> String {
    let sindex = str.index(str.startIndex, offsetBy: start)//start起始的index
    let eindex = str.index(str.startIndex, offsetBy: start + len)
    let range = sindex..<eindex
    
    return str.substring(with: range)
}
let args = CommandLine.arguments //[String]
for arg in args {
    print(arg)
}

let d:Int? = Int(args[1])


// main flow
let answer = createAnswer(d:d!);
//print(answer)
var guess: String?
var isWin:Bool = false

for i in 1...10{
    print("\(i). 請猜一個數字: ", terminator: "")
    guess = readLine()
    if let gus = guess {
        let result = checkAB(answer: answer, guess: gus)
        print("\(guess!) => \(result)")
        if result == "\(d!)A0B" {
            isWin = true
            break
        }
    }
}

if isWin {
    print("WINNER")
}else {
    print("Loser:\(answer)")
}
