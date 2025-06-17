//
//  NewsTableViewCell.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 12/06/25.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: NewsTableViewCell.self)
    
    lazy var screen: NewsTableViewCellView = {
        let view = NewsTableViewCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        contentView.addSubview(screen)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            screen.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    public func setupCell(data: Article) {
        if let imageUrl = URL(string: data.image ?? "") {
            URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                if let data = data {
                    DispatchQueue.main.async {
                        self.screen.thumbnailImageView.image = UIImage(data: data)
                    }
                }
            }.resume()
            
            screen.titleLabel.text = data.title ?? ""
        }
    }
}
