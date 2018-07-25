//
//  PostFooter.swift
//  lab1_tumblr
//
//  Created by Mike Chu on 7/25/18.
//  Copyright © 2018 Paolo Martinez. All rights reserved.
//

import UIKit

class PostFooter: UITableViewHeaderFooterView {
    
    var caption: String! {
        didSet {
            descriptionLabel.text = caption 
        }
    }
    
    var notesCount: Int! {
        didSet{
            notesLabel.text = "\(notesCount!) notes"
        }
    }
    
    let bgColor: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.init(name: "Helvetica", size: 14)
        lb.numberOfLines = 0
        return lb
    }()
    
    let notesLabel: UILabel = {
        let lb = UILabel()
        lb.font = UIFont.init(name: "Helvetica", size: 14)
        lb.textColor = .lightGray
        return lb
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubview(bgColor)
        addSubview(descriptionLabel)
        addSubview(notesLabel)
        bgColor.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        descriptionLabel.anchor(top: topAnchor, left: leftAnchor, bottom: notesLabel.topAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 16, paddingBottom: 24, paddingRight: 16, width: 0, height: 0)
        notesLabel.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 16, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
