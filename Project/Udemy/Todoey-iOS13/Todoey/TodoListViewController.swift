//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var item = [Item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        print(filePath)
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
        cell.textLabel?.text = item.title
//        saveItem()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
//        context.delete(item[indexPath.row])
//        item.remove(at: indexPath.row)
        item[indexPath.row].setValue(!item[indexPath.row].isChecked, forKey: "isChecked")
//        item[indexPath.row].isChecked = !item[indexPath.row].isChecked
        saveItem()
//        self.defaults.set(self.item, forKey: "itemArray")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert )
        let action = UIAlertAction(title: "Add Item", style: .default) { alert  in
            
            
            let newItem = Item(context: self.context)
            newItem.isChecked = false
            newItem.title = textField.text!
            self.item.append(newItem)
            
            self.saveItem()

        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveItem() {

        do {
            try context.save()
        } catch {
            print("error saving data")
        }
        tableView.reloadData()
    }
    
    func loadItem(with request: NSFetchRequest<Item> = Item.fetchRequest()) {
        do {
            item = try context.fetch(request)
        } catch {
            print("error fetching data from context \(error)")
        }
        tableView.reloadData()
    }
}

extension TodoListViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        loadItem(with : request)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            loadItem()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }

        } else {
            let request: NSFetchRequest<Item> = Item.fetchRequest()
            request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
            request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
            
            loadItem(with : request)
        }
        print(searchText)
    }
    
}
