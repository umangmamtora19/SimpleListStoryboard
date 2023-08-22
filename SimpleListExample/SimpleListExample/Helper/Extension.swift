//
//  Extension.swift
//
//  Created by Umang on 23/06/23.
//

import UIKit

extension String {
//    This is common function to convert specific date string to other
    func toDate(format from: String, format to: String) -> Self {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = from
        let dateFormatterTo = DateFormatter()
        dateFormatterTo.dateFormat = to
        if let date: Date = dateFormatter.date(from: self) as Date? {
            let strDate = dateFormatterTo.string(from: date as Date)
            return strDate
        }
        return "nil"
    }
}

extension UIView {
//    This common function is used to make any view circular
    func setCircularCorner() {
        self.layer.cornerRadius = self.frame.width / 2
    }
    
//    This common function is used to give corners to any view
    func setCorner(radius: CGFloat) {
        self.layer.cornerRadius = radius 
    }
}
 
extension UITableView {
//    This comment function is used to reload tableview with some animation
    func reloadWithAnimation() {
        UIView.transition(with: self, duration: 0.35, options: .transitionCrossDissolve, animations: { self.reloadData()
        })
    }
}
