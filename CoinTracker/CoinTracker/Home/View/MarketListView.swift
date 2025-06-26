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
        view.backgroundColor = UIColor(red: 23/255, green: 21/255, blue: 32/255, alpha: 1.0)
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
    
    lazy var headerCardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 66/255, alpha: 1.0)
        view.layer.cornerRadius = 15
        view.applyShadow()
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Buy Bitcoin and unlock your wallet"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Original BTC"
        label.textColor = .orange
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var exploreButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Explore", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.white.cgColor
        btn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        //btn.addTarget(self, action: #selector(), for: .touchUpInside)
        return btn
    }()
    
    lazy var bitcoinImageview: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "bitcoin")
        return img
    }()
    
    lazy var popularLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Popular Currencies"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(CoinTableViewCell.self, forCellReuseIdentifier: CoinTableViewCell.identifier)
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
        addSubview(headerCardView)
        
        headerCardView.addSubview(titleLabel)
        headerCardView.addSubview(subTitleLabel)
        headerCardView.addSubview(exploreButton)
        headerCardView.addSubview(bitcoinImageview)
        
        addSubview(popularLabel)
        addSubview(tableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            welcomeView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            welcomeView.leadingAnchor.constraint(equalTo: leadingAnchor),
            welcomeView.trailingAnchor.constraint(equalTo: trailingAnchor),
            welcomeView.heightAnchor.constraint(equalToConstant: 60),
            
            helloLabel.topAnchor.constraint(equalTo: welcomeView.topAnchor, constant: 25),
            helloLabel.leadingAnchor.constraint(equalTo: welcomeView.leadingAnchor, constant: 20),
            
            worthLabel.topAnchor.constraint(equalTo: welcomeView.bottomAnchor, constant: 25),
            worthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            valueLabel.topAnchor.constraint(equalTo: worthLabel.topAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: worthLabel.trailingAnchor, constant: 120),
            
            headerCardView.topAnchor.constraint(equalTo: worthLabel.bottomAnchor, constant: 25),
            headerCardView.leadingAnchor.constraint(equalTo: worthLabel.leadingAnchor),
            headerCardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            headerCardView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: headerCardView.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: headerCardView.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: headerCardView.trailingAnchor, constant: -200),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            exploreButton.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 25),
            exploreButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            exploreButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            exploreButton.heightAnchor.constraint(equalToConstant: 40),
            
            bitcoinImageview.topAnchor.constraint(equalTo: headerCardView.topAnchor, constant: 30),
            bitcoinImageview.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 30),
            bitcoinImageview.heightAnchor.constraint(equalToConstant: 150),
            bitcoinImageview.widthAnchor.constraint(equalToConstant: 150),
            
            popularLabel.topAnchor.constraint(equalTo: headerCardView.bottomAnchor, constant: 25),
            popularLabel.leadingAnchor.constraint(equalTo: worthLabel.leadingAnchor),
            
            tableView.topAnchor.constraint(equalTo: popularLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
