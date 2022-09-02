//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var numberOfPeople = 2
    var resultAmount = ""
    
    @IBAction func tipChanged(_ sender: UIButton) {
        setDeselected()
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let RemovePercentage = String(buttonTitle.dropLast())
        let percentage = Double(RemovePercentage)!
        tip = percentage / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let stepperValue = Int(sender.value)
        splitNumberLabel.text = String(stepperValue)
        numberOfPeople = stepperValue
    }
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
        let billText = billTextField.text ?? "0.0"
        let amount = Double(billText)!
        let tipAmount = amount * tip
        let totalAmount = tipAmount + amount
        let splitAmount = totalAmount / Double(numberOfPeople)
        
        resultAmount = String(format: "%.2f", splitAmount)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    func setDeselected() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let secondVC = segue.destination as! ResultViewController
            secondVC.numberOfPeople = numberOfPeople
            secondVC.tip = Int(tip * 100)
            secondVC.resultAmount = resultAmount
        }
    }
}

