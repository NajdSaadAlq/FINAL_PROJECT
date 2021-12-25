//
//  PostDetailsVC.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 25/12/2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class PostDetailsVC: UIViewController {
    
    var post: Post!
    var comments: [Comment] = []
    
    //MARK: OUTLETS
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var numberOfLikesLabel: UILabel!
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.shadowColor = UIColor.black.cgColor
            backView.layer.shadowOpacity = 0.3
            backView.layer.shadowOffset = CGSize(width: 0, height: 2)
            backView.layer.shadowRadius = 5
            backView.layer.cornerRadius = 15
        }
    }
    
    //MARK: LIFE CYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        commentTableView.delegate = self
        commentTableView.dataSource = self
        
        postTextLabel.text = post.text
        //the logic of filling the image from the URL
        let imageStringUrl = post.image
        if let url = URL(string: imageStringUrl){
            if let imageDate = try? Data(contentsOf: url){
                postImageView.image = UIImage(data: imageDate)
            }}
      
        // filling the user data
        let FillName = "\(post.owner.firstName) \(post.owner.lastName)"
        userNameLabel.text = FillName
        // image user from the URL
        let imageStringUser = post.owner.picture
        //
        userImageView.layer.cornerRadius = userImageView.frame.width/2
        if let url = URL(string: imageStringUser){
            if let imageDate = try? Data(contentsOf: url){
                userImageView.image = UIImage(data: imageDate)
            }}
        
        numberOfLikesLabel.text = String(post.likes)

        // getting the comments of the post the API
//        let URL = "https://dummyapi.io/data/v1/post/60d21b8667d0d8992e610d3f/comment"
        
        let URL = "https://dummyapi.io/data/v1/post/\(post.id)/comment"
        let appId = "61c0648055ad2a19a460d240"
        
        let headers : HTTPHeaders = [
            "app-id" : appId
        ]
        // i changed it from responsrJSON To responseData because in Alamofire 6.0 they will delete responsrJSON
        AF.request(URL, headers: headers).responseData { response in
            let jsonData = JSON(response.value)
            let data = jsonData["data"]
            let decoder = JSONDecoder()
            do{
                self.comments = try decoder.decode([Comment].self, from: data.rawData())
                    self.commentTableView.reloadData()
            }
            catch let error {
                print(error)
            }
        }
    }
    
    //MARK: ACTIONS
   
    @IBAction func closeBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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

extension PostDetailsVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
        
        cell.commentMessgeLabel.text = comments[indexPath.row].message
        cell.userNameLabel.text = comments[indexPath.row].owner.firstName + " " + comments[indexPath.row].owner.lastName
        // image user from the URL
        let imageStringUser = comments[indexPath.row].owner.picture
        //
        cell.userImageView.layer.cornerRadius = cell.userImageView.frame.width/2
        if let url = URL(string: imageStringUser){
            if let imageDate = try? Data(contentsOf: url){
                cell.userImageView.image = UIImage(data: imageDate)
            }}
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    
    
}
