//
//  FamilyProfileViewController.swift
//  ParentAid
//
//  Created by Tatiana on 12/12/20.
//

import UIKit
import Parse
import AlamofireImage

class FamilyProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var familyImageView: UIImageView!
    @IBOutlet weak var parentEmailField: UITextField!
    @IBOutlet weak var parentLastNameField: UITextField!
    @IBOutlet weak var parentFirstNameField: UITextField!
    @IBOutlet weak var parentZipCodeField: UITextField!
    @IBOutlet weak var numberOfKidsField: UITextField!
    @IBOutlet weak var childOneAgeField: UITextField!
    @IBOutlet weak var childTwoAgeField: UITextField!
    @IBOutlet weak var childThreeAgeField: UITextField!
    @IBOutlet weak var childFourAgeField: UITextField!
    @IBOutlet weak var childFiveAgeField: UITextField!
    @IBOutlet weak var childSixAgeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveFamilyProfileButton(_ sender: Any) {
        
       // Create new object "ProviderProfile" that will be stored in table "ProviderProfile"
        let parentUser = PFObject(className: "ParentProfile")

        //Create arbitrary key "providerAddress", "providerName" etc.
        parentUser["parentFirstName"] = parentFirstNameField.text!
        //Create provider of the profile will be current user
        parentUser["provider"] = PFUser.current()!
        //Create provider's address
        parentUser["parentLastName"] = parentLastNameField.text!
        //Create provider's city
        parentUser["parentEmail"] = parentEmailField.text!
        //Create provider's State
        parentUser["parentZipCode"] = parentZipCodeField.text!
        //Create provider's Zip Code
        parentUser["numberOfKids"] = numberOfKidsField.text!
        //Create provider's email
        parentUser["ageOfChildOne"] = childOneAgeField.text!
        //Create provider's website
        parentUser["ageOfChildTwo"] = childTwoAgeField.text!
        //Create provider's phone
        parentUser["ageOfChildThree"] = childThreeAgeField.text!
        //Create provider's email
        parentUser["ageOfChildFour"] = childFourAgeField.text!
        //Create provider's website
        parentUser["ageOfChildFive"] = childFiveAgeField.text!
        //Create provider's phone
        parentUser["ageOfChildSix"] = childSixAgeField.text!
        
        //create arbitrary key "providerProfileImage"
        let imageData = familyImageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        parentUser["familyProfileImageView"] = file
        //save the object ("post")to the table
        parentUser.saveInBackground{(success, error) in
            if success {
                //self.dismiss(animated: true, completion: nil)
                print("Saved family profile!!!")
            } else {
                print ("Error family profile !!!")
            }
        }


        
    }

    @IBAction func tappedFamilyProfilePhoto(_ sender: Any) {
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

        familyImageView.image = scaledImage
        //dismiss camera view
        dismiss(animated: true, completion: nil)
    }


    @IBAction func onCancelFamilyProfileButton(_ sender: Any) {
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
        parentFirstNameField.text = ""
        parentLastNameField.text = ""
        parentEmailField.text = ""
        parentZipCodeField.text = ""
        numberOfKidsField.text = ""
        childOneAgeField.text = ""
        childTwoAgeField.text = ""
        childThreeAgeField.text = ""
        childFourAgeField.text = ""
        childFiveAgeField.text = ""
        childSixAgeField.text = ""
             
      }
    

}

