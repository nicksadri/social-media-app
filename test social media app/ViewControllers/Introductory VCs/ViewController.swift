//
//  ViewController.swift
//  test social media app
//
//  Created by Nickan Sadri on 8/2/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpElements()
        
    }

    func setUpElements() {
        
        Utilities.styleButton(logInButton)
        Utilities.styleButton(signUpButton)
        
    }
    
}

