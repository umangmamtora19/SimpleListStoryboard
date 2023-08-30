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
            // Resolved : stop using force-wrap
            guard let window = scenedelegate?.window else { return }
            self.indicator.center = window.center
            window.addSubview(self.indicator)
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
    
    // Resolved : Moved print function from constant
    //  This is a common function to print anything in debug, in release we can comment to print inside function
    func appPrint(_ data: Any) {
        print(data)
    }
    
}
