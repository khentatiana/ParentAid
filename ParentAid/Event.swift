//
//  Event.swift
//  ParentAid
//
//  Created by Tatiana on 11/30/20.
//

import Foundation
import Parse

//var events = [PFObject]()

class Event{
    //Establish properties
    var synopsis : String = ""
    var provider : String = ""
    var title : String = ""
    var date : Date
    var image : URL?
    var url : URL?
  // var mainCategory : String
    


//Complete initializer for Event
init(event: [String: Any]){
    //super.init()
    self.synopsis = event["synopsis"] as! String
    //Create provider of the event will be current user
    self.provider = event["provider"] as! String
    //Create title of the event
    self.title = event["title"] as! String
    //Create date of the event
    self.date = event["date"] as! Date
    self.image =  URL(string: event["image"] as! String)
   // mainCategory = Event.getMainCategory(event : event)
    
}
    
//    //Helper function to get First category from restaurant
//    static func getMainCategory(event : [String: Any]) ->String{
//        let events = [PFObject]()
//        return events[0]["title"] as! String
//    }
    
}

