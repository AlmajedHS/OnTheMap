//
//  StudentTableViewCell.swift
//  OnTheMap
//
//  Created by Hussain Almajed on 1/1/19.
//  Copyright © 2019 UdacityHS. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
