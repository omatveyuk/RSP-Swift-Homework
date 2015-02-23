//
//  BlueViewController.swift
//  RPS
//
//  Created by misha birman1 on 2/21/15.
//  Copyright (c) 2015 misha birman. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {
    
    var match:RPSMatch!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    
    // When the view appears, we updated the label
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        label.text = "\(match.outcome)"
        label2.text = "\(match.description)"
    }
    
    @IBAction func returnToOrangeController() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var om: RPS = RPS()
        match.opponentMove = om;
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}