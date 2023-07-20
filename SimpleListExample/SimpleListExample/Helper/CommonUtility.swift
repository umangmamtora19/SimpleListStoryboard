//
//  CommonUtility.swift
//  SimpleListExample
//
//  Created by Umang on 28/06/23.
//

import UIKit
import Toast

class CommonUtility {
    static let shared = CommonUtility()
    private let indicator = UIActivityIndicatorView()

     func showLoadingIndicator() {
        DispatchQueue.main.async {
            self.indicator.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
            self.indicator.center = scenedelegate!.window!.center
            scenedelegate?.window?.addSubview(self.indicator)
            
            self.indicator.startAnimating()
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            self.indicator.stopAnimating()
        }
    }
    
    func showToast(_ message: String) {
        scenedelegate?.window?.rootViewController?.view.makeToast(message)
    }

}
