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
    
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
    
    @IBAction func addProfilePhotoButton(_ sender: Any) {
        // Create new object "ProviderProfile" that will be stored in table "ProviderProfile"
        let user = PFObject(className: "ProviderProfile")
       
        //create arbitrary key "providerProfileImage"
        let imageData = profilePhotoImageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        user["providerProfileImage"] = file
        //save the object ("post")to the table
        user.saveInBackground{(success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("Saved profile picture!!!")
            } else {
                print ("Error profile picture!!!")
            }
        }
        
        
        
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
   
}
