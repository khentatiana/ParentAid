//
//  LoginViewController.swift
//  sample
//
//  Created by Tatiana on 11/6/20.
//

import UIKit
import Parse
import ProgressHUD


class LoginViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var dontOrHaveAcctLabel: UILabel!
    @IBOutlet weak var signupButtonOutlet: UIButton!
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var resendEmailOutlet: UIButton!
    
//    //MARK: Views
//    @IBOutlet weak var emailLineView: UIView!
//    @IBOutlet weak var confirmPasswordLineView: UIView!
    
    //MARK: Variables
    var isLogin = true
    var actInd = UIActivityIndicatorView()

    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
        updateUIForLogin(login: true)
        setupTextFieldDelegate()
        
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
        
        if isDataInputedFor(type: isLogin ? "login" : "registration"){
            //login or register
            
        }else {
            //ProgressHUD.showFailed("All fields are required")
            
        }
    
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
//    @IBAction func onSignIn(_ sender: Any) {
//        let username = usernameField.text!
//        let password = passwordField.text!
//               
//               PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
//                   if user != nil {
//                       self.performSegue(withIdentifier: "loginSegue", sender: nil)
//                   }
//                   else {
//                       print ("Error: \(error?.localizedDescription)")
//                    self.showAlert(title: "Invalid", message: "Invalid username or password. Please try again.")
//                   }
//               }
//
//    }
    
    @IBAction func onSignUp(_ sender: UIButton) {
        
        updateUIForLogin(login: sender.titleLabel?.text == "Login")
        //toggle() function is switching Boolean variable from "true" to "false". it was set to true in the beggining : var isLogin = true.
        //after will changed to false
        isLogin.toggle()
        
        //self.performSegue(withIdentifier: "signupSegue", sender: nil)
        var user = PFUser(className: "_User")
        user.username = usernameField.text
        user.email = emailField.text
        user.password = passwordField.text
        
        if isDataInputedFor(type:"registration"){
            //register
            let email = isValidEmail(testStr: emailField.text!)
                                   
            if (user.username!.count < 5) || (user.password!.count < 5)
            {
                let alert = UIAlertController(title: "Invalid username or password", message: "Username and password must be greater than 5 characters.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true)
            } else if email == false{
                showAlert(title: "Invalid", message: "This is not a valid email. Please try again.")
                emailField.text = ""
            }
            
//        }else {
//            //ProgressHUD.showFailed("All fields are required")
//            self.showEmailAlert(title: "Welcome to ParentsAid", message: "Create an account here")
     }
        
        user.signUpInBackground{ (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print ("Error: \(error?.localizedDescription)")
                self.showEmailAlert(title: "Invalid", message: "##############Invalid username or email or password. Please try again.")
            }
        }
        
        }

    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    func showEmailAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func resendEmailButton(_ sender: Any) {
        if isDataInputedFor(type: "password"){
            //reset password
            print("have info for resend email")
        }else {
            ProgressHUD.showFailed("Email is required")
            
        }
    }
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        var user = PFUser(className: "_User")
        let username = usernameField.text!
        let email = emailField.text!
        let query = PFUser.query()
        query?.whereKey("username", equalTo:username)
        query?.whereKey("email", equalTo:email)
      
        
//        query?.findObjects{ (user, error) in
//            if (events != nil){
//                self.events = events!
//               // self.eventsArray = events!
//                //self.filteredEvents = events!
//
//                self.tableViewProvider.reloadData()
//            }
//        }
        if isDataInputedFor(type: "password"){
            //resend verification email
            PFUser.requestPasswordResetForEmail(inBackground: email)
            print("have info for forgotten password")
        }else {
            ProgressHUD.showFailed("Email is required")
            
        }
    }
    //MARK: Setup function
    private func setupTextFieldDelegate(){
        usernameField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        confirmPasswordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    @objc func textFieldDidChange(_ textField: UITextField){
        //print("changing text fields")
        updatePlaceholderLabels(textField: textField)
    }
    //When tap outside text fileds keyboard disapears
    private func setupBackgroundTap(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTap))
        view.addGestureRecognizer(tapGesture)
        
    }
    @objc func backgroundTap(){
        //print("##########background tap")
        view.endEditing(false)
    }
    //MARK: Animations
    private func updatePlaceholderLabels(textField: UITextField){
        switch textField{
        case usernameField:
            usernameLabel.text = textField.hasText ? "Username" : ""
        case emailField:
            emailLabel.text = textField.hasText ? "Email" : ""
        case passwordField:
            passwordLabel.text = textField.hasText ? "Password" : ""
        default:
            confirmPasswordLabel.text = textField.hasText ? "Confirm Password" : ""
                 
        }
    }
    //login button change to SignUp
    
    private func updateUIForLogin(login:Bool){
        loginButtonOutlet.setImage(UIImage(named: login ? "login-button" : "register-button"), for: .normal)
        signupButtonOutlet.setTitle(login ? "Sign Up" : "Login", for: .normal)
        dontOrHaveAcctLabel.text = login ? "Don't have an account?" : "Have an account?"
        //When login view email and confirmPassword are hidden
        UIView.animate(withDuration: 0.5){
            self.emailField.isHidden = login
            self.emailLabel.isHidden = login
            self.confirmPasswordField.isHidden = login
            self.confirmPasswordLabel.isHidden = login
          //  self.forgotPasswordButton(<#T##sender: Any##Any#>)
        }
    }
    

    //MARK: Keyboard functions
    
    //dismiss keyboard by clicking outside textbox
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    //MARK: helpers
    //for required fields
    private func isDataInputedFor(type: String) -> Bool{
        switch type {
        case "login":
            return usernameField.text != "" && passwordField.text != ""
        case "registration":
            return emailField.text != "" && passwordField.text != "" && emailField.text != "" && confirmPasswordField.text != ""
        default:
            return usernameField.text != "" && passwordField.text != ""
        }
    }
    
}


