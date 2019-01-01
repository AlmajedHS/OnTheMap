//
//  TabBarViewController.swift
//  OnTheMap
//
//  Created by Hussain Almajed on 12/31/18.
//  Copyright © 2018 UdacityHS. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    var locationsData: LocationsData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addLocationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addLocation(_:)))
        
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(self.logout(_:)))
        
         let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(self.refreshLocations(_:)))
        navigationItem.rightBarButtonItems = [addLocationButton, refreshButton]
        navigationItem.leftBarButtonItem = logoutButton
        // Do any additional setup after loading the view.
    }
   
    @objc private func logout(_ sender: Any) {
        //need implementation
        
    }
    
    @objc private func refreshLocations(_ sender: Any) {
        loadLocations()
    }
    
    @objc private func addLocation(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddLocationViewController") as! UINavigationController
        
        present(vc, animated: true, completion: nil)
    }
    
   
    
    public func loadLocations() {
        getController.getStudentLocations { (data) in
            guard let data = data else {
                self.showAlert(viewController:self,title: "Error", message: "No internet connection found",actionTitle: "ERROR")
                return
            }
            guard data.studentLocations.count > 0 else {
                self.showAlert(viewController:self,title: "Error", message: "No pins found",actionTitle: "ERROR")
                return
            }
            self.locationsData = data
        }
    }
    func showAlert(viewController: UIViewController, title: String, message: String?, actionTitle: String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
