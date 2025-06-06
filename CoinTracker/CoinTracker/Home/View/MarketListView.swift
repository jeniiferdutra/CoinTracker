//
//  MarketListView.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 23/05/25.
//

import UIKit

class MarketListView: UIView {
    
    lazy var helpButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Help", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        //btn.addTarget(self, action: #selector(), for: .touchUpInside)
        return btn
    }()
    
    lazy var worthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total Worth"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "₿20,25,073"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var headerCardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 66/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
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
    
    lazy var assetsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Assets"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(helpButton)
        addSubview(worthLabel)
        addSubview(valueLabel)
        addSubview(headerCardView)
        
        headerCardView.addSubview(titleLabel)
        headerCardView.addSubview(subTitleLabel)
        headerCardView.addSubview(exploreButton)
        headerCardView.addSubview(bitcoinImageview)
        
        addSubview(assetsLabel)
        addSubview(tableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            helpButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            helpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            
            worthLabel.topAnchor.constraint(equalTo: helpButton.bottomAnchor, constant: 25),
            worthLabel.leadingAnchor.constraint(equalTo: helpButton.leadingAnchor),
            
            valueLabel.topAnchor.constraint(equalTo: worthLabel.topAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: worthLabel.trailingAnchor, constant: 120),
            
            headerCardView.topAnchor.constraint(equalTo: worthLabel.bottomAnchor, constant: 25),
            headerCardView.leadingAnchor.constraint(equalTo: helpButton.leadingAnchor),
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
            
            assetsLabel.topAnchor.constraint(equalTo: headerCardView.bottomAnchor, constant: 25),
            assetsLabel.leadingAnchor.constraint(equalTo: helpButton.leadingAnchor),
            
            tableView.topAnchor.constraint(equalTo: assetsLabel.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
