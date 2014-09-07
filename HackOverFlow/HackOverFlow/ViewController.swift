//
//  ViewController.swift
//  HackOverFlow
//
//  Created by Samuel Hunter on 9/6/14.
//  Copyright (c) 2014 Samuel Hunter. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var elements = [[String: String]]()
    
    var firebasehelp : FirebaseHelper! //implicitly unwrapped optional
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        if firebasehelp == nil {
            firebasehelp = FirebaseHelper { data in
                dispatch_async(dispatch_get_main_queue()) {
                    self.elements = data
                    
                    self.tableView.reloadData()
                }
            }
        }
        
        firebasehelp.startObserving()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        firebasehelp.stopObserving()
    }
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        
        //cell.textLabel.text = "Row #\(indexPath.row)"
        //cell.detailTextLabel.text = "Subtitle #\(indexPath.row)"
        
        return tableView.dequeueReusableCellWithIdentifier("MyTestCell", forIndexPath: indexPath) as UITableViewCell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        //get dictionary for individual row
        var rowData = elements[indexPath.row]
        
        
        cell.textLabel!.font = UIFont(name: cell.textLabel!.font.fontName, size: 10)
        cell.textLabel!.text = rowData["questionText"]!
        
        
        //change text color of detail label
        //cell.detailTextLabel!.textColor = UIColor(red: CGFloat(228), green: CGFloat(233), blue: CGFloat(238), alpha: CGFloat(1.0))
        cell.detailTextLabel!.text = rowData["posterName"]!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var rowData = elements[indexPath.row]
        
        performSegueWithIdentifier("toQuestionSegue", sender: rowData) //
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toQuestionSegue" {
           let destinationViewController = segue.destinationViewController as QuestionViewController
            
            destinationViewController.dict = sender as [String: String]
        }
    }
    
    
    
}

