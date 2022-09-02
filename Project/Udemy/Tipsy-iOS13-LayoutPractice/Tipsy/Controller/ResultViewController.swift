//
//  ResultViewController.swift
//  Tipsy
//
//  Created by 마석우 on 2022/08/14.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var numberOfPeople: Int = 2
    var tip: Int = 10
    var resultAmount: String = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = resultAmount
        settingLabel.text = "Split between \(numberOfPeople) people, with \(tip)% tip"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
