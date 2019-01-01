//
//  TableViewController.swift
//  OnTheMap
//
//  Created by Hussain Almajed on 12/31/18.
//  Copyright © 2018 UdacityHS. All rights reserved.
//

import UIKit

class TableViewController: TabBarViewController,UITableViewDelegate, UITableViewDataSource {

   
    var locationsDataTmp: LocationsData?
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        print("reach 1")
       
        getController.getStudentLocations() {(studentsLocations) in
            DispatchQueue.main.async {
                self.locationsDataTmp = studentsLocations
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("reach 2")
        print((self.locationsDataTmp?.studentLocations.count)!)
        return (self.locationsDataTmp?.studentLocations.count)!
    }
    
    
    func tableView(_ tableView: UITableView,  cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        //obtain a cell of type Table Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell") as! StudentTableViewCell
        let student = locationsDataTmp?.studentLocations[indexPath.row]
        cell.nameLabel.text = (student?.firstName)! + " " + (student?.lastName)!
        
        return cell
    }
    


}

    

