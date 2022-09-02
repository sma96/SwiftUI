//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var loadButton: UIButton!
    
    var coinManager = CoinManager()
    
    var currency = "USD"
    var symbol = "BTC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadButton.layer.cornerRadius = 10
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        coinManager.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loadButtonPressed(_ sender: UIButton) {
        coinManager.getCoinPrice(for: currency, symbol: symbol)
    }
}

//MARK: - UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return coinManager.currencyArray[0].count
        }
        return coinManager.currencyArray[1].count
    }
}

//MARK: - UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return coinManager.currencyArray[0][row]
        }
        return coinManager.currencyArray[1][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            self.symbol = coinManager.currencyArray[0][row]
        } else {
            self.currency = coinManager.currencyArray[1][row]
        }
    }
    
}

//MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate {
    func didUpdateCoinPrice(coinManager: CoinManager, coinData: CoinData) {
        let price = String(format: "%.3f", coinData.rate)
        let symbol = coinData.assetIdBase
        let currency = coinData.assetIdQuote
        
        DispatchQueue.main.async {
            self.bitcoinLabel.text = price
            self.symbolLabel.text = symbol
            self.currencyLabel.text = currency
        }
    }
    
    func didFailWithError(coinManager: CoinManager, error: Error) {
        print("fail with \(error)")
    }
}
