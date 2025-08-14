//
//  HeaderTableViewCellView.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 02/08/25.
//

import UIKit

class HeaderTableViewCellView: UIView {

    lazy var headerCardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.cellBackgroundColor
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSuperView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func addSuperView() {
        addSubview(headerCardView)
        headerCardView.addSubview(titleLabel)
        headerCardView.addSubview(subTitleLabel)
        headerCardView.addSubview(exploreButton)
        headerCardView.addSubview(bitcoinImageview)

    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            headerCardView.topAnchor.constraint(equalTo: topAnchor),
            headerCardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            headerCardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
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
        ])
    }
    
}
