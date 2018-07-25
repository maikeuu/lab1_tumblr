//
//  HomeFeedController.swift
//  lab1_tumblr
//
//  Created by Mike Chu on 7/24/18.
//  Copyright © 2018 Paolo Martinez. All rights reserved.
//

import UIKit

class HomeFeedController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tumblrBlue = UIColor.rgb(red: 52, green: 82, blue: 111)
    
    let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        return tv
    }()
    
    var posts: [Post] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        let margins = view.layoutMarginsGuide
        tableView.anchor(top: margins.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        view.backgroundColor = UIColor.rgb(red: 52, green: 82, blue: 111)
        tableView.backgroundColor = UIColor.rgb(red: 52, green: 82, blue: 111)
        
        tableView.register(PostCell.self, forCellReuseIdentifier: "PostCell")
        tableView.register(PostHeader.self, forHeaderFooterViewReuseIdentifier: "Header")
        tableView.register(PostFooter.self, forHeaderFooterViewReuseIdentifier: "Footer")
        
        
        tableView.estimatedSectionHeaderHeight = UITableViewAutomaticDimension
        tableView.estimatedSectionFooterHeight = 100
        fetchPosts()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! PostHeader
        header.blogName = posts[section].blogName
        return header
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Footer") as! PostFooter
        footer.caption = posts[section].caption
        let notes = posts[section].noteCount!
        footer.notesCount = notes
        return footer
    }
   
    
    
    func fetchPosts() {
        TumblrApiManager().getPosts { (posts, error) in
            if let posts = posts {
//                print(posts)
                self.posts = posts
                self.tableView.reloadData()
            } else if let error = error {
                print(error)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(posts.count)
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.post = posts[indexPath.section]
//        cell.backgroundColor = .magenta
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
    
}
