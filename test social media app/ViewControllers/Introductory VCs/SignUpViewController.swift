//
//  SignUpViewController.swift
//  test social media app
//
//  Created by Nickan Sadri on 8/2/21.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class SignUpViewController: UIViewController {


    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        setUpElements()
        
    }
    
    func setUpElements() {
        
        // hide error label
        errorLabel.alpha = 0
        
        // set up text field and button elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(usernameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleButton(signUpButton)
        
    }

    
    // check inputted text fields and validate that everything is correct. If everything is correct, returns nil.  Otherwise, returns errorLabel.
    func validateInformation() -> String? {
        
        // check that all fields are completed
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please input all information."
            
        }
        
        // check that password is valid/secure
        
        let inputPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(inputPassword) == false {
            
            return "Please create a more secure password."
            
        }
        
        // check that email is a valid email format
        
        let inputEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isEmailValid(inputEmail) == false {
            
            return "Please input a valid email address."
            
        }
        
        
        return nil
        
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        // validate inputted information
        let error = validateInformation()
        
        if error != nil {
            
            showErrorLabel(error!)
            
        }
        
        else {
            
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // create user in firebase
            Auth.auth().createUser(withEmail: email, password: password) { result, err in
                
                if err != nil {
                    
                    self.showErrorLabel("Error creating account.")
                    
                }
                
                else {
                    
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid":result!.user.uid]) { error in
                        
                        if error != nil {
                            self.showErrorLabel("Please try again later.")
                        }
                    }
                    
                    // move to homepage view
                    self.transitionToHomepage()
                    
                }
                
            }
            
            // transition to the homepage view
            
        }
        
    }
    
    func showErrorLabel(_ message: String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
        
    }
    
    func transitionToHomepage() {
        
        let homepageViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomepageViewController
        
        view.window?.rootViewController = homepageViewController
        view.window?.makeKeyAndVisible()
        
    }
    
}
