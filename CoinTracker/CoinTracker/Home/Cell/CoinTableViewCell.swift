//
//  CoinTableViewCell.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 23/05/25.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    
    static let identifier: String = "CoinTableViewCell"
    
    lazy var screen: CoinTableViewCellScreen = {
        let view = CoinTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addViews()
        configConstrains()
    }
    
    private func addViews() {
        contentView.addSubview(screen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstrains() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            screen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            screen.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            screen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8)
        ])
    }
    
    public func setupHomeCell(data: CoinElement) {
        if let imageUrl = URL(string: data.image ?? "") {
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                if let data = data {
                    DispatchQueue.main.async {
                        self.screen.coinImageView.image = UIImage(data: data)
                    }
                }
            }.resume()
            
            screen.coinNameLabel.text = data.name ?? ""
            screen.coinSymbolLabel.text = data.symbol ?? ""
            screen.coinPriceLabel.text = String(format: "$ %.2f", data.currentPrice ?? 0.0)
            
            if let priceChange = data.priceChangePercentage24H {
                let changeText = String(format: "%.2f%%", priceChange)
                screen.coinChangeLabel.text = priceChange >= 0 ? "+\(changeText)" : changeText
                screen.coinChangeLabel.textColor = priceChange >= 0 ? .systemGreen : .systemRed
            } else {
                screen.coinChangeLabel.text = "--"
                screen.coinChangeLabel.textColor = .gray
            }
        }
    }
}
