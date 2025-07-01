//
//  CoinTableViewCellView.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 23/05/25.
//

import UIKit

class CoinTableViewCellView: UIView {
    
    lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 66/255, alpha: 1.0)
        view.applyShadow()
        return view
    }()
    
    lazy var coinImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var coinNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var coinSymbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var coinPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var coinChangeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(view)
        view.addSubview(coinImageView)
        view.addSubview(coinNameLabel)
        view.addSubview(coinSymbolLabel)
        view.addSubview(coinPriceLabel)
        view.addSubview(coinChangeLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            coinImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            coinImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            coinImageView.widthAnchor.constraint(equalToConstant: 40),
            coinImageView.heightAnchor.constraint(equalToConstant: 40),
            
            coinNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            coinNameLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 12),
            
            coinSymbolLabel.centerYAnchor.constraint(equalTo: coinNameLabel.centerYAnchor),
            coinSymbolLabel.leadingAnchor.constraint(equalTo: coinNameLabel.trailingAnchor, constant: 8),
            coinSymbolLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
            
            coinPriceLabel.topAnchor.constraint(equalTo: coinNameLabel.bottomAnchor, constant: 8),
            coinPriceLabel.leadingAnchor.constraint(equalTo: coinNameLabel.leadingAnchor),
            
            coinChangeLabel.centerYAnchor.constraint(equalTo: coinPriceLabel.centerYAnchor),
            coinChangeLabel.leadingAnchor.constraint(equalTo: coinPriceLabel.trailingAnchor, constant: 12),
            coinChangeLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16)
        ])
    }
}
