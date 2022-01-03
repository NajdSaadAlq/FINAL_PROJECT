//
//  UserAPI.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 26/12/2021.


import Foundation
import Alamofire
import SwiftyJSON

class UserAPI: API{
    static func getUserData(id: String , completionHander: @escaping (User) -> ()){
        
        let URL = "\(beseURL)/user/\(id)"
        // i changed it from responsrJSON To responseData because in Alamofire 6.0 they will delete responsrJSON
        AF.request(URL, headers: headers).responseData { response in
            let jsonData = JSON(response.value)
            let decoder = JSONDecoder()
            do{
                let user = try decoder.decode(User.self, from: jsonData.rawData())
                completionHander(user)
            }
            catch let error{
                print(error)}
            }
    }//MARK: END getUserData
    
    static func SingUpNewUser( completionHander: @escaping (User) -> ()){
        
        let URL = "\(beseURL)/user/create"
        let parame = [
            "firstName": "Najd",
            "lastName": "alqurish",
            "email": "njbknb@hgmail.com"
        ]
        
        AF.request(URL,method: .post ,parameters: parame,encoder: JSONParameterEncoder.default,headers: headers).validate().responseData { response in
            switch response.result {
                    case .success:
                let jsonData = JSON(response.value)
                print(jsonData)
                let decoder = JSONDecoder()
                do{
                    let user = try decoder.decode(User.self, from: jsonData.rawData())
                    completionHander(user)
                }
                catch let error{
                    print(error)
                    
                }
                case .failure(let error):
                let jsonData = JSON(response.data)
                let data = jsonData["data"]
                let emailError = data["email"].stringValue
                print(emailError)
                    }
            
    }//MARK: END SingUpNewUser
}
}
