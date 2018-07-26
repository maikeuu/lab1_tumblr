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
    
    let favoriteButton: UIButton = {
        let bt = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        bt.setImage(#imageLiteral(resourceName: "favor-icon"), for: .normal)
        bt.setImage(#imageLiteral(resourceName: "favor-icon-red"), for: .selected)
        bt.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return bt
    }()
    
    let reblogButton: UIButton = {
        let bt = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        bt.setImage(#imageLiteral(resourceName: "retweet-icon"), for: .normal)
        bt.setImage(#imageLiteral(resourceName: "retweet-icon-green"), for: .selected)
        bt.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        return bt
    }()
    
    let commentButton: UIButton = {
        let bt = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        bt.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        return bt
    }()
    
    let shareButton: UIButton = {
        let bt = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        bt.setImage(#imageLiteral(resourceName: "reply-icon"), for: .normal)
        return bt
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        return sv
    }()
    
    @objc func buttonTapped(_ sender: UIButton) {
        if sender.isSelected == true {
            sender.isSelected = false
        } else {
            sender.isSelected = true
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
        addViews()
        addAnchors()
    }
    
    func addViews() {
        addSubview(bgColor)
        addSubview(descriptionLabel)
        addSubview(notesLabel)
        addSubview(stackView)
        [shareButton, commentButton, reblogButton, favoriteButton].forEach({stackView.addArrangedSubview($0)})
    }
    
    func addAnchors() {
        bgColor.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        descriptionLabel.anchor(top: topAnchor, left: leftAnchor, bottom: notesLabel.topAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 24, paddingRight: 16, width: 0, height: 0)
        notesLabel.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 16, paddingRight: 0, width: 0, height: 0)
        stackView.anchor(top: nil, left: notesLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 100, paddingBottom: 8, paddingRight: 4, width: 0, height: 0)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
