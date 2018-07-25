//
//  HomeFeedController.swift
//  lab1_tumblr
//
//  Created by Mike Chu on 7/24/18.
//  Copyright © 2018 Paolo Martinez. All rights reserved.
//

import UIKit

class HomeFeedController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.rgb(red: 52, green: 82, blue: 111)
        fetchPosts()
    }
    
    func fetchPosts() {
        TumblrApiManager().getPosts { (posts, error) in
            if let posts = posts {
                print(posts)
            } else if let error = error {
                print(error)
            }
        }
    }
}
