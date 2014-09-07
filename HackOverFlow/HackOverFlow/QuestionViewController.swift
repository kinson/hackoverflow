//
//  QuestionViewController.swift
//  HackOverFlow
//
//  Created by Samuel Hunter on 9/7/14.
//  Copyright (c) 2014 Samuel Hunter. All rights reserved.
//

import UIKit
import Foundation

class QuestionViewController: UIViewController {
    var questions: [Question]!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var submittedLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!

    override func viewDidLoad() {
        
        
        //load and size image
        var imageView = UIImageView(frame: CGRectMake(10, 65, 100, 100));
        var image = UIImage(named: "user_image.jpg");
        imageView.image = image;
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        self.view.addSubview(imageView)
        
        
        questionLabel.text = questions[0].questionText
        statusLabel.text = (questions[0].status == 1) ? "Completed" : "Not Yet Completed"
        submittedLabel.text = questions[0].posterName
        var subString = ""
        for i in 0...(questions[0].tags.count-1)
        {
            var oneTag = questions[0].tags[i] as String
            subString += ((oneTag) + ((i != questions[0].tags.count-1) ? ", " : ""))
        }
        tagsLabel.text = subString
        
        //self.view.backgroundColor = UIColor(patternImage: "background.jpg", alpha: 1.0,)
        //self.view.backgroundColor!(UIColor.blackColor())
        
        
        
    }
    
    
    
    
    //println("say my name")
    //println(questions)
}
