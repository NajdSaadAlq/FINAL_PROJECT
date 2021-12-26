//
//  PostAPI.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 26/12/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class PostAPI: API{
        
   static func getAllPosts(completionHander: @escaping ([Post]) -> ()){
       
       let URL = "\(beseURL)/post"
       // i changed it from responsrJSON To responseData because in Alamofire 6.0 they will delete responsrJSON
        AF.request(URL, headers: headers).responseData { response in
            let jsonData = JSON(response.value)
            let data = jsonData["data"]
            let decoder = JSONDecoder()
            do{
                let posts = try decoder.decode([Post].self, from: data.rawData())
                completionHander(posts)
            }
            catch let error {
                print(error)}
            }
    }//MARK: END getAllPosts
    
    static func getPostComments(id: String , completionHander: @escaping ([Comment]) -> ()){
        
        let URL = "\(beseURL)/post/\(id)/comment"
        AF.request(URL, headers: headers).responseData { response in
            let jsonData = JSON(response.value)
            let data = jsonData["data"]
            let decoder = JSONDecoder()
            do{
                let comments = try decoder.decode([Comment].self, from: data.rawData())
                completionHander(comments)
            }
            catch let error {
                print(error)}
     }
    }//MARK: END getPostComments
}
