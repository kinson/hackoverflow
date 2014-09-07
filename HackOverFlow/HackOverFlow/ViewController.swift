//
//  ViewController.swift
//  HackOverFlow
//
//  Created by Samuel Hunter on 9/6/14.
//  Copyright (c) 2014 Samuel Hunter. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    @IBOutlet weak var appsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        
        //cell.textLabel.text = "Row #\(indexPath.row)"
        //cell.detailTextLabel.text = "Subtitle #\(indexPath.row)"
        
        return tableView.dequeueReusableCellWithIdentifier("MyTestCell", forIndexPath: indexPath) as UITableViewCell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        
        cell.textLabel!.font = UIFont(name: cell.textLabel!.font.fontName, size: 10)
        cell.textLabel!.text = "I'm having this, that and the other problem with my code. It doesn't compile when I put a banana in the money stand."
        
        //change text color of detail label
        //cell.detailTextLabel!.textColor = UIColor(red: CGFloat(228), green: CGFloat(233), blue: CGFloat(238), alpha: CGFloat(1.0))
        cell.detailTextLabel!.text = "C++, java, bananas, dogs"
    }
    
}

