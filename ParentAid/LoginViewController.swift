//
//  LoginViewController.swift
//  sample
//
//  Created by Tatiana on 11/6/20.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    
    var actInd = UIActivityIndicatorView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
       setupActivityIndicator()
    }
    
    func setupActivityIndicator(){
        actInd.center = self.view.center
        actInd.hidesWhenStopped = true
        actInd.style = UIActivityIndicatorView.Style.large
        actInd.color = UIColor.blue
              
        view.addSubview(actInd)
    }
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
               let password = passwordField.text!
               
               PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
                   if user != nil {
                       self.performSegue(withIdentifier: "loginSegue", sender: nil)
                   }
                   else {
                       print ("Error: \(error?.localizedDescription)")
                    self.showAlert(title: "Invalid", message: "Invalid username or password. Please try again.")
                   }
               }

    }
    
    @IBAction func onSignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "signupSegue", sender: nil)
        }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
            self.present(alert, animated: true, completion: nil)
   }
    
    //dismiss keyboard by clkicking outside textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

// hamida's comment
