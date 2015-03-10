//
//  ViewController.swift
//  RPS
//
//  Created by misha birman1 on 2/21/15.
//  Copyright (c) 2015 misha birman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var match:RPSMatch = RPSMatch()
    var scores:[RPSMatch] = []
    
    @IBAction func ButtonClicked(sender: UIButton) {
        var pm: RPS = RPS.Rock
        var om: RPS = RPS()
        
        // var match:RPSMatch = RPSMatch(_pmove:pm, _omove:om)
        // assignment says that The second view controller should randomly select a move for the app
        //match.opponentMove = om;
        match.playerMove = pm;
        match.opponentMove = om
        match.timeStamp = NSDate()
        
        scores.append(match)
        
        performSegueWithIdentifier("ABCDE", sender: self)
    }
    
    @IBAction func Button2Clicked(sender: UIButton) {
        var pm: RPS = RPS.Scissors
        var om: RPS = RPS()
        
        let blueViewController = self.storyboard!.instantiateViewControllerWithIdentifier("XYZ") as BlueViewController
        // assignment says that The second view controller should randomly select a move for the app
        //match.opponentMove = om;
        match.playerMove = pm
        match.opponentMove = om
        match.timeStamp = NSDate()

        // add to array
        scores.append(match)
        blueViewController.match = match
        match.playerMove = pm;
        presentViewController(blueViewController, animated: true, completion: nil)
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ABCDE"){
            var blueViewController = segue.destinationViewController as BlueViewController
            blueViewController.match = match
            // generate a random number and set the value property
            // blueViewController.value = 1 + Int(arc4random() % 6)
        }
        
        if (segue.identifier == "@destination")
        {
            var pm: RPS = RPS.Paper
            var om: RPS = RPS()
            
            match.playerMove = pm
            match.opponentMove = om
            match.timeStamp = NSDate()

            // add to array for history table
            scores.append(match)
           
            // assignment says that The second view controller should randomly select a move for the app
            //var om: RPS = RPS()
            // match.opponentMove = om;
            
            
            var blueViewController = segue.destinationViewController as BlueViewController
            blueViewController.match = match
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "History", style: UIBarButtonItemStyle.Plain, target: self, action: "pop")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func pop()
    {
        let historyViewController = self.storyboard?.instantiateViewControllerWithIdentifier("History") as HistoryViewController
        
        self.navigationController?.pushViewController(historyViewController, animated: true)
        historyViewController.scores = self.scores;
        // self.navigationController!.popToViewController(self, animated: true)
    }

}

