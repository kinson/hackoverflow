//
//  FirebaseHelper.swift
//  HackOverFlow
//
//  Created by Samuel Hunter on 9/6/14.
//  Copyright (c) 2014 Samuel Hunter. All rights reserved.
//

import Foundation

class FirebaseHelper {
    var myRootRef: Firebase

    let fetchHandler: [Question] -> Void //clojure that returns nothing
    
    private var multiDataPrivate = [Question]() //private array of dicts (to prevent modifying the same array on multiple threads)
    
    private var firebaseObservationHandle: UInt? //what is UInt?
    
    let queue = dispatch_queue_create("com.firebasehelp.queue", DISPATCH_QUEUE_SERIAL)
    
    
    init(fetchHandler: [Question] -> Void) {
        myRootRef = Firebase(url: "https://hackoverflow.firebaseio.com/samsstuff")
        
        self.fetchHandler = fetchHandler
        
//        myRootRef.observeEventType(.ChildAdded, withBlock: { snapshot in
//            var tableData = ["posterName" : snapshot.value.objectForKey("posterName")!]
//            tableData["questionText"] = snapshot.value.objectForKey("questionText")!
//            self.multiData.append(tableData)
//        
//            println(self.multiData.count)
//            
//            fetchHandler()
//        })
    }
    
    func startObserving() {
        // TODO: look at closure capture lists and what a strong reference cycle is (and how to break one like we're doing here!)
        firebaseObservationHandle = myRootRef.observeEventType(.ChildAdded, withBlock: { [weak self] snapshot in
            if let strongSelf = self {
                let posterName = snapshot.value["posterName"] as String
                let questionText = snapshot.value["questionText"] as String
                let datePosted = snapshot.value["datePosted"] as String
                let emailAddress = snapshot.value["emailAddress"] as String
                let status = snapshot.value["status"] as Int
                let tags = snapshot.value["tags"] as NSArray
                let location = snapshot.value["location"] as String
                
                let tableData = Question(name: posterName, question: questionText, date: datePosted, email: emailAddress, stat: status, tagArray: tags, locationArray: location)
                /*[
                    "posterName": posterName,
                    "questionText": questionText,
                    "datePosted": datePosted,
                    "emailAddress" : emailAddress
                    //"status" : status
                    //how do I get an array?
                ]*/
                
                dispatch_async(strongSelf.queue) {
                    strongSelf.multiDataPrivate += [tableData]

                    strongSelf.fetchHandler(strongSelf.multiDataPrivate)
                }
            }
        })
    }
    
    func stopObserving() {
        if let handle = firebaseObservationHandle {
            myRootRef.removeObserverWithHandle(handle)
        }
    }
}

