//
//  HeaderTableViewCell.swift
//  ContactListApp
//
//  Created by Liaisan on 2/3/24.
//

import UIKit

final class HeaderTableViewCell: UITableViewCell {

   
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    
    
    
    @IBAction func callButtonPressed() {
        print("Calling \(nameLabel.text ?? "") \(surnameLabel.text ?? "")...")
    }
}

