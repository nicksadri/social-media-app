//
//  Utilities.swift
//  test social media app
//
//  Created by Nickan Sadri on 8/2/21.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 10, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 11/255, green: 150/255, blue: 227/255, alpha: 1).cgColor
        
        textfield.borderStyle = .none
        
        textfield.layer.addSublayer(bottomLine)
    }
    
    static func styleButton(_ button:UIButton) {
        button.backgroundColor = UIColor.init(red: 11/255, green: 150/255, blue: 227/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func isEmailValid(_ email: String) -> Bool {

        let emailTest = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        
        return emailTest.evaluate(with: email)
        
    }
    
    static func isPasswordValid(_ password: String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,32}")
        
        return passwordTest.evaluate(with: password)
        
    }
    
    static func isUsernameValid(_ username: String) -> Bool {
        
        let usernameTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$")
        
        return usernameTest.evaluate(with: username)
        
    }
    
}
