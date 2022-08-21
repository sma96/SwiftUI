//
//  ViewController.swift
//  Day03
//
//  Created by 마석우 on 2022/08/19.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var image = ["https://www.nasa.gov/sites/default/files/thumbnails/image/lc09_l1tp_013042_20220118_b432_bahamas1x1.jpeg", "https://www.nasa.gov/sites/default/files/thumbnails/image/52179773875_6ed0bab2c3_o.jpeg", "https://www.nasa.gov/sites/default/files/thumbnails/image/pia25450.jpeg", "https://www.nasa.gov/sites/default/files/thumbnails/image/51942282534_19d5470826_o_0.jpeg"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as? CollectionCustomCell else {
            return UICollectionViewCell()
        }
        
        if let url = URL(string: self.image[indexPath.row]) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                           if let image = UIImage(data: data) {
                               DispatchQueue.main.async {
                                   cell.layer.borderColor = UIColor.clear.cgColor
                                   cell.loading.stopAnimating()
                                   cell.update(image: image)
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Error", message: "Can't load Data", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
        cell.loading.color = .blue
        cell.loading.hidesWhenStopped = true
        cell.loading.startAnimating()
        cell.layer.borderColor = UIColor.blue.cgColor
        cell.layer.borderWidth = 1
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let itemSpacing: CGFloat = 5 // 가로에서 cell과 cell 사이의 거리
//            let textAreaHeight: CGFloat = 65 // textLabel이 차지하는 높이
            let width: CGFloat = (collectionView.bounds.width - itemSpacing)/2 // 셀 하나의 너비
            let height: CGFloat = width * 1 //셀 하나의 높이

            return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionCustomCell else {
            return
        }
        
        guard let vc = self.storyboard?.instantiateViewController(identifier: "DetailVC") as? DetailViewController else {
                return
        }
        vc.image = cell.cellImage.image
        // sub view에 있는 parentView를 현재 view로 설정한다.
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Images"
        // Do any additional setup after loading the view.
    }
    
    
}

