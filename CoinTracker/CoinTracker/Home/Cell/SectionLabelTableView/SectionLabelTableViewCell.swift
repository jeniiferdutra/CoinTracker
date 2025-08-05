//
//  SectionLabelTableViewCell.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 02/08/25.
//

import UIKit

class SectionLabelTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: SectionLabelTableViewCell.self)
    
    private lazy var screen: SectionLabelTableViewCellView = {
        let view = SectionLabelTableViewCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor(red: 23/255, green: 21/255, blue: 32/255, alpha: 1.0)
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
            screen.topAnchor.constraint(equalTo: contentView.topAnchor),
            screen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            screen.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            screen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8)
        ])
    }
}
