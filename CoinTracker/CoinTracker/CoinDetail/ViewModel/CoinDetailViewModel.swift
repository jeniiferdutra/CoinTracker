//
//  CoinDetailViewModel.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 08/06/25.
//

import Foundation

class CoinDetailViewModel {

    private let coin: CoinElement

    init(coin: CoinElement) {
        self.coin = coin
    }

    public var name: String {
        return coin.name ?? "Nome não disponível"
    }

    var symbol: String {
        return coin.symbol?.uppercased() ?? "-"
    }

    var currentPrice: String {
        return formatCurrency(coin.currentPrice)
    }

    var marketCap: String {
        return formatCurrency(Double(coin.marketCap ?? 0))
    }
    
    var totalVolume: String {
        return formatCurrency(Double(coin.totalVolume ?? 0))
    }

    var high24h: String {
        return formatCurrency(coin.high24H)
    }

    var low24h: String {
        return formatCurrency(coin.low24H)
    }

    var priceChangePercentage24h: String {
        guard let change = coin.priceChangePercentage24H else { return "N/A" }
        return String(format: "%.2f%%", change)
    }

    var imageURL: URL? {
        guard let image = coin.image else { return nil }
        return URL(string: image)
    }
    
    var circulatingSupplyFormatted: String {
        guard let supply = coin.circulatingSupply else { return "N/A" }
        let formattedSupply = formatLargeNumber(supply)
        return "\(formattedSupply) \(symbol)"
    }

    var circulatingSupplyValue: String {
        guard let supply = coin.circulatingSupply,
              let price = coin.currentPrice else { return "N/A" }
        let value = supply * price
        return formatCurrency(value)
    }
    
    var ath: String {
        return formatCurrency(coin.ath)
    }

    var atl: String {
        return formatCurrency(coin.atl)
    }

    // MARK: - Private helpers

    private func formatCurrency(_ value: Double?) -> String {
        guard let value = value else { return "$ 0,00" }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$ "
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: NSNumber(value: value)) ?? "$ 0,00"
    }
    
    private func formatLargeNumber(_ number: Double) -> String {
        let thousand = 1000.0
        let million = thousand * 1000
        let billion = million * 1000

        if number >= billion {
            return String(format: "%.2fB", number / billion)
        } else if number >= million {
            return String(format: "%.2fM", number / million)
        } else if number >= thousand {
            return String(format: "%.2fK", number / thousand)
        } else {
            return String(format: "%.0f", number)
        }
    }
}

