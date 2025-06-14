//
//  NewsTableViewCellView.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 12/06/25.
//

import UIKit

class NewsTableViewCellView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.text = "Bitcoin's price surges to 60k"
        label.numberOfLines = 0
        return label
    }()
    
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
        label.text = "CNN"
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var publishedAtLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "5 days ago"
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
        img.image = UIImage(named: "exemple")
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        return img
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "The cryptocurrency market has been on a tear the last few weeks, with bitcoin hitting record highs and other digital tokens seeing huge gains. Bitcoin rose to more than $60,000 per coin over the weekend."
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 17)
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
        addSubview(titleLabel)
        addSubview(articleSourceLabel)
        addSubview(sourceLabel)
        addSubview(publishedAtLabel)
        addSubview(imageContainerView)
        imageContainerView.addSubview(thumbnailImageView)
        addSubview(descriptionLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            articleSourceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            articleSourceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            sourceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            sourceLabel.leadingAnchor.constraint(equalTo: articleSourceLabel.trailingAnchor, constant: 3),
            
            publishedAtLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            publishedAtLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            imageContainerView.topAnchor.constraint(equalTo: articleSourceLabel.bottomAnchor, constant: 20),
            imageContainerView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            imageContainerView.trailingAnchor.constraint(equalTo: publishedAtLabel.trailingAnchor),
            imageContainerView.heightAnchor.constraint(equalToConstant: 200),
            
            thumbnailImageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            thumbnailImageView.centerXAnchor.constraint(equalTo: centerXAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: publishedAtLabel.trailingAnchor)
        ])
    }
}
