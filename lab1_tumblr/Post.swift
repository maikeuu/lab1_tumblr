//
//  Post.swift
//  lab1_tumblr
//
//  Created by Mike Chu on 7/24/18.
//  Copyright © 2018 Paolo Martinez. All rights reserved.
//

import Foundation

class Post {
    
    var blogName: String = ""
    var caption: String = ""
    var photos: [String: Any] = [:]
    var originalPhoto: [String: Any]
    var timeStamp: Int?
    var noteCount: Int?
    
    
    init(post: [String : Any]) {
        blogName = post["blog_name"] as! String
        caption = post["caption"] as! String
        let photosArray = post["photos"] as! [[String: Any]]
        photos = photosArray[0]
        originalPhoto = photos["original_size"] as! [String: Any]
        timeStamp = post["timestamp"] as! Int
        noteCount = post["note_count"] as! Int
    }
    
    class func posts(dictionaries: [String: Any]) -> [Post] {
        var posts: [Post] = []
        let postsDictionary = dictionaries["posts"] as! [[String: Any]]
        for item in postsDictionary {
            let post = Post(post: item)
            posts.append(post)
        }
        return posts
    }
}
