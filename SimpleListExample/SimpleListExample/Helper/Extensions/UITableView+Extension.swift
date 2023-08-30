//
//  UITableView+Extension.swift
//  SimpleListExample
//
//  Created by Umang on 29/08/23.
//

import UIKit

// Resolved : Created as pe standard convention
extension UITableView {
//    This comment function is used to reload tableview with some animation
    func reloadWithAnimation() {
        UIView.transition(with: self, duration: 0.35, options: .transitionCrossDissolve, animations: { self.reloadData()
        })
    }
}
