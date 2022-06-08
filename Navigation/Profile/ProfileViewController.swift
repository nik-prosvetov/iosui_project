//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Serge Kotov on 02.06.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    static let headerIdent = "header"
    static let postIdent = "post"
    
    static var postTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: headerIdent)
        table.register(PostTableViewCell.self, forCellReuseIdentifier: postIdent)
        return table
    }()
    
    // MARK: - Setup section
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        
        view.addSubview(Self.postTableView)
        setupConstraints()
        Self.postTableView.dataSource = self
        Self.postTableView.delegate = self
        Self.postTableView.refreshControl = UIRefreshControl()
        Self.postTableView.refreshControl?.addTarget(self, action: #selector(reloadTableView), for: .valueChanged)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            Self.postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            Self.postTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            Self.postTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            Self.postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc func reloadTableView() {
        Self.postTableView.reloadData()
        Self.postTableView.refreshControl?.endRefreshing()
    }
}

// MARK: - Extensions

extension ProfileViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postExamples.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = Self.postTableView.dequeueReusableCell(withIdentifier: Self.postIdent, for: indexPath) as? PostTableViewCell {
            cell.configPostArray(post: postExamples[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Self.headerIdent) as! ProfileHeaderView
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 220 : 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        if let post = cell as? PostTableViewCell {
            post.incrementPostViewsCounter()
        }
    }
}

