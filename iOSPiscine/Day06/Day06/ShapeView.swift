//
//  ShapeView.swift
//  Day06
//
//  Created by 마석우 on 2022/08/24.
//

import UIKit

class ShapeView: UIView {
    
    
    var path: UIBezierPath!
    var shape: String = Int.random(in: 0...1) == 0 ? "Circle" : "Rectangle"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = shape == "Circle" ? self.frame.width / 2 : 0
        self.backgroundColor =   UIColor(red: CGFloat((arc4random_uniform(100)) / 100), green: CGFloat(arc4random_uniform(100)) / 100, blue: CGFloat(arc4random_uniform(100)) / 100, alpha: CGFloat(arc4random_uniform(100)) / 200 + 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //
    //    override func draw(_ rect: CGRect) {
    //
    //        UIColor(red: CGFloat((arc4random_uniform(100)) / 100), green: CGFloat(arc4random_uniform(100)) / 100, blue: CGFloat(arc4random_uniform(100)) / 100, alpha: CGFloat(arc4random_uniform(100)) / 200 + 0.5)
    //
    //    }
    
    
    
}
