//
//  LoginViewController.swift
//  test social media app
//
//  Created by Nickan Sadri on 8/2/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
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
        
        // hide the error label
        errorLabel.alpha = 0
        
        // set up text fields and buttons
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleButton(logInButton)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func logInTapped(_ sender: Any) {
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // sign the user in
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if error != nil {
                
                self.errorLabel.text = "Error signing in."
                self.errorLabel.alpha = 1
                
            }
            else {
                
                self.transitionToHomepage()
                
            }
            
        }
        
    }
    
    func transitionToHomepage() {
        
        let homepageViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomepageViewController
        
        view.window?.rootViewController = homepageViewController
        view.window?.makeKeyAndVisible()
        
    }
    
}
