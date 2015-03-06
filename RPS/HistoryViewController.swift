//
//  HistoryViewController.swift
//  RPS
//
//  Created by misha birman1 on 3/5/15.
//  Copyright (c) 2015 misha birman. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var scores: [RPSMatch]!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as ColorTableViewCell
        println(scores.count)
        println(indexPath.row.distanceTo(0))
        
        // var idx = scores[scores.count - 1];
        //let colorName = colorNames[indexPath.row]
        //cell.colorLabel.text = colorName
        
        //cell.backgroundColor = colors[colorName]
        if scores[indexPath.row].outcome == Outcome.Win
        {
            cell.rightColorSquare.backgroundColor = UIColor.greenColor()// colors[colorName]
        }
        else if (scores[indexPath.row].outcome == Outcome.Tie)
        {
            cell.rightColorSquare.backgroundColor = UIColor.yellowColor()
        }
        else
        {
            cell.rightColorSquare.backgroundColor = UIColor.redColor()
        }
        //cell.colorLabel.textColor = UIColor.whiteColor();
        // cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        //cell.textLabel!.textColor = colors[colorName];
        cell.colorLabel.text = scores[indexPath.row].outcome.description
        cell.descriptionLabel.text = scores[indexPath.row].description
        
        // cell.imageView
        // cell.detailTextLabel
        return cell
    }

    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("My score array count is \(scores.count)");
    }
}