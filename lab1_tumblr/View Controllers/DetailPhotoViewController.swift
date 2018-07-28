//
//  DetailPhotoViewController.swift
//  lab1_tumblr
//
//  Created by Mike Chu on 7/27/18.
//  Copyright © 2018 Paolo Martinez. All rights reserved.
//

import UIKit

class DetailPhotoViewController: UIViewController {
    
    var post: Post?
    
    
    let image: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.tumblrBlue()
        navigationController?.navigationBar.tintColor = .white
        let backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "back-icon-white"), style: .done, target: self, action: #selector(dismissView))
        navigationItem.leftBarButtonItem = backButton
        view.backgroundColor = .black
        
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 250)
        image.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }
    
    
    
}
