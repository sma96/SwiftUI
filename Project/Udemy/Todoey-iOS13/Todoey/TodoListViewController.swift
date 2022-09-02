//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var item = [CellData]()
    
    var filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItem()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        item.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = item[indexPath.row]
        cell.accessoryType = item.isChecked ? .checkmark : .none
        cell.textLabel?.text = item.name
        saveItem()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
        item[indexPath.row].isChecked = !item[indexPath.row].isChecked
        tableView.reloadData()
//        self.defaults.set(self.item, forKey: "itemArray")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert )
        let action = UIAlertAction(title: "Add Item", style: .default) { alert  in
            self.item.append(CellData(name: textField.text!))
            
            self.saveItem()
            
            self.tableView.reloadData()
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveItem() {
        let encode = PropertyListEncoder()
        do {
            if let data = try? encode.encode(self.item) {
                try data.write(to: self.filePath!)
            }
        } catch {
            print("Error encoding item array")
        }
    }
    
    func loadItem() {
        if let data = try? Data(contentsOf: filePath! ) {
            let decoder = PropertyListDecoder()
            if let decoded = try? decoder.decode([CellData].self, from: data) {
                item = decoded
            }
        }
    }
}

