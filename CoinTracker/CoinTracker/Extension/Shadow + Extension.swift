//
//  Shadow + Extension.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 25/06/25.
//

import UIKit

extension UIView {
    func applyShadow(
    color: UIColor = .black,
        alpha: Float = 0.2,
        x: CGFloat = -4,   // sombra para a esquerda
        y: CGFloat = 4,    // sombra para baixo
        blur: CGFloat = 8,
        spread: CGFloat = 0
    ) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = alpha
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = blur / 2
        
        if spread == 0 {
            layer.shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
