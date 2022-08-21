//
//  ViewController.swift
//  CustomCell
//
//  Created by 마석우 on 2022/08/18.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var name: [String] = []
    var data: [Date] = []
    var descript: [String] = []
    
    @IBOutlet weak var myTablevView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTablevView.delegate = self
        myTablevView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        print("heelo")
        guard let vc = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {
                print("error")
                    return
        }
        //instantiateViewController(withIdentifier:)는 스토리보드에서 특정 identifier를 받아 뷰 컨트롤러를 생성하고 데이터를 초기화하는 메소드입니다. identifier는 string 타입으로, 스토리보드에서 고유하게 뷰 컨트롤러를 구별할 수 있는 문자열입니다. 인터페이스 빌더에서 Storyboard ID 어트리뷰트와 같은 값을 넣으면 됩니다. 이 identifier는 뷰 컨트롤러 객체 자체 프로퍼티는 아닙니다. 스토리보드는 뷰 컨트롤러에 데이터를 놓을 위치를 찾는 데에 이 identifier를 사용합니다. 만약 스토리보드에 해당 identifier가 없다면 exception이 일어납니다. 반환값은 뷰 컨트롤러이며, 찾지 못하면 exception이 발생합니다.
        print("vc created")
        vc.parentView = self
        // sub view에 있는 parentView를 현재 view로 설정한다.
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! CustomCell // 재사용 가능한 cell을 리턴해준다. 리턴되는 cell은 UITableViewCell 타입이기 때문에 CustomCell로 다운 캐스팅 해줘야 한다.
        
        let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd"
        
        cell.secondLabel.text = dateFormatter.string(from: data[indexPath.row])
        cell.thirdLabel.text = name[indexPath.row]
        cell.firstLabel.text = descript[indexPath.row]
        cell.backgroundColor = .gray
        
        return cell
    }
    @IBAction func printButtonPressed(_ sender: UIButton) {
        
        print(name)
        print(data)
        print(descript)
    }
}

