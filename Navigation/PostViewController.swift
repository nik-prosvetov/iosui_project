//
//  PostViewController.swift
//  Navigation
//
//  Created by Serge Kotov on 02.06.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = post?.title ?? "-"
        view.backgroundColor = .systemYellow
        
        // add a button in the navigtion bar
        let barButton = UIBarButtonItem(title: "Info", style: .done, target: self, action: #selector(tapInfoButton))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func tapInfoButton() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true, completion: nil)
    }
}
