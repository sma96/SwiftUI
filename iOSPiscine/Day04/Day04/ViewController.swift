//
//  ViewController.swift
//  Day04
//
//  Created by 마석우 on 2022/08/21.
//

import UIKit

class ViewController: UIViewController, TokenManagerDelegate {
    
    var tokenManager = TokenManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tokenManager.delegate = self
        tokenManager.getToken { token, delegate in
            self.tokenManager.token = token
            delegate.didUpdateToken(tokenManager: self.tokenManager, token: token)
            print(token)
        }
        print("hello")
        //        getUserName()
    }
    
    func didUpdateToken(tokenManager: TokenManager, token: Token) {
        print("didUpdatetoken")
//        do {
//            try await token.getUserName()
//            self.tokenManager = token
//        } catch {
//
//        }
    }
}
  

