//
//  CommonUtility.swift
//  SimpleListExample
//
//  Created by Umang on 28/06/23.
//

import UIKit
import Toast

//  This is sigleton class for general purpose in app
class CommonUtility {
    static let shared = CommonUtility()
    private let indicator = UIActivityIndicatorView()
    
//    This is common function to show loading indicator in thoughout the app
    func showLoadingIndicator() {
        DispatchQueue.main.async {
            self.indicator.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
            self.indicator.center = scenedelegate!.window!.center
            scenedelegate?.window?.addSubview(self.indicator)
            
            self.indicator.startAnimating()
        }
    }

//    This is common function to hide loading indicator from thoughout the app
    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            self.indicator.stopAnimating()
        }
    }
    
//    This is common function to show any toast message
    func showToast(_ message: String) {
        scenedelegate?.window?.rootViewController?.view.makeToast(message)
    }
    
}
