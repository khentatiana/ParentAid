//
//  SignUpViewController.swift
//  ParentAid
//
//  Created by Tatiana on 11/18/20.


import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var passwordSignupField: UITextField!
    @IBOutlet weak var emailSignupField: UITextField!
    @IBOutlet weak var usernameSignupField: UITextField!
    @IBOutlet weak var confirmPasswordSignupField: UITextField!
    
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
    
    
    @IBAction func onSignUpAction(_ sender: Any) {
        var user = PFUser(className: "_User")
        user.username = usernameSignupField.text
        user.email = emailSignupField.text
        user.password = passwordSignupField.text
        
        let email = isValidEmail(testStr: emailSignupField.text!)
        
        if email == false{
            showAlert(title: "Invalid", message: "This is not a valid email. Please try again.")
            emailSignupField.text = ""
        }
        
        
        else if (user.username!.count < 5) || (user.password!.count < 5)
        {
            let alert = UIAlertController(title: "Invalid username or password", message: "Username and password must be greater than 5 characters.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        }
        
        else if passwordSignupField.text! != confirmPasswordSignupField.text!{
            showAlert(title: "Invalid", message: "The passwords don't match. Please try again.")
            confirmPasswordSignupField.text = ""
        }
        
        else {
            user.signUpInBackground{ (success, error) in
                if success {
                    //This is performing segue
                    //self.performSegue(withIdentifier: "loginFromSignup", sender: nil)
                    
                    //This is navigate to storyboard ID "ParentProviderNavigationController"
                    let loginFromSignUpView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ParentProviderNavigationController")
                    DispatchQueue.main.async{
                        //this is show Present modaly segue as full screen
                        loginFromSignUpView.modalPresentationStyle = .fullScreen
                        self.present(loginFromSignUpView, animated: true, completion: nil)
                          }
                } else {
                    print ("Error: \(error?.localizedDescription)")
                    self.showAlert(title: "Invalid", message: "Invalid username or email or password. Please try again.")
                }
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
    //dismiss keyboard by clicking outside textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}



