//
//  CoinDetailView.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 05/06/25.
//

import UIKit

class CoinDetailView: UIView {
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - 1. Header
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Coin Tracker"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.backgroundColor = UIColor(red: 23/255, green: 21/255, blue: 32/255, alpha: 1.0)
        return label
    }()
    
    lazy var coinImageview: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 66/255, alpha: 1.0)
        return img
    }()
    
    lazy var coinNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var coinSymbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    // MARK: - 2. Resumo de Preço (24h)
    
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
    
    lazy var currentPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    //MARK: - 3. Resumo de Preço em 24h
    
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
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    lazy var highIn24hLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    lazy var titleLowPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Low"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    lazy var lowIn24hLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    //MARK: - 4. Capitalização de Mercado e Volume
    
    lazy var titleMarketCapLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Market capitalization and Volume"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    lazy var marketCapLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Market Cap"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    lazy var marketCapRankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    lazy var totalVolumeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Volume"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    lazy var volumeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    //MARK: - 5. Fornecimento circulante
    
    lazy var circulatingSupplyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Circulating Supply"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    lazy var circulatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        return label
    }()
    
    // MARK: - 6. Máximas e mínimas históricas
    
    lazy var changePercentageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "All-Time Highs and Lows"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    lazy var athLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ATH"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    lazy var athPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    lazy var atlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ATL"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    lazy var atlPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    //MARK: - 7. ROI (Retorno sobre o Investimento)
    
    lazy var returnOnInvestmentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ROI (Return on Investment)"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    
    lazy var roiTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ROI"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    lazy var roiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    lazy var currencyTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Base currency"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 19)
        return label
    }()
    
    lazy var currencyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 19)
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
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(coinImageview)
        contentView.addSubview(coinNameLabel)
        contentView.addSubview(coinSymbolLabel)
        contentView.addSubview(currentPriceView)
        currentPriceView.addSubview(priceLabel)
        currentPriceView.addSubview(currentPriceLabel)
        contentView.addSubview(priceSummaryLabel)
        contentView.addSubview(titleHighPriceLabel)
        contentView.addSubview(highIn24hLabel)
        contentView.addSubview(titleLowPriceLabel)
        contentView.addSubview(lowIn24hLabel)
        contentView.addSubview(titleMarketCapLabel)
        contentView.addSubview(marketCapLabel)
        contentView.addSubview(marketCapRankLabel)
        contentView.addSubview(totalVolumeLabel)
        contentView.addSubview(volumeLabel)
        contentView.addSubview(circulatingSupplyLabel)
        contentView.addSubview(circulatingLabel)
        contentView.addSubview(changePercentageLabel)
        contentView.addSubview(athLabel)
        contentView.addSubview(athPriceLabel)
        contentView.addSubview(atlLabel)
        contentView.addSubview(atlPriceLabel)
        contentView.addSubview(returnOnInvestmentLabel)
        contentView.addSubview(roiTitleLabel)
        contentView.addSubview(roiLabel)
        contentView.addSubview(currencyTitleLabel)
        contentView.addSubview(currencyLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            
            coinImageview.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            coinImageview.centerXAnchor.constraint(equalTo: centerXAnchor),
            coinImageview.leadingAnchor.constraint(equalTo: leadingAnchor),
            coinImageview.trailingAnchor.constraint(equalTo: trailingAnchor),
            coinImageview.heightAnchor.constraint(equalToConstant: 230),
            
            coinNameLabel.topAnchor.constraint(equalTo: coinImageview.bottomAnchor, constant: 10),
            coinNameLabel.centerXAnchor.constraint(equalTo: coinImageview.centerXAnchor),
            coinNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            coinNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            coinSymbolLabel.topAnchor.constraint(equalTo: coinNameLabel.bottomAnchor, constant: 15),
            coinSymbolLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            currentPriceView.topAnchor.constraint(equalTo: coinSymbolLabel.bottomAnchor, constant: 15),
            currentPriceView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            currentPriceView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            currentPriceView.heightAnchor.constraint(equalToConstant: 100),
            
            priceLabel.topAnchor.constraint(equalTo: currentPriceView.topAnchor, constant: 15),
            priceLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor, constant: 20),
            
            currentPriceLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 15),
            currentPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            
            priceSummaryLabel.topAnchor.constraint(equalTo: currentPriceView.bottomAnchor, constant: 30),
            priceSummaryLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            titleHighPriceLabel.topAnchor.constraint(equalTo: priceSummaryLabel.bottomAnchor, constant: 15),
            titleHighPriceLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            highIn24hLabel.topAnchor.constraint(equalTo: titleHighPriceLabel.bottomAnchor, constant: 5),
            highIn24hLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            titleLowPriceLabel.topAnchor.constraint(equalTo: highIn24hLabel.bottomAnchor, constant: 15),
            titleLowPriceLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            lowIn24hLabel.topAnchor.constraint(equalTo: titleLowPriceLabel.bottomAnchor, constant: 5),
            lowIn24hLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            titleMarketCapLabel.topAnchor.constraint(equalTo: lowIn24hLabel.bottomAnchor, constant: 30),
            titleMarketCapLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            marketCapLabel.topAnchor.constraint(equalTo: titleMarketCapLabel.bottomAnchor, constant: 15),
            marketCapLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            marketCapRankLabel.topAnchor.constraint(equalTo: marketCapLabel.bottomAnchor, constant: 5),
            marketCapRankLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            totalVolumeLabel.topAnchor.constraint(equalTo: marketCapRankLabel.bottomAnchor, constant: 15),
            totalVolumeLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            volumeLabel.topAnchor.constraint(equalTo: totalVolumeLabel.bottomAnchor, constant: 5),
            volumeLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            circulatingSupplyLabel.topAnchor.constraint(equalTo: volumeLabel.bottomAnchor, constant: 30),
            circulatingSupplyLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            circulatingLabel.topAnchor.constraint(equalTo: circulatingSupplyLabel.bottomAnchor, constant: 15),
            circulatingLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            changePercentageLabel.topAnchor.constraint(equalTo: circulatingLabel.bottomAnchor, constant: 30),
            changePercentageLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            athLabel.topAnchor.constraint(equalTo: changePercentageLabel.bottomAnchor, constant: 15),
            athLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            athPriceLabel.topAnchor.constraint(equalTo: athLabel.bottomAnchor, constant: 5),
            athPriceLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            atlLabel.topAnchor.constraint(equalTo: athPriceLabel.bottomAnchor, constant: 15),
            atlLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            atlPriceLabel.topAnchor.constraint(equalTo: atlLabel.bottomAnchor, constant: 5),
            atlPriceLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            returnOnInvestmentLabel.topAnchor.constraint(equalTo: atlPriceLabel.bottomAnchor, constant: 30),
            returnOnInvestmentLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            roiTitleLabel.topAnchor.constraint(equalTo: returnOnInvestmentLabel.bottomAnchor, constant: 15),
            roiTitleLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            roiLabel.topAnchor.constraint(equalTo: roiTitleLabel.bottomAnchor, constant: 5),
            roiLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            currencyTitleLabel.topAnchor.constraint(equalTo: roiLabel.bottomAnchor, constant: 15),
            currencyTitleLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            currencyLabel.topAnchor.constraint(equalTo: currencyTitleLabel.bottomAnchor, constant: 5),
            currencyLabel.leadingAnchor.constraint(equalTo: currentPriceView.leadingAnchor),
            
            contentView.bottomAnchor.constraint(equalTo: currencyLabel.bottomAnchor, constant: 30),
            contentView.bottomAnchor.constraint(greaterThanOrEqualTo: scrollView.bottomAnchor)
        ])
    }
}
