//
//  NewsTableViewCell.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 12/06/25.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: NewsTableViewCell.self)
    
    private lazy var screen: NewsTableViewCellView = {
        let view = NewsTableViewCellView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
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
            screen.topAnchor.constraint(equalTo: contentView.topAnchor),
            screen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
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
            screen.sourceLabel.text = data.source?.name ?? "Fonte desconhecida"
            screen.publishedAtLabel.text = formatRelativeDate(data.publishedAt)
            screen.descriptionLabel.text = data.description ?? ""
        }
    }
    
    private func formatRelativeDate(_ date: Date?) -> String {
        guard let date = date else { return "Data desconhecida" }

        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full // "5 days ago", "2 hours ago"
        // formatter.locale = Locale(identifier: "pt_BR") // Descomente se quiser em português
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}
