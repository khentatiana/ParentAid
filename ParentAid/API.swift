////
////  API.swift
////  ParentAid
////
////  Created by Tatiana on 11/30/20.
////
//
//import Foundation
//import Parse
//
//struct API {
//    
//
//    static func getEvents(completion: @escaping ([Event]?) -> Void) {
//        
//        // ––––– TODO: Add your own API key!
////        let parseConfig = ParseClientConfiguration {
////                    $0.applicationId = "Jwxuau0jvzMCpZgdxbqkxhKdOCWhZvQb1vPnmrft"
////                    $0.clientKey = "bFrGZppN8H0b8wwCiIVIYmHp8SelomKwhyoOdvmM"
////                    $0.server = "https://parseapi.back4app.com"
////            }
////            Parse.initialize(with: parseConfig)
////
//       // let apikey = "gjSp5LrrEi9tJFLQALnw-RdZSRy-TLiJsfPM09LzFMNpMnmSHQZ2n2R_f3ptONYEalxMIudE9avxn_bQvvDZJc1zpPdfPDOvdh08RlT8vZGbqFx3dbtkuliMwATHXnYx"
//        
//        // Coordinates for San Francisco
////        let lat = 37.773972
////        let long = -122.431297
//        
//        
//    let url = URL(string: "https://parse-dashboard.back4app.com/apps/dc82cc29-73ba-4d69-adc0-263de4c30df7/browser/KidsEvents")!
////
//        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
////
////        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
//        
//        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//        let task = session.dataTask(with: request) { (data, response, error) in
//            // This will run when the network request returns
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data {
//                
//                // ––––– TODO: Get data from API and return it using completion
//                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                
//                let eventDict = dataDictionary["provider"] as! PFUser
//                
//                //let events = eventDict.map({ Event.init(event: $0) })
//                
////              //   Using For Loop
//                var events: [Event] = []
//                for dictionary in dataDictionary {
//                    let event = Event.init(event: dictionary as! [String : Any])
//                    events.append(event)
//                }
//
//                                
//                return completion(events)
//                
//                }
//            }
//        
//            task.resume()
//        
//        }
//    
//    
//
//    
//}
