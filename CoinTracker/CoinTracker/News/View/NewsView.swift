//
//  NewsView.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 11/06/25.
//

import UIKit

class NewsView: UIView {
    
    lazy var newsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 35/255, green: 33/255, blue: 45/255, alpha: 1.0)
        view.applyShadow()
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Crypto News"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.identifier)
        tableView.backgroundColor = .clear 
        tableView.separatorStyle = .none
        tableView.bounces = false
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 23/255, green: 21/255, blue: 32/255, alpha: 1.0)
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTableViewProtocol(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    private func addViews() {
        addSubview(newsContainerView)
        newsContainerView.addSubview(titleLabel)
        addSubview(tableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            newsContainerView.topAnchor.constraint(equalTo: topAnchor),
            newsContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.12),
            
            titleLabel.topAnchor.constraint(equalTo: newsContainerView.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
