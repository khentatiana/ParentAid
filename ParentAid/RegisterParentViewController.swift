//
//  RegisterParentViewController.swift
//  ParentAid
//
//  Created by Tatiana on 12/11/20.
//

import UIKit
import Parse
import AlamofireImage

class RegisterParentViewController: UIViewController {
    
    
    var event : PFObject!
    var events = [PFObject]()
    var providerUser : PFObject!
    var providerProfiles = [PFObject]()
    static let createEventNotification = Notification.Name("createEventNotification")
    
    @IBOutlet weak var eventRegisterImageView: UIImageView!
    @IBOutlet weak var providerPhotoRegisterImageView: UIImageView!
    @IBOutlet weak var eventTitleRegisterLabel: UILabel!
    @IBOutlet weak var eventDateRegister: UILabel!
    @IBOutlet weak var providerNameRegister: UILabel!
    @IBOutlet weak var synopsisLabelRegister: UILabel!
    @IBOutlet weak var checkboxCOVIDsafeRegister: UILabel!
    @IBOutlet weak var availableSpotsRegister: UILabel!
    @IBOutlet weak var numberOfRegistrantsField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //display provider name
        let user = event["provider"] as! PFUser
        providerNameRegister.text = user.username
        
        eventTitleRegisterLabel.text = event["title"] as? String
        eventTitleRegisterLabel.sizeToFit()
        
        synopsisLabelRegister.text = event["synopsis"] as? String
        synopsisLabelRegister.sizeToFit()
        
        eventDateRegister.text = event["date"] as? String
        eventDateRegister.sizeToFit()
        
        let imageFile = event["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        eventRegisterImageView.af.setImage(withURL: url)
        //To make round corners of the image
        eventRegisterImageView.layer.cornerRadius = 10
        eventRegisterImageView.clipsToBounds = true
    }
    
    @IBAction func onJoinButton(_ sender: Any) {
        // Create new object "event" that will be stored in table "KidsEvents"
        let event = PFObject(className: "KidsEvents")
        //Create properties (arbitrary key) of the object "event" such as "synopsis", "provider", "title" etc.
        event["numberOfRegistrants"] = numberOfRegistrantsField.text!
        //Create provider of the event will be current user
        event["registrant"] = PFUser.current()!
        //Create title of the event
        
        //Save the object ("event")to the table
        event.saveInBackground{(success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("Rregistered for event!!!")
                NotificationCenter.default.post(name: RegisterParentViewController.createEventNotification, object: nil)
            } else {
                print ("Error regestering for event!!!")
            }
        }
        
        
    }
    
    //    @IBAction func onSubmitButton(_ sender: Any) {
    //        // Create new object "event" that will be stored in table "KidsEvents"
    //        let event = PFObject(className: "KidsEvents")
    //        //Create properties (arbitrary key) of the object "event" such as "synopsis", "provider", "title" etc.
    //        event["synopsis"] = eventDescriptionField.text!
    //        //Create provider of the event will be current user
    //        event["provider"] = PFUser.current()!
    //        //Create title of the event
    //        event["title"] = eventTitleField.text!
    //        //Create date of the event
    //       event["date"] = eventDateField.text!
    //        //Create time of the event
    //       event["time"] = eventTimeField.text!
    //        //Create address of the event
    //       event["address"] = eventAddressField.text!
    //        //Create city of the event
    //       event["city"] = eventCityField.text!
    //        //Create state of the event
    //       event["state"] = eventStateField.text!
    //        //Create zipCode of the event
    //       event["zipCode"] = eventZipCodeField.text!
    //        //Create availableSpots of the event
    //       event["availableSpots"] = eventAvailableSpots.text!
    //        //Create covidSafe of the event
    //       event["covidSafe"] = eventCOVIDField.text!
    //
    //
    //        let imageData = imageView.image!.pngData()
    //        let file = PFFileObject(data: imageData!)
    //        event["image"] = file
    //        //Save the object ("event")to the table
    //        event.saveInBackground{(success, error) in
    //            if success {
    //                self.dismiss(animated: true, completion: nil)
    //                print("Saved event!!!")
    //                NotificationCenter.default.post(name: PostEventViewController.createEventNotification, object: nil)
    //            } else {
    //                print ("Error saving event!!!")
    //            }
    //        }
    //
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
