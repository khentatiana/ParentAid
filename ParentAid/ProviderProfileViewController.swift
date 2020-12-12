//
//  ProviderProfileViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/19/20.
//

import UIKit
import AlamofireImage
import Parse

class ProviderProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var providerPhoneField: UITextField!
    @IBOutlet weak var providerWebsiteField: UITextField!
    @IBOutlet weak var providerEmailField: UITextField!
    @IBOutlet weak var providerZipCodeField: UITextField!
    @IBOutlet weak var providerStateField: UITextField!
    @IBOutlet weak var providerCityField: UITextField!
    @IBOutlet weak var providerAddressField: UITextField!
    @IBOutlet weak var providerNameField: UITextField!
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
    
    @IBAction func saveProfileButton(_ sender: Any) {
        // Create new object "ProviderProfile" that will be stored in table "ProviderProfile"
        let providerUser = PFObject(className: "ProviderProfile")
      
        //Create arbitrary key "providerAddress", "providerName" etc.
        providerUser["providerName"] = providerNameField.text!
        //Create provider of the profile will be current user
        providerUser["provider"] = PFUser.current()!
        //Create provider's address
        providerUser["providerAddress"] = providerAddressField.text!
        //Create provider's city
        providerUser["providerCity"] = providerCityField.text!
        //Create provider's State
        providerUser["providerState"] = providerStateField.text!
        //Create provider's Zip Code
        providerUser["providerZipCode"] = providerZipCodeField.text!
        //Create provider's email
        providerUser["providerEmail"] = providerEmailField.text!
        //Create provider's website
        providerUser["providerWebsite"] = providerWebsiteField.text!
        //Create provider's phone
        providerUser["providerPhone"] = providerPhoneField.text!
               
        //create arbitrary key "providerProfileImage"
        let imageData = profilePhotoImageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        providerUser["profilePhotoImageView"] = file
        //save the object ("post")to the table
        providerUser.saveInBackground{(success, error) in
            if success {
                //self.dismiss(animated: true, completion: nil)
                print("Saved provider profile!!!")
            } else {
                print ("Error provider profile !!!")
            }
        }
        
     
     //   self.performSegue(withIdentifier: "SavedProviderProfileViewController", sender: nil)
        
        
    }
       
    
 
    @IBAction func tappedProviderProfilePhoto(_ sender: UITapGestureRecognizer) {
    
        //instanciate picker conrtroller
        var myPickerConroller = UIImagePickerController()
        //give it control
        myPickerConroller.delegate = self
        //allow to edit
        myPickerConroller.allowsEditing = true
        //Provide source from where to obtain photo
        //Check if camera is available, if not then use photoLibrary
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            myPickerConroller.sourceType = .camera
            
        }else {
            myPickerConroller.sourceType = .photoLibrary
        }
        //present picker conrtroller
        present(myPickerConroller, animated: true, completion: nil)
        //when user select image the function imagePickerController() will be called
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        //Set image to  @IBOutlet weak var profilePhotoImageView: UIImageView!
        let image = info [.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageAspectScaled(toFill: size)
        
        profilePhotoImageView.image = scaledImage
        //dismiss camera view
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func onCancelSavingProfileButton(_ sender: Any) {
                //clean textfields
                        cleanTextFields()
                //dismiss keyboard
                       dismissKeyboard()
                //dismiss view
                      self.dismiss(animated: true, completion: nil)
    }
    

    //MARK: Keyboard functions
    //dismiss keyboard by clicking outside textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //dismiss keyboard
    func dismissKeyboard(){
        self.view.endEditing(false)
    }
    //clean textfields
    func cleanTextFields(){
        providerNameField.text = ""
        providerAddressField.text = ""
        providerCityField.text = ""
        providerStateField.text = ""
        providerZipCodeField.text = ""
        providerWebsiteField.text = ""
        providerPhoneField.text = ""
      }
    
    
    @IBAction func kidsEventsTabButton(_ sender: Any) {
    self.performSegue(withIdentifier: "ProviderKidsEventsViewController", sender: nil)
//    }
    
}
}
