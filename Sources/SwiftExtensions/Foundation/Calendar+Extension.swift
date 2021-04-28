//
//  Calendar+Extension.swift
//
//  Created by Samet Macit on 23.02.2021.
//  Copyright © 2021 Mobven. All rights reserved.
//

import Foundation

public extension Foundation.Calendar {
    static var app: Calendar {
        var calendar = Calendar.current
        calendar.firstWeekday = 0
        calendar.minimumDaysInFirstWeek = 1
        return calendar
    }

    // Get the last day of the current year
    static var lastDayOfYear: Date? {
        let year = current.component(.year, from: Date())
        return current.date(from: DateComponents(year: year, month: 12, day: 31))
    }
}
