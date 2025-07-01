//
//  UIColor + Extension.swift
//  CoinTracker
//
//  Created by Jenifer Rocha on 18/06/25.
//

import Foundation
import UIKit

extension UIView {
    
    public func applyCryptoGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds

        gradientLayer.colors = [
            UIColor(red: 23/255, green: 21/255, blue: 32/255, alpha: 1).cgColor, // 34%
            UIColor(red: 37/255, green: 37/255, blue: 48/255, alpha: 1).cgColor  // 73%
        ]

        gradientLayer.locations = [0.34, 0.73]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0) // de cima
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)   // para baixo

        layer.insertSublayer(gradientLayer, at: 0)
    }
}
