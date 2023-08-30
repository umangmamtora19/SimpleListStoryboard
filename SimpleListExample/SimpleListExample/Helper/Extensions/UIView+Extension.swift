//
//  UIView+Exatension.swift
//  SimpleListExample
//
//  Created by Umang on 29/08/23.
//

import UIKit

//   Resolved : Created as pe standard convention
extension UIView {
//    This common function is used to make any view circular
    func setCircularCorner() {
        self.layer.cornerRadius = self.frame.width / 2
    }
    
//    This common function is used to give corners to any view
    func setCorner(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
//    This common function is used set gredient to any view
    func setGradient(with colors: [UIColor], locations: [NSNumber] = [0.0, 1.0]) {
        let gradient: CAGradientLayer = CAGradientLayer()
        removeGradient()
        gradient.colors = colors.map{$0.cgColor}
        gradient.locations = locations.map{$0.self}
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        gradient.accessibilityLabel = "viewGradient"
        self.layer.insertSublayer(gradient, at: 1)
    }
    
    
    private func removeGradient() {
        layer.sublayers?.removeAll(where: {$0.accessibilityLabel == "viewGradient"})
    }
}

