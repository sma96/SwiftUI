//
//  TokenManager.swift
//  Day04
//
//  Created by 마석우 on 2022/08/23.
//

import Foundation

protocol TokenManagerDelegate {
    func didUpdateToken(tokenManager: TokenManager, token: Token)
}
struct TokenManager {
    var info: [Project] = []
    var token: Token?
    let projectId = 1314
    var pageIndex = 1
    
    var delegate: TokenManagerDelegate?
    
    mutating func getToken(completion: @escaping (Token, TokenManagerDelegate) -> Void) {
          print("success")
          var components = URLComponents(string: "https://api.intra.42.fr/oauth/token")!
          let id = "9e07c6542c4a6f95b8aab0c27e4db4e4f1ad2364e764b5d47afe89a8f743ac90"
          let secret = "0913c13839f1f2afcbba7f94e1d14c121dbbc4aa73fe74c09fa1765d56082c2b"
          let parameter = [
              "grant_type": "client_credentials",
              "client_id": id,
              "client_secret": secret
          ]
          components.queryItems = parameter.map { (name, value) in
              URLQueryItem(name: name, value: value)
          }
          var request = URLRequest(url: components.url!)
          let del = delegate!
        
          request.httpMethod = "POST"
          request.allHTTPHeaderFields = ["Content-Type": "application/json"]
          let task = URLSession.shared.dataTask(with: request) { data, response, error in
              if error != nil {
                  print("error")
                  return
              }
              
              if let res = response as? HTTPURLResponse, res.statusCode == 200 {
                  print(res.statusCode)
              } else {
                  return
              }
              
              guard let safeData = data else{
                  return
              }
              
              let decode = JSONDecoder()
              decode.keyDecodingStrategy = .convertFromSnakeCase
              
              if let token = try? decode.decode(Token.self, from: safeData) {
                  completion(token, del)
//                  self.didUpdateToken(tokenManager: token)
              }
          }
          task.resume()
        print("getToken")
      }
}

URLSession.shared.da
//
//    mutating func getUserName() async throws {
//          guard let safeToken = self.token else {
//              print("error")
//              return
//          }
//          print("helo")
//          var components = URLComponents(string: "https://api.intra.42.fr/v2/projects/\(projectId)/projects_users")!
//
//          repeat {
//              components.queryItems = [URLQueryItem(name: "filter[campus]", value: "29"), URLQueryItem(name: "page[number]", value: "\(pageIndex)")]
//
//              var request = URLRequest(url: components.url!)
//              request.httpMethod = "GET"
//              request.allHTTPHeaderFields = ["Authorization": "\(safeToken.tokenType) \(safeToken.accessToken)"]
//
//              let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                  if error != nil {
//                      print("error")
//                      return
//                  }
//
//                  if let res = response as? HTTPURLResponse {
//                      print(res.statusCode)
//                      print("response = \(String(describing: res))")
//                  } else {
//                      print("res.statusCode")
//                      return
//                  }
//
//                  guard let safeData = data else {
//                      print("data error")
//                      return
//                  }
//
//                  let decoder = JSONDecoder()
//                  decoder.keyDecodingStrategy = .convertFromSnakeCase
//
//                  guard let user = try? decoder.decode([Project].self, from: safeData) else {
//                      print("decode error")
//                      return
//                  }
//                  self.info = user
//                  print(user)
//
//              }
//              task.resume()
//              sleep(3)
//              pageIndex += 1
//              print("info = \(info.count)")
//          } while (pageIndex < 3)
//      }
//}
