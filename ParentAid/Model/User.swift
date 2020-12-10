//
//  User.swift
//  ParentAid
//
//  Created by Tatiana on 12/9/20.
//
//
//import Foundation
//import Parse
//
//struct User: Codable, Equatable {
//    var id = ""
//    var username : String
//    var email : String
//    var pushId = ""
//    var avatarLink = ""
//    var status : String
//    
//    static var currentId : String {
//        return PFUser.current()!.objectId!
//        
//    }
//    static var currentUser : PFUser?{
//        if PFUser.current() != nil{
//            if let dictionary = UserDefaults.standard.data(forKey: kCURRENTUSER){
//                let decoder = JSONDecoder()
//                
//                do {
//                    let userObject = try.decoder.decode(User.self , from: dictionary)
//                    return userObject
//                } catch {
//                    print("Error decoding from user defaults", error.localizedDescription)
//                }
//            }
//        }
//    
//    return PFUser
//}
//}
