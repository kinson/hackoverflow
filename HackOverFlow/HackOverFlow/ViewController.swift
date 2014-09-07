//
//  ViewController.swift
//  HackOverFlow
//
//  Created by Samuel Hunter on 9/6/14.
//  Copyright (c) 2014 Samuel Hunter. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var elements = [Question]()
    
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
        println(elements.count)
        return elements.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyTestCell", forIndexPath: indexPath) as UITableViewCell
        
        //get dictionary for individual row
        var rowData = elements[indexPath.row]
        
        
        cell.textLabel!.font = UIFont(name: cell.textLabel!.font.fontName, size: 14)
        cell.textLabel!.text = rowData.questionText
        
        cell.detailTextLabel!.font = UIFont(name: cell.textLabel!.font.fontName, size: 10)
        
        
        //change text color of detail label
        //cell.detailTextLabel!.textColor = UIColor(red: CGFloat(228), green: CGFloat(233), blue: CGFloat(238), alpha: CGFloat(1.0))
        var subString = ""
        for i in 0...(rowData.tags.count-1)
        {
            var oneTag = rowData.tags[i] as String
            subString += ((oneTag) + ((i != rowData.tags.count-1) ? ", " : ""))
        }
        cell.detailTextLabel!.text = subString
        
        return cell
        
    }
    
    /*override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }*/
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var rowData = elements[indexPath.row]
        
        performSegueWithIdentifier("toQuestionSegue", sender: rowData) //
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toQuestionSegue" {
           let destinationViewController = segue.destinationViewController as QuestionViewController
            
            destinationViewController.questions = [sender as Question]
        }
    }
    
    
    
}

