//
//  DetailViewController.swift
//  CustomCell
//
//  Created by 마석우 on 2022/08/18.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var parentView: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func doneButton(_ sender: UIButton) {
        let descript = descriptionTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let data = dataPicker.date
        
        parentView?.descript.append(descript)
        parentView?.name.append(name)
        parentView?.data.append(data)
        // parentView는 root view를 의미하고 root view의 변수를 바꾸어 준다.
        parentView?.myTablevView.reloadData()
        self.navigationController?.popViewController(animated: true)
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
