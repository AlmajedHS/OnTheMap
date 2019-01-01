//
//  globalFunctions.swift
//  OnTheMap
//
//  Created by Hussain Almajed on 12/31/18.
//  Copyright © 2018 UdacityHS. All rights reserved.
//

import Foundation
import UIKit

class globalFunctions{

func showAlert(viewController: UIViewController, title: String, message: String?, actionTitle: String) -> Void {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
    
    viewController.present(alert, animated: true, completion: nil)
}

}

