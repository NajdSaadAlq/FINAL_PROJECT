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
import NVActivityIndicatorView

//MARK: START CLASS
class PostsVC: UIViewController {
    
//MARK: OUTLETS
    @IBOutlet weak var loaderView: NVActivityIndicatorView!
    @IBOutlet weak var postTableView: UITableView!
    @IBOutlet weak var hedarView: UIView!{
    didSet{hedarView.layer.shadowRadius = 5
            hedarView.layer.cornerRadius = 20
        }
    }
    
    var posts: [Post] = []
    
//MARK: START viewDidLoad
    override func viewDidLoad(){
        
        postTableView.delegate = self
        postTableView.dataSource = self
        
        // subscribing to the notfication
        NotificationCenter.default.addObserver(self, selector: #selector(userProfileTapped), name: NSNotification.Name(rawValue: "userStackViewTapped"), object: nil)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appId = "61c0648055ad2a19a460d240"
        let URL = "https://dummyapi.io/data/v1/post"
        let headers : HTTPHeaders = [
            "app-id" : appId ]
        
        loaderView.startAnimating()
        //MARK: START requst Data
        // i changed it from responsrJSON To responseData because in Alamofire 6.0 they will delete responsrJSON
        AF.request(URL, headers: headers).responseData { response in
            let jsonData = JSON(response.value)
            let data = jsonData["data"]
            let decoder = JSONDecoder()
            do{self.posts = try decoder.decode([Post].self, from: data.rawData())
                    self.postTableView.reloadData()
            }
            catch let error{
                print(error)
            }
            self.loaderView.stopAnimating()
            }//MARK: END requst Data
        
 }//MARK: END viewDidLoad
    
    //MARK: ACTIONS
    
    @objc func userProfileTapped(notification:Notification){
        if let cell = notification.userInfo?["cell"] as? UITableViewCell{
            if  let indxPath = postTableView.indexPath(for: cell){
                let post = posts[indxPath.row]
                let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
                vc.user = post.owner
                present(vc, animated: true, completion: nil)
        }
            
    }
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        present(vc, animated: true, completion: nil)
    }
    
}//MARK: END CLASS

 //MARK: START extension
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
        cell.postImageView.setImageFromStringUrl(stringUrl: imageStringUrl)
        // filling the user data
        let FillName = "\(post.owner.firstName) \(post.owner.lastName)"
        cell.userNameLabel.text = FillName
        // image user from the URL
        let imageStringUser = post.owner.picture
        cell.userImageView.setImageFromStringUrl(stringUrl: imageStringUser)
        cell.userImageView.makeCircularImage()
        //likes
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
    
}//MARK: END extension 
