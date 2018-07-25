//
//  PostHeader.swift
//  lab1_tumblr
//
//  Created by Mike Chu on 7/25/18.
//  Copyright © 2018 Paolo Martinez. All rights reserved.
//

import UIKit

class PostHeader: UITableViewHeaderFooterView {
    
    var blogName: String! {
        didSet {
            userName.text = blogName
        }
    }
    
   
    
    let avatarImageView: UIImageView = {
        let iv = UIImageView()
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/avatar")
        iv.af_setImage(withURL: url!)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let userName: UILabel = {
        let lb = UILabel()
        lb.text = "Humans of New York"
        lb.font = UIFont(name:"HelveticaNeue-Bold", size: 14.0)
        return lb
    }()
    
    
    let bgColor: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        view.addSubview(line)
        line.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
        return view
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubview(bgColor)
        addSubview(avatarImageView)
        addSubview(userName)
        
        let avatarScale: CGFloat = (64 * 0.5)
        bgColor.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        avatarImageView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: avatarScale, height: avatarScale)
        avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        userName.anchor(top: topAnchor, left: avatarImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
