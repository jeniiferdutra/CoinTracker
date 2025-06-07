//
//  CoinDetailView.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 05/06/25.
//

import UIKit

class CoinDetailView: UIView {
    
    //MARK: - 1. Header
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Coin Tracker"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.backgroundColor = UIColor(red: 23/255, green: 21/255, blue: 32/255, alpha: 1.0)
        return label
    }()
    
    lazy var bitcoinImageview: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "bitcoin")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 66/255, alpha: 1.0)
        return img
    }()
    
    lazy var bitcoinLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bitcoin"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var symbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BTC"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var currentPriceView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 66/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Price"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 19)
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$48,000"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    // MARK: - 2. Resumo de Preço (24h)
    
    lazy var priceSummaryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Price Summary (24h)"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    lazy var titleHighPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "High"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    lazy var highPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$49,000"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22)
        return label
    }()
    
    lazy var lowPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$49,000"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    //MARK: - 3. Capitalização e Volume
    
    lazy var titleMarketCapLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Market capitalization and Volume"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
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
    
    private func addViews() {
        addSubview(titleLabel)
        addSubview(bitcoinImageview)
        addSubview(bitcoinLabel)
        addSubview(symbolLabel)
        addSubview(currentPriceView)
        currentPriceView.addSubview(priceLabel)
        currentPriceView.addSubview(valueLabel)
        addSubview(priceSummaryLabel)
        addSubview(titleHighPriceLabel)
        addSubview(highPriceLabel)
        addSubview(lowPriceLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            
            bitcoinImageview.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            bitcoinImageview.centerXAnchor.constraint(equalTo: centerXAnchor),
            bitcoinImageview.heightAnchor.constraint(equalToConstant: 250),
            
            bitcoinLabel.topAnchor.constraint(equalTo: bitcoinImageview.bottomAnchor, constant: 10),
            bitcoinLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            symbolLabel.topAnchor.constraint(equalTo: bitcoinLabel.bottomAnchor, constant: 15),
            symbolLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            currentPriceView.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: 15),
            currentPriceView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            currentPriceView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            currentPriceView.heightAnchor.constraint(equalToConstant: 100),
            
            priceLabel.topAnchor.constraint(equalTo: currentPriceView.topAnchor, constant: 15),
            priceLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor, constant: 20),
            
            valueLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 15),
            valueLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            
            priceSummaryLabel.topAnchor.constraint(equalTo: currentPriceView.bottomAnchor, constant: 30),
            priceSummaryLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            titleHighPriceLabel.topAnchor.constraint(equalTo: priceSummaryLabel.bottomAnchor, constant: 15),
            titleHighPriceLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            highPriceLabel.topAnchor.constraint(equalTo: titleHighPriceLabel.bottomAnchor, constant: 15),
            highPriceLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
        ])
    }
}
