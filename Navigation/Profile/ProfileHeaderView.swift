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
    
    func setup(frame: CGRect) {
        self.frame = frame
        
        setupNameLabel()
        setupAvatarImage()
        setupStatusLabel()
        setupStatusTextField()
        setupStatusButton()
    }
    
    private func setupNameLabel() {
        fullNameLabel.frame = CGRect(x: 160, y: 16, width: 128, height: 32)
        fullNameLabel.text = "Teo West"
        fullNameLabel.font = .boldSystemFont(ofSize: 18)
        fullNameLabel.textColor = .black
        addSubview(fullNameLabel)
    }
    
    private func setupAvatarImage() {
        avatarImageView.frame = CGRect(x: 16, y: 16, width: 128, height: 128)
        avatarImageView.image = UIImage(named: "teo")
        avatarImageView.layer.cornerRadius = 64
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.clipsToBounds = true
        addSubview(avatarImageView)
    }
    
    private func setupStatusLabel() {
        statusLabel.frame = CGRect(x: 160, y: 48, width: UIScreen.main.bounds.width - 176, height: 32)
        statusLabel.text = statusText
        statusLabel.font = .systemFont(ofSize: 17)
        statusLabel.textColor = .black
        addSubview(statusLabel)
    }
    
    private func setupStatusTextField() {
        statusTextField.frame = CGRect(x: 160, y: 96, width: UIScreen.main.bounds.width - 176, height: 32)
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
    }
    
    private func setupStatusButton() {
        setStatusButton.frame = CGRect(x: 16, y: 160, width: UIScreen.main.bounds.width - 32, height: 50)
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
    }
    
    // MARK: - Event handlers
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
    
    @objc func statusButtonPressed() {
        statusLabel.text = statusText
    }
}
