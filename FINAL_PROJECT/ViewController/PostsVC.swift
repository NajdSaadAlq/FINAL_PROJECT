//
//  ViewController.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 20/12/2021.
//

import UIKit
import Alamofire
import SwiftUI
import SwiftyJSON

class PostsVC: UIViewController {
    
    @IBOutlet weak var hedarView: UIView!{
        didSet{
           // hedarView.layer.shadowColor = UIColor.systemGray.cgColor
           // hedarView.layer.shadowOpacity = 0.3
          //  hedarView.layer.shadowOffset = CGSize(width: 0, height: 2)
            hedarView.layer.shadowRadius = 5
            hedarView.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var postTableView: UITableView!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        postTableView.delegate = self
        postTableView.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appId = "61c0648055ad2a19a460d240"
        let URL = "https://dummyapi.io/data/v1/post"
        
        let headers : HTTPHeaders = [
            "app-id" : appId
        ]
        // i changed it from responsrJSON To responseData because in Alamofire 6.0 they will delete responsrJSON
        AF.request(URL, headers: headers).responseData { response in
            let jsonData = JSON(response.value)
            let data = jsonData["data"]
            let decoder = JSONDecoder()
            do{
                self.posts = try decoder.decode([Post].self, from: data.rawData())
                    self.postTableView.reloadData()
            }
            catch let error {
                print(error)
            }
           print(data)
            
        }
        

  }

}

extension PostsVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        as! PostCell
        
        let post = posts[indexPath.row]
        cell.postTextLabel.text = "   " + post.text
        //the logic of filling the image from the URL
        let imageStringUrl = post.image
        if let url = URL(string: imageStringUrl){
            if let imageDate = try? Data(contentsOf: url){
                cell.postImageView.image = UIImage(data: imageDate)
            }}
      
        // filling the user data
        let FillName = "\(post.owner.firstName) \(post.owner.lastName)"
        cell.userNameLabel.text = FillName
        // image user from the URL
        let imageStringUser = post.owner.picture
        //
        cell.userImageView.layer.cornerRadius = cell.userImageView.frame.width/2
        if let url = URL(string: imageStringUser){
            if let imageDate = try? Data(contentsOf: url){
                cell.userImageView.image = UIImage(data: imageDate)
            }}
        
        cell.likesNumberLabel.text = String(post.likes)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectdPost = posts[indexPath.row]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "PostDetailsVC") as! PostDetailsVC
        vc.post = selectdPost
        present(vc, animated: true, completion: nil)
    }
    
    
}
