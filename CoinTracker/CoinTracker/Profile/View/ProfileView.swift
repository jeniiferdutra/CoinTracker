//
//  ProfileView.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 01/07/25.
//

import UIKit

protocol ProfileViewProtocol: AnyObject {
    func logoutTapped()
}

class ProfileView: UIView {
    
    private weak var delegate: ProfileViewProtocol?
    
    public func delegate(delegate: ProfileViewProtocol?) {
        self.delegate = delegate
    }
    
    lazy var containerProfileView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.topBackgroundColor
        view.applyShadow()
        return view
    }()
    
    lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Profile"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    lazy var profileImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "profile")
        img.applyShadow()
        return img
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 80/255, green: 80/255, blue: 100/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var logoutContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(logoutTapped))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    @objc func logoutTapped() {
        self.delegate?.logoutTapped()
    }
    
    lazy var logOutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Log Out"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    lazy var arrowLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "→"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.mainBackgroundColor
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(containerProfileView)
        containerProfileView.addSubview(profileLabel)
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(emailLabel)
        addSubview(logoutContainerView)
        logoutContainerView.addSubview(logOutLabel)
        logoutContainerView.addSubview(arrowLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            containerProfileView.topAnchor.constraint(equalTo: topAnchor),
            containerProfileView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerProfileView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerProfileView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.12),
            
            profileLabel.topAnchor.constraint(equalTo: containerProfileView.safeAreaLayoutGuide.topAnchor),
            profileLabel.centerXAnchor.constraint(equalTo: containerProfileView.centerXAnchor),
            
            profileImageView.topAnchor.constraint(equalTo: containerProfileView.bottomAnchor, constant: 40),
            profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileImageView.heightAnchor.constraint(equalToConstant: 150),
            profileImageView.widthAnchor.constraint(equalToConstant: 150),
            
            nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            logoutContainerView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 30),
            logoutContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            logoutContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            logoutContainerView.heightAnchor.constraint(equalToConstant: 50),
            
            logOutLabel.leadingAnchor.constraint(equalTo: logoutContainerView.leadingAnchor, constant: 20),
            logOutLabel.centerYAnchor.constraint(equalTo: logoutContainerView.centerYAnchor),
            
            arrowLabel.trailingAnchor.constraint(equalTo: logoutContainerView.trailingAnchor, constant: -20),
            arrowLabel.centerYAnchor.constraint(equalTo: logoutContainerView.centerYAnchor)
        ])
    }
    
    public func setupUserData(name: String, email: String) {
        nameLabel.text = name
        emailLabel.text = email
    }
}
