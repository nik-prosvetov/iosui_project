//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Serge Kotov on 03.06.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    // MARK: Visual objects
    
    var fullNameLabel = UILabel()
    var avatarImageView = UIImageView()
    var statusLabel = UILabel()
    var statusTextField = UITextField()
    var setStatusButton = UIButton()
    
    private var statusText = "Ready to help"
    
    // MARK: - Setup section
        
    func setup() {
        setupAvatarImage()
        setupNameLabel()
        setupStatusLabel()
        setupStatusTextField()
        setupStatusButton()
    }
    
    private func setupNameLabel() {
//        fullNameLabel.frame = CGRect(x: 160, y: 16, width: 128, height: 32)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.text = "Teo West"
        fullNameLabel.font = .boldSystemFont(ofSize: 18)
        fullNameLabel.textColor = .black
        addSubview(fullNameLabel)
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 28),
        ])
    }
    
    private func setupAvatarImage() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = UIImage(named: "teo")
        avatarImageView.layer.cornerRadius = 64
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.clipsToBounds = true
        addSubview(avatarImageView)
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 128),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
        ])
    }
    
    private func setupStatusLabel() {
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = statusText
        statusLabel.font = .systemFont(ofSize: 17)
        statusLabel.textColor = .black
        addSubview(statusLabel)
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 16),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            statusLabel.heightAnchor.constraint(equalTo: fullNameLabel.heightAnchor),
        ])
    }
    
    private func setupStatusTextField() {
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.textColor = .darkGray
        statusTextField.backgroundColor = .white
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        statusTextField.leftView = paddingView
        statusTextField.leftViewMode = .always
        statusTextField.layer.cornerRadius = 8
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.gray.cgColor
        statusTextField.attributedPlaceholder = NSAttributedString.init(string: "Ready...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        addSubview(statusTextField)
        NSLayoutConstraint.activate([
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 32),
        ])
    }
    
    private func setupStatusButton() {
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.cornerRadius = 12
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)
        addSubview(setStatusButton)
        NSLayoutConstraint.activate([
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    // MARK: - Event handlers
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
    
    @objc func statusButtonPressed() {
        statusLabel.text = statusText
    }
}
