//
//  String+Exatension.swift
//  SimpleListExample
//
//  Created by Umang on 29/08/23.
//

import Foundation

extension String {
//    This is common function to convert specific date string to other
    func toDate(fromFormat: String, toFormat: String) -> Self {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat
        let dateFormatterTo = DateFormatter()
        dateFormatterTo.dateFormat = toFormat
        if let date: Date = dateFormatter.date(from: self) as Date? {
            let strDate = dateFormatterTo.string(from: date as Date)
            return strDate
        }
        return "nil"
    }
}
