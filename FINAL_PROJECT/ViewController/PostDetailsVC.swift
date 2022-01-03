//
//  PostDetailsVC.swift
//  FINAL_PROJECT
//
//  Created by Najd Alquarishi on 25/12/2021.
//

import UIKit
import NVActivityIndicatorView

//MARK: START class
class PostDetailsVC: UIViewController {
    
    var post: Post!
    var comments: [Comment] = []
    
    //MARK: OUTLETS
    @IBOutlet weak var loaderView: NVActivityIndicatorView!
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var numberOfLikesLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    //MARK: START viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        commentTableView.delegate = self
        commentTableView.dataSource = self
        
        postTextLabel.text = post.text
        //the logic of filling the image from the URL
        let imageStringUrl = post.image
        postImageView.setImageFromStringUrl(stringUrl: imageStringUrl)
      
        // filling the user data
        let FillName = "\(post.owner.firstName) \(post.owner.lastName)"
        userNameLabel.text = FillName
        // image user from the URL
        let imageStringUser = post.owner.picture
        userImageView.setImageFromStringUrl(stringUrl: imageStringUser)
        userImageView.makeCircularImage()
        //likes
        numberOfLikesLabel.text = String(post.likes)
        

        loaderView.startAnimating()
        //MARK: START requst Data
        PostAPI.getPostComments(id: post.id) { commentsResponse in
            self.comments = commentsResponse
            self.commentTableView.reloadData()
            self.loaderView.stopAnimating()
        }//MARK: END requst Data
    }//MARK: END viewDidLoad
    
    //MARK: ACTIONS
    @IBAction func closeBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
 }//MARK: END class

  //MARK: START extension
extension PostDetailsVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
        cell.commentMessgeLabel.text = "   \(comments[indexPath.row].message)"
        cell.userNameLabel.text = comments[indexPath.row].owner.firstName + " " + comments[indexPath.row].owner.lastName
        // image user from the URL
        let imageStringUser = comments[indexPath.row].owner.picture
        cell.userImageView.setImageFromStringUrl(stringUrl: imageStringUser)
        cell.userImageView.makeCircularImage()

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
}//MARK: END extension
