
import UIKit

var str = "Hello, playground"


enum RPS:Printable {
    case Rock
    case Paper
    case Scissors
    
    
    init(){
        self = .Rock
        
        let randomNumber = Int(arc4random()%2)+1
        println (randomNumber)
        
        if (randomNumber == 0){
            self = .Rock
        }
        if (randomNumber == 1){
            self = .Paper
        }
        if (randomNumber == 2){
            self = .Scissors
        }
        
    }
    
    var description:String{
        switch self {
        case .Paper:
            return("Paper")
        case .Rock:
            return("Rock")
        case .Scissors:
            return("Scissors")
        }
    }
    
}


enum Outcome:Printable {
    case Win
    case Loss
    case Tie
    
    
    var description:String{
        switch self {
        case .Win:
            return("Win")
        case .Loss:
            return("Loss")
        case .Tie:
            return("Tie")
        }
    }
    
}

struct RPSMatch{
    var playerMove: RPS = RPS.Rock
    var opponentMove: RPS = RPS.Rock
    
    /*
    init(_pmove:RPS, _omove:RPS)
    {
    playerMove = _pmove;
    opponentMove = _omove;
    }
    */

    
    var description: String {
        get {
            let temp:String = playerMove.description + " vs " + opponentMove.description + ". " + outcome.description + "."
            
            return temp
        }
        
    }
    var outcome: Outcome {
        get {
            var temp:Outcome = Outcome.Tie
            
            println(self.playerMove.description)
            println(self.opponentMove.description)
            
            
            if (playerMove == RPS.Rock)
            {
                if (opponentMove == RPS.Scissors){
                    temp =  Outcome.Win
                }
                
                if (opponentMove == RPS.Paper){
                    temp =  Outcome.Loss
                }
            }
                
                
            else if (playerMove == RPS.Paper)
            {
                if (opponentMove == RPS.Scissors){
                    temp =  Outcome.Loss
                }
                
                if (opponentMove == RPS.Rock){
                    temp =  Outcome.Win
                }
            }
                
            else if (playerMove == RPS.Scissors)
            {
                if (opponentMove == RPS.Paper){
                    temp =  Outcome.Win
                }
                
                if (opponentMove == RPS.Rock){
                    temp =  Outcome.Loss
                }
            }
            
            return temp
        }
    }
    
    
    
}

/*

var pm: RPS = RPS()
var om: RPS = RPS()


println(pm.description)
println(om.description)

var match:RPSMatch = RPSMatch(_pmove:pm, _omove:om)
println(match.playerMove.description)
println(match.opponentMove.description)



match.playerMove.description
match.opponentMove.description
match.outcome.description


println(match.description)

*/