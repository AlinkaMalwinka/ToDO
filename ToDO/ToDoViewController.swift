//
//  ViewController.swift
//  ToDO
//
//  Created by Alina Petrenko on 4/8/19.
//  Copyright © 2019 Alina Petrenko. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Apple", "Play Game"]

    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }

    // MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    // MARK - TableView Delegete Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if   tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
              tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
              tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
// MARK - Add new Items
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        
        // 3.  provide local var to extend alertTextField from the clousure
       
        var textField = UITextField()
        
        // 1. make an alert
        
        let alert = UIAlertController(title: "Add New ToDo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
        
        // 4. what will happen once the user cliks (rember we inside clousure, write word self before)
            
        self.itemArray.append(textField.text!)
            
        // 5. reload Data on Table View
            
            self.tableView.reloadData()
            
        
        }
        
        // 2. to addtext field  in alert
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present (alert, animated: true, completion: nil)
        
    }

}
