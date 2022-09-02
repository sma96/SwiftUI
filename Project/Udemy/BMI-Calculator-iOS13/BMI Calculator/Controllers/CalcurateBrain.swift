//
//  CalcurateBrain.swift
//  BMI Calculator
//
//  Created by 마석우 on 2022/08/14.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalcuratorBrain {
    
    var bmiValue: BMI?
    
    mutating func calcurateBMI(height: Float, weight: Float) {
        let bmi = weight / pow(height, 2)
        if bmi < 18.5 {
            bmiValue = BMI(value: bmi, advice: "Underweight", color: .blue)
        } else if bmi < 24.9 {
            bmiValue = BMI(value: bmi, advice: "Normal", color: .green)
        } else {
            bmiValue = BMI(value: bmi, advice: "Overweight", color: .red)
        }
    }
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmiValue?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getColor() -> UIColor {
        return bmiValue?.color ?? .clear
    }
    
    func getAdvice() -> String {
        return bmiValue?.advice ?? "nothing"
    }
}
