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
        var user = PFUser(className: "_User")
             user.username = usernameField.text
             user.password = passwordField.text
      
         let email = isValidEmail(testStr: usernameField.text!)

        if email == false{
            showAlert(title: "Invalid", message: "This is not a valid email. Please try again.")
            usernameField.text = ""
        }


        if (user.password!.count < 5)
        {
            let alert = UIAlertController(title: "Invalid password", message: "Password must be greater than 5 characters.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        }
        
             user.signUpInBackground{ (success, error) in
                 if success {
                     self.performSegue(withIdentifier: "loginSegue", sender: nil)
                 } else {
                     print ("Error: \(error?.localizedDescription)")
                 }
     }

    }
    
    func isValidEmail(testStr:String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: testStr)
        }
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
            self.present(alert, animated: true, completion: nil)
        }
}
