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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        getController.getStudentLocations() {(studentsLocations) in
            DispatchQueue.main.async {
                self.locationsDataTmp = studentsLocations
                self.tableView.reloadData()
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        if let locationsDataTmpNotNil = locationsDataTmp {
            return locationsDataTmpNotNil.studentLocations.count
        } else {
            return 0
        }
       
    }
    
    
    func tableView(_ tableView: UITableView,  cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        //obtain a cell of type Table Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell") as! StudentTableViewCell
        let student = locationsDataTmp?.studentLocations[indexPath.row]
        cell.nameLabel.text = (student?.firstName)! + " " + (student?.lastName)!
        
        return cell
    }
    


}

    

