//
//  SavedProviderProfileViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/20/20.
//

import UIKit
import Parse

class EditProviderProfileViewController: UIViewController {
    
    var event : PFObject!
    var events = [PFObject]()
    var providerUser : PFObject!
    var providerProfiles = [PFObject]()
    
    
    @IBOutlet weak var providerPhoneField: UITextField!
    @IBOutlet weak var providerWebsiteField: UITextField!
    @IBOutlet weak var providerEmailField: UITextField!
    @IBOutlet weak var providerZipCodeField: UITextField!
    @IBOutlet weak var providerStateField: UITextField!
    @IBOutlet weak var providerCityField: UITextField!
    @IBOutlet weak var providerAddressField: UITextField!
    @IBOutlet weak var providerNameField: UITextField!
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    
    
 //    @IBOutlet weak var eventImageView: UIImageView!
 //
 //    @IBOutlet weak var providerProfilePhoto: UIImageView!
 //    @IBOutlet weak var synopsisLabel: UILabel!
 //    @IBOutlet weak var providerName: UILabel!
 //    @IBOutlet weak var eventDate: UILabel!
 //    @IBOutlet weak var eventTitle: UILabel!
 //    @IBOutlet weak var checkboxCOVIDsafe: UILabel!
 //    @IBOutlet weak var eventRegistrants: UILabel!
 //    @IBOutlet weak var availableSpots: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //  showUserInfo()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onEditButton(_ sender: Any) {
    }
//    //Create arbitrary key "providerAddress", "providerName" etc.
//    providerUser["providerName"] = providerNameField.text!
//    //Create provider of the profile will be current user
//    providerUser["provider"] = PFUser.current()!
//    //Create provider's address
//    providerUser["providerAddress"] = providerAddressField.text!
//    //Create provider's city
//    providerUser["providerCity"] = providerCityField.text!
//    //Create provider's State
//    providerUser["providerState"] = providerStateField.text!
//    //Create provider's Zip Code
//    providerUser["providerZipCode"] = providerZipCodeField.text!
//    //Create provider's email
//    providerUser["providerEmail"] = providerEmailField.text!
//    //Create provider's website
//    providerUser["providerWebsite"] = providerWebsiteField.text!
//    //Create provider's phone
//    providerUser["providerPhone"] = providerPhoneField.text!
    
// private func showUserInfo(){
//    if  PFUser.current() != nil{
//        if let user = PFUser.current(){
//   //var user = PFUser(className: "_User")
//
//    //to read ProviderProfile
//    let queryProvider = PFQuery(className:"ProviderProfile")
//    queryProvider.includeKeys(["provider.username", "profilePhotoImageView", "providerName", "providerAddress", "providerCity", "providerState", "providerZipCode", "providerEmail", "providerWebsite", "providerPhone"])
//
////        //display provider name
////        if let user = event["provider"] as? PFUser{
////        providerName.text = user.username
////        }
//
//    providerNameField.text = providerUser["providerName"] as? String
//    providerNameField.sizeToFit()
//
////        synopsisLabel.text = event["synopsis"] as? String
////        synopsisLabel.sizeToFit()
////
////        eventDate.text = event["date"] as? String
////        eventDate.sizeToFit()
////
////        if let imageFile = event["image"] as? PFFileObject{
////        let urlString = imageFile.url!
////        let url = URL(string: urlString)!
////        eventImageView.af.setImage(withURL: url)
////        //To make round corners of the image
////        eventImageView.layer.cornerRadius = 10
////        eventImageView.clipsToBounds = true
////    }
//    }
//    }
    
//       // if case PFUser.current() != nil{
//        if let user = PFUser.current(){
//            //var user = PFUser(className: "_User")
//            print("@@@@@@@@@@@ This is EditProviderProfileViewController")
//            print(user.username ?? "NO USER") as? String
//    }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

