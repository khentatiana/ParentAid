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
    
   
    //MARK: IBOutlets
    @IBOutlet weak var eventTimeField: UITextField!
    @IBOutlet weak var eventDateField: UITextField!
    @IBOutlet weak var eventDescriptionField: UITextField!
    @IBOutlet weak var eventTitleField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var eventAddressField: UITextField!
    @IBOutlet weak var eventCityField: UITextField!
    @IBOutlet weak var eventStateField: UITextField!
    @IBOutlet weak var eventZipCodeField: UITextField!
    @IBOutlet weak var eventAvailableSpots: UITextField!
    @IBOutlet weak var eventCOVIDField: UITextField!
    
    

    //MARK: Variables
    var events = [PFObject]()
    var datePicker = UIDatePicker()
    var timePicker = UIDatePicker()
    
    //MARK: View Lifecycle
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
        timePicker.datePickerMode = .time
        timePicker.addTarget(self, action: #selector(PostEventViewController.timeChanged(timePicker:)), for:  .valueChanged)
        eventTimeField.inputView = timePicker
        
                
    }
    @objc func timeChanged(timePicker : UIDatePicker){
        let timeFormatter = DateFormatter()
        //timeFormatter.locale = Locale(identifier: "en_gb")
        timeFormatter.dateFormat = "h:mm a"
        eventTimeField.text = timeFormatter.string(from: timePicker.date)
        view.endEditing(true)
    
    }
    
    //MARK: IBActions
    @IBAction func onSubmitButton(_ sender: Any) {
        // Create new object "event" that will be stored in table "KidsEvents"
        let event = PFObject(className: "KidsEvents")
        //Create properties (arbitrary key) of the object "event" such as "synopsis", "provider", "title" etc.
        event["synopsis"] = eventDescriptionField.text!
        //Create provider of the event will be current user
        event["provider"] = PFUser.current()!
        //Create title of the event
        event["title"] = eventTitleField.text!
        //Create date of the event
       event["date"] = eventDateField.text!
        //Create time of the event
       event["time"] = eventTimeField.text!
        //Create address of the event
       event["address"] = eventAddressField.text!
        //Create city of the event
       event["city"] = eventCityField.text!
        //Create state of the event
       event["state"] = eventStateField.text!
        //Create zipCode of the event
       event["zipCode"] = eventZipCodeField.text!
        //Create availableSpots of the event
       event["availableSpots"] = eventAvailableSpots.text!
        //Create covidSafe of the event
       event["covidSafe"] = eventCOVIDField.text!
    
        
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
    
    
    @IBAction func onCancelButton(_ sender: Any) {
        
//
//        var deleteAttributesOnly = true
//
//        var query = PFQuery(className:"KidsEvents")
//
//        query.getObjectInBackgroundWithId("<PARSE_OBJECT_ID>") {
//          (parseObject: PFObject?, error: NSError?) -> Void in
//          if error != nil {
//            print(error)
//          } else if parseObject != nil {
//            if deleteAttributesOnly {
//              parseObject.removeObjectForKey("synopsis")
//              parseObject.removeObjectForKey("image")
//              parseObject.removeObjectForKey("provider")
//              parseObject.removeObjectForKey("title")
//              parseObject.removeObjectForKey("date")
//              parseObject.removeObjectForKey("time")
//              parseObject.saveInBackground()
//            } else {
//              parseObject.deleteInBackground()
//            }
//          }
//        }
var query = PFQuery(className:"KidsEvents")
//        query.whereKeyDoesNotExist("title"){
//
//        event.deleteInBackground()
//            print ("##################Event deleted")
//
//        }
//
        let event = PFObject(className: "KidsEvents")
        cleanTextFields()
        // cleanImageView()
        //dismiss view
        dismiss(animated: true, completion: nil)
        
        query.selectKeys(["title"])
        
        event.deleteInBackground()
            print ("##################Event deleted")
         
               
        dismissKeyboard()
        self.dismiss(animated: true, completion: nil)
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
        eventTitleField.text = ""
        eventTimeField.text = ""
        eventDateField.text = ""
        eventDescriptionField.text = ""
//        eventTimeField.text = ""
//        eventTimeField.text = ""
//        eventTimeField.text = ""
    }
    
    //clean picture
//    func cleanImageView(){
//        var query = PFQuery(className:"KidsEvents")
//        let event = PFObject(className: "KidsEvents")
//        query.findObjectsInBackground{(events, error) -> Void in
//            if event["title"] as? String == ""  && event["synopsis"] as? String == "" && error == nil {
//                event.deleteInBackground()
//                print(error)
//            } else if error != nil {
//                print(error)
//
//               }
//        }}
//        var query = PFQuery(className:"KidsEvents")
//        let event = PFObject(className: "KidsEvents")
//        var deleteAttributesOnly = true
//
//        query.includeKeys(["provider.username", "synopsis" , "title", "date"])
//        query.getObjectInBackgroundWithId("provider") {
//          (event: PFObject?, error: NSError?) -> Void in
//          if error != nil {
//            print(error)
//          } else if event != nil {
//            if deleteAttributesOnly {
//                event.removeObjectForKey("synopsis")
//                event.removeObjectForKey("image")
//                event.removeObjectForKey("provider")
//                event.removeObjectForKey("title")
//                event.removeObjectForKey("date")
//                event.removeObjectForKey("time")
//                event.saveInBackground()
//            } else {
//                event.deleteInBackground()
//            }
//          }

//        //MARK: Fetch ObjectId Strings From Parse
//            func fetchObjectIdString() {
//
//                let query = PFQuery(className: "KidsEvents")
//                query.whereKey("title", equalTo: self.title)
//                query.findObjectsInBackground { (events, error) -> Void in
//
//                    if error == nil {
//
//                        if let events = events as? [PFObject] {
//                            for oneObj in events {
//                                let ObjectIdFromParse = oneObj.objectId!
//                                let SingleObjectId = SixthBook()
//                                SingleObjectId.objectIdString = ObjectIdFromParse
//                                self.arrayOfObjectId.append(SingleObjectId)
//                            }
//                        }
//                    } else {
//
//                        // Log details of the failure
//                        print("Error: \(error!) \(error!.userInfo)")
//                    }
//                }
//            }
//
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





