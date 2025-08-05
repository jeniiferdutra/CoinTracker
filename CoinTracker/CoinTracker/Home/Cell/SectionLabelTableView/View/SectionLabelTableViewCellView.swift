//
//  SectionLabelTableViewCellView.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 02/08/25.
//

import UIKit

class SectionLabelTableViewCellView: UIView {

    lazy var popularLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Popular Currencies"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
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
        addSubview(popularLabel)

    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            popularLabel.topAnchor.constraint(equalTo: topAnchor),
            popularLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            popularLabel.heightAnchor.constraint(equalToConstant: 100),
            
        ])
    }
}
