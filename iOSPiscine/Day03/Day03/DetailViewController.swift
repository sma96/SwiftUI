//
//  DetailViewController.swift
//  Day03
//
//  Created by 마석우 on 2022/08/19.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var DetailImage: UIImageView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailImage.image = image
        scrollView.delegate = self //2
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        self.DetailImage
    }
}
