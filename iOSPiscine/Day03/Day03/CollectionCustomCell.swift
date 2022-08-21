//
//  CollectionCustomCellCollectionViewCell.swift
//  Day03
//
//  Created by 마석우 on 2022/08/19.
//

import UIKit

class CollectionCustomCell: UICollectionViewCell {
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    @IBOutlet weak var cellImage: UIImageView!
    
    func update(image: UIImage?) {
        cellImage.image = image
    }
}
