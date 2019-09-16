//: Playground - noun: a place where people can play

import UIKit


class Dice{
    let side:Int
    init(side:Int){
        self.side = side
    }
    
    func roll()->Int{
        return Int(arc4random())%side + 1
    }
}

let d = Dice(side: 6)
d.roll()

protocol DiceGame{
    var dice:Dice{ get }
    func play()
}

protocol DiceGameDelegate{
    func gameDidStart(_ game:DiceGame)
    func gameDidEnd(_ game:DiceGame)
    func game(_ game:DiceGame, didStartNewTurnDiceRoll diceRoll:Int)
}

class SnakeAndLadder : DiceGame{
    let finalSquare = 25
    var square = 0
    var delegate:DiceGameDelegate?
    let dice = Dice(side: 6)
    
    func play(){
        square = 0
        delegate?.gameDidStart(self)
        while square<finalSquare{
            let diceRoll = dice.roll()
            square += diceRoll
            delegate?.game(self, didStartNewTurnDiceRoll: diceRoll)
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker : DiceGameDelegate{
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        print("The game is using \(game.dice.side) sided dice")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns)")
    }
    func game(_ game: DiceGame, didStartNewTurnDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
}

let tracker = DiceGameTracker()
let game = SnakeAndLadder()
game.delegate = tracker
game.play()








