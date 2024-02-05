//
//  ContactListViewController.swift
//  ContactListApp
//
//  Created by Liaisan on 2/3/24.
//

import UIKit

class ContactListViewController: UITableViewController {
    
    let persons = Person.getContactList()
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons[section].rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let person = persons[indexPath.section]
        var content = cell.defaultContentConfiguration()
        content.text = person.rows[indexPath.row]
        
        content.image = indexPath.row == 0
        ? UIImage(systemName: Contacts.phone.rawValue)
        : UIImage(systemName: Contacts.email.rawValue)
        
        cell.contentConfiguration = content
        return cell
    }
}

    // MARK: - UITableViewDelegate
    
    extension ContactListViewController {
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
      
        
        override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? HeaderTableViewCell
            let person = persons[section]
            cell?.nameLabel.text = person.name
            cell?.surnameLabel.text = person.surname
            return cell
        }
        
        override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            UIView.animate(withDuration: 0.5) {
                view.transform = CGAffineTransform.identity
            }
        }
        
        override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            60
        }
    }


