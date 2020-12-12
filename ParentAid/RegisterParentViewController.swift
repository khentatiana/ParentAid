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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
