//
//  Question.swift
//  HackOverFlow
//
//  Created by Samuel Hunter on 9/7/14.
//  Copyright (c) 2014 Samuel Hunter. All rights reserved.
//

import UIKit

class Question {
    
    var posterName : String
    var questionText : String
    var datePosted : String
    var emailAddress : String
    var status : Int
    var tags : [String]
    var location : [[String : String]] //array of string/string dict
    
    init(var name: String, var question: String, var date: String, var email: String, var stat: Int, var tagArray: [String], var locationArray: [[String : String]])
    {
        self.posterName = name
        self.questionText = question
        self.datePosted = date
        self.emailAddress = email
        self.status = stat
        self.tags = tagArray
        self.location = locationArray
    }
    
    
    
    
    
    
}
