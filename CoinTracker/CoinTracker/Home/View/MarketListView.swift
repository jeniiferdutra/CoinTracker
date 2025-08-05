//
//  MarketListView.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 23/05/25.
//

import UIKit

class MarketListView: UIView {
    
    lazy var welcomeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 35/255, green: 33/255, blue: 45/255, alpha: 1.0)
        view.applyShadow()
        return view
    }()
    
    lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    lazy var worthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total Worth"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "₿20,25,073"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: HeaderTableViewCell.identifier)
        tableView.register(SectionLabelTableViewCell.self, forCellReuseIdentifier: SectionLabelTableViewCell.identifier)
        tableView.register(CoinTableViewCell.self, forCellReuseIdentifier: CoinTableViewCell.identifier)
        tableView.bounces = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 23/255, green: 21/255, blue: 32/255, alpha: 1.0)
        addSuperView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTableViewProtocol(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    private func addSuperView() {
        addSubview(welcomeView)
        welcomeView.addSubview(helloLabel)
        addSubview(worthLabel)
        addSubview(valueLabel)
        addSubview(tableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            welcomeView.topAnchor.constraint(equalTo: topAnchor),
            welcomeView.leadingAnchor.constraint(equalTo: leadingAnchor),
            welcomeView.trailingAnchor.constraint(equalTo: trailingAnchor),
            welcomeView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.12),
            
            helloLabel.topAnchor.constraint(equalTo: welcomeView.safeAreaLayoutGuide.topAnchor),
            helloLabel.leadingAnchor.constraint(equalTo: welcomeView.leadingAnchor, constant: 20),
            
            worthLabel.topAnchor.constraint(equalTo: welcomeView.bottomAnchor, constant: 25),
            worthLabel.leadingAnchor.constraint(equalTo: helloLabel.leadingAnchor),
            
            valueLabel.topAnchor.constraint(equalTo: worthLabel.topAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: worthLabel.bottomAnchor, constant: 25),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
