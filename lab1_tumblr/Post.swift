//
//  Post.swift
//  lab1_tumblr
//
//  Created by Mike Chu on 7/24/18.
//  Copyright © 2018 Paolo Martinez. All rights reserved.
//

import Foundation

class Post {
    
    
    init(dictionary: [String : Any]) {
        
    }
    
    class func posts(dictionaries: [String: Any]) -> [Post] {
        var posts: [Post] = []
        let post = dictionaries["posts"]
        print("\(post as AnyObject)")
        
        return posts
    }
}
