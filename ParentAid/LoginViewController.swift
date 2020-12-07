//
//  LoginViewController.swift
//  sample
//
//  Created by Tatiana on 11/6/20.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var usernameLabel: UILabel!
    

    @IBOutlet weak var passwordLabel: UILabel!
    //MARK: Variables
    var actInd = UIActivityIndicatorView()
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    setupTextFieldDelegate()
       setupActivityIndicator()
    }
    
    func setupActivityIndicator(){
        actInd.center = self.view.center
        actInd.hidesWhenStopped = true
        actInd.style = UIActivityIndicatorView.Style.large
        actInd.color = UIColor.blue
              
        view.addSubview(actInd)
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
            self.present(alert, animated: true, completion: nil)
   }
    
    //MARK: IBActions
    @IBAction func onLoginButton(_ sender: Any) {
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

  
    
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
    }
    //MARK: Setup function
    private func setupTextFieldDelegate(){
        usernameField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    @objc func textFieldDidChange(_ textField: UITextField){
        //print("changing text fields")
        updatePlaceholderLabels(textField: textField)
        

    }
    
    //MARK: Animation
    private func updatePlaceholderLabels(textField: UITextField){
        switch textField{
        case usernameField:
            usernameLabel.text = textField.hasText ? "Username" : ""
        case passwordField:
            passwordLabel.text = textField.hasText ? "Password" : ""
        default:
            passwordLabel.text = textField.hasText ? "" : ""
                 
        }
    }
    
    //MARK: Keyboard functions
    
    //dismiss keyboard by clicking outside textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}


