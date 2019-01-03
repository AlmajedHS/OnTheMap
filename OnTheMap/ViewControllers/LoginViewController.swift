//
//  LoginViewController.swift
//  OnTheMap
//
//  Created by Hussain Almajed on 12/31/18.
//  Copyright © 2018 UdacityHS. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        postController.postSession(username: emailTextField.text!, password: passwordTextField.text!) { (errString) in
            guard errString == nil else {
                self.showAlert(viewController: self, title: "ERROR", message: errString!, actionTitle: "Dismiss")
                return
            }
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "Login", sender: nil)
            }
        }
    }
    
    
    @IBAction func signUpButton(_ sender: Any) {
        if let url = URL(string: "https://www.udacity.com/account/auth#!/signup"){
          UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
   

    func showAlert(viewController: UIViewController, title: String, message: String?, actionTitle: String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
        
        viewController.present(alert, animated: true, completion: nil)
    }

}
