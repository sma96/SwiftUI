//
//  ViewController.swift
//  Day05
//
//  Created by 마석우 on 2022/08/23.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var places = MapModel.place
    var index = 0
    @IBOutlet weak var ho: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        places.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = places[indexPath.row].subtitle!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToMap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("heeleleoeoe")
        if segue.identifier == "goToMap" {
            if let indexPath = ho.indexPathForSelectedRow {
                let destinationVC = segue.destination as! MapViewController
                print("heool")
                destinationVC.pin =  MapModel.place[indexPath.row]
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ho.delegate = self
        ho.dataSource = self
        // Do any additional setup after loading the view.
    }
}

