//
//  TumblrApiManager.swift
//  lab1_tumblr
//
//  Created by Mike Chu on 7/24/18.
//  Copyright © 2018 Paolo Martinez. All rights reserved.
//

import Foundation

class TumblrApiManager {
    
    
    let baseURLString = "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts"
    let requestType = "/photo?"
    let apiKey = "api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
    let optionalParam = "&filter=text"
    
    var session: URLSession
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func getPosts(completion: @escaping ([Post]?, Error?) -> ()) {
        guard let url = URL(string: baseURLString + requestType + apiKey + optionalParam) else { return }
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error)
            } else if let data = data {
                guard let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
                guard let responseDictionary = dataDictionary["response"] as? [String: Any] else { return }
                let posts = Post.posts(dictionaries: responseDictionary)
                completion(posts, nil)
            }
        }
        task.resume()
    }
    
}
