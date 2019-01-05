//
//  AddLocationViewController.swift
//  OnTheMap
//
//  Created by Hussain Almajed on 12/31/18.
//  Copyright © 2018 UdacityHS. All rights reserved.
//

import UIKit
import CoreLocation

class AddLocationViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var mediaLinkTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(self.cancel(_:)))
        // Do any additional setup after loading the view.
    }
    @objc private func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func findLocationButton(_ sender: Any) {
        guard let location = locationTextField.text,
            let link = mediaLinkTextField.text,
            location != "", link != "" else {
                self.showAlert(viewController:self,title: "Missing information", message: "Please fill both fields and try again",actionTitle: "ERROR")
                return
        }
        
        let studentLocation = StudentLocation(mapString: location, mediaURL: link)
        geocodeCoordinates(studentLocation)
    
    }
    func showAlert(viewController: UIViewController, title: String, message: String?, actionTitle: String) -> Void {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    private func geocodeCoordinates(_ studentLocation: StudentLocation) {
        
        activityIndicator.startAnimating()
        CLGeocoder().geocodeAddressString(studentLocation.mapString!) { (placeMarks, err) in
            self.performUIUpdatesOnMain {
                self.activityIndicator.stopAnimating()
            }
            guard let firstLocation = placeMarks?.first?.location else {
                
                 self.showAlert(viewController:self,title: "Error", message: "There is no first location",actionTitle: "ERROR")
                return
                
                
            }
           
            var location = studentLocation
            location.latitude = firstLocation.coordinate.latitude
            location.longitude = firstLocation.coordinate.longitude
           
            self.performSegue(withIdentifier: "mapSegue", sender: location)
        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mapSegue", let vc = segue.destination as? FinishLocationViewController {
            vc.location = (sender as! StudentLocation)
        }
    }

    func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
        DispatchQueue.main.async {
            updates()
        }
    }
}
