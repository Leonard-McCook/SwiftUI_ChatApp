//
//  DateHelper.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 2/12/23.
//

import Foundation

class DateHelper {
    
    static func chatTimestampFrom(date: Date) -> String {
        
        let df = DateFormatter()
        df.dateFormat = "h:mm a"
        
        return df.string(from: date)
    }
}
