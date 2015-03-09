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
        println("My score array count is \(scores.count)");
        println("Current row \(indexPath.row)")
        println(scores.count - (indexPath.row+1))
        
        var idx = scores[scores.count - (indexPath.row+1)];
        
        //let colorName = colorNames[indexPath.row]
        //cell.colorLabel.text = colorName
        
        //cell.backgroundColor = colors[colorName]
        if idx.outcome == Outcome.Win
        {
            cell.rightColorSquare.backgroundColor = UIColor.greenColor()// colors[colorName]
        }
        else if (idx.outcome == Outcome.Tie)
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
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        println(dateFormatter.stringFromDate(idx.timeStamp))
        
        cell.colorLabel.text = idx.timeStamp.description //idx.outcome.description
        cell.descriptionLabel.text = idx.description
        
        
        // cell.imageView
        // cell.detailTextLabel
        return cell
    }

    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
    }
    
    /*
    func insertNewObject(sender: AnyObject) {
        objects.insertObject(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}