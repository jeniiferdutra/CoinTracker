//
//  NewsTableViewCellView.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 12/06/25.
//

import UIKit

class NewsTableViewCellView: UIView {
    
    lazy var articleSourceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Published by:"
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var sourceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var publishedAtLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var imageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var thumbnailImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(articleSourceLabel)
        addSubview(sourceLabel)
        addSubview(publishedAtLabel)
        addSubview(imageContainerView)
        imageContainerView.addSubview(thumbnailImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            articleSourceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            articleSourceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            sourceLabel.centerYAnchor.constraint(equalTo: articleSourceLabel.centerYAnchor),
            sourceLabel.leadingAnchor.constraint(equalTo: articleSourceLabel.trailingAnchor, constant: 5),

            publishedAtLabel.centerYAnchor.constraint(equalTo: articleSourceLabel.centerYAnchor),
            publishedAtLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            imageContainerView.topAnchor.constraint(equalTo: articleSourceLabel.bottomAnchor, constant: 10),
            imageContainerView.leadingAnchor.constraint(equalTo: articleSourceLabel.leadingAnchor),
            imageContainerView.trailingAnchor.constraint(equalTo: publishedAtLabel.trailingAnchor),
            imageContainerView.heightAnchor.constraint(equalToConstant: 200),
            
            thumbnailImageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            thumbnailImageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            thumbnailImageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
            thumbnailImageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: articleSourceLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: publishedAtLabel.trailingAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: articleSourceLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: publishedAtLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
        ])
    }
}
