//
//  Date+Ext.swift
//  LiveEventsApp
//
//  Created by meekam okeke on 7/24/21.
//

import Foundation

extension Date {
    func convertToDayMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy \nh:mm a"
        return dateFormatter.string(from: self)
    }
}
