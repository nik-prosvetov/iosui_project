//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Serge Kotov on 02.06.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        view.addSubview(profileHeaderView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // setup profile header
        let x = view.safeAreaInsets.left
        let y = view.safeAreaInsets.top
        let width = view.bounds.width - view.safeAreaInsets.left - view.safeAreaInsets.right
        let height = view.bounds.height
        profileHeaderView.setup(frame: CGRect(x: x, y: y, width: width, height: height))
    }
}
