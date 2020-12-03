//
//  CameraViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/11/20.
//

import UIKit
import AlamofireImage
import Parse

class PostEventViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    


    @IBOutlet weak var eventTimeField: UITextField!
    
    @IBOutlet weak var eventDateField: UITextField!
    @IBOutlet weak var eventDescriptionField: UITextField!
    @IBOutlet weak var eventTitleField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var datePicker = UIDatePicker()
    var timePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventTitleField.delegate = self
        eventDescriptionField.delegate = self
        datePickerEventDate()
        datePickerEventTime()
    }
    
    func datePickerEventDate(){
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(PostEventViewController.dateChanged(datePicker:)), for:  .valueChanged)
        eventDateField.inputView = datePicker
    }
    
    @objc func dateChanged(datePicker : UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d, yyyy"
        eventDateField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    
    }
    
    
    func datePickerEventTime(){
//        let eventTime = Date()
//        let timeFormat = DateFormatter()
//        timeFormat.locale = Locale(identifier: "en_gb")
//        timeFormat.dateFormat = "HH:mm"
//        timePicker.datePickerMode = .time
//        eventTimeField.inputView = timePicker
//        view.endEditing(true)
        timePicker.datePickerMode = .time
        timePicker.addTarget(self, action: #selector(PostEventViewController.timeChanged(timePicker:)), for:  .valueChanged)
        eventTimeField.inputView = timePicker
        
                
    }
    @objc func timeChanged(timePicker : UIDatePicker){
        let timeFormatter = DateFormatter()
        timeFormatter.locale = Locale(identifier: "en_gb")
        timeFormatter.dateFormat = "HH:mm"
        eventTimeField.text = timeFormatter.string(from: timePicker.date)
        view.endEditing(true)
    
    }
    
 
    @IBAction func onSubmitButton(_ sender: Any) {
        // Create new object "event" that will be stored in table "KidsEvents"
        let event = PFObject(className: "KidsEvents")
        //Create arbitrary key "synopsis", "provider"
        event["synopsis"] = eventDescriptionField.text!
        //Create provider of the event will be current user
        event["provider"] = PFUser.current()!
        //Create title of the event
        event["title"] = eventTitleField.text!
        //Create date of the event
       event["date"] = eventDateField.text!
        //Create time of the event
       event["time"] = eventTimeField.text!
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        event["image"] = file
        //Save the object ("event")to the table
        event.saveInBackground{(success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("Saved event!!!")
            } else {
                print ("Error saving event!!!")
            }
        }
        
    }
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        //Check if camera is available, if not then use photoLibrary
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
            
        }else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    //function to display image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info [.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageAspectScaled(toFill: size)
                        
        imageView.image = scaledImage
        //dismiss camera view
        dismiss(animated: true, completion: nil)
    }
    
    //dismiss keyboard by clicking outside textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //dismiss keyboard by pressing return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       assignEventDate()
        eventDateField.resignFirstResponder()
        return true
        }
        func assignEventDate(){
            guard let text = eventDateField.text, !text.isEmpty else {
                eventDateField.text = "Please enter the event date"
                return
        }
            eventDateField.text = eventDateField as! String
    }
    
}




