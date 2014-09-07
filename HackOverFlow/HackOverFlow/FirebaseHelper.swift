//
//  FirebaseHelper.swift
//  HackOverFlow
//
//  Created by Samuel Hunter on 9/6/14.
//  Copyright (c) 2014 Samuel Hunter. All rights reserved.
//

import Foundation

class FirebaseHelper {
    
    var myRootRef: Firebase;
    
    init()
    {
       myRootRef = Firebase(url: "https://hackoverflow.firebaseio.com/")
        
        myRootRef.observeEventType(.Value, withBlock: {
            snapshot in
            println("\(snapshot.name) -> \(snapshot.value)")
        })
        
    }
    
    
    
    
    
    
    
    
    
    
}

