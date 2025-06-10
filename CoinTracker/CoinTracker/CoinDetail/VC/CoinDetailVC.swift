//
//  CoinDetailVC.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 05/06/25.
//

import UIKit

class CoinDetailVC: UIViewController {
    
    private var screen: CoinDetailView?
    private var viewModel: CoinDetailViewModel
    
    init(coin: CoinElement) {
        self.viewModel = CoinDetailViewModel(coin: coin)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = CoinDetailView()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    private func setupData() {
        if let url = viewModel.imageURL {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else { return }
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.screen?.coinImageview.image = image
                }
            }.resume()
            
            screen?.coinNameLabel.text = viewModel.name
            screen?.coinSymbolLabel.text = viewModel.symbol
            screen?.currentPriceLabel.text = viewModel.currentPrice
            screen?.highIn24hLabel.text = viewModel.high24h
            screen?.lowIn24hLabel.text = viewModel.low24h
            screen?.marketCapRankLabel.text = viewModel.marketCap
            screen?.volumeLabel.text = viewModel.totalVolume
            screen?.circulatingLabel.text = viewModel.circulatingSupplyFormatted
            screen?.athPriceLabel.text = viewModel.ath
            screen?.atlPriceLabel.text = viewModel.atl
            screen?.roiLabel.text = viewModel.roi
        }
    }
}
