//
//  Date+Extension.swift
//  SwiftExtensions
//
//  Created by Rasid Ramazanov on 30.12.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation

public extension Date {
    /// Returns string with RFC3339 format.
    func stringRFC3339DateFormatted() -> String {
        DateFormatter.RFC3339DateFormatter().string(from: self)
    }
}

public extension String {
    /// Returns date with RFC3339 format.
    /// Explained in https://developer.apple.com/documentation/foundation/dateformatter
    func dateRFC3339DateFormatted() -> Date? {
        DateFormatter.RFC3339DateFormatter().date(from: self)
    }
}

public extension DateFormatter {

    /// Returns date formatter with RFC3339 format.
    /// Explained in https://developer.apple.com/documentation/foundation/dateformatter
    static func RFC3339DateFormatter() -> DateFormatter {
        let rfc3339DateFormatter = DateFormatter()
        rfc3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
        rfc3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        rfc3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return rfc3339DateFormatter
    }
}

public extension Date {
    /// Returns start of a component. Eg, first day of month.
    func getStart(of component: Calendar.Component, calendar: Calendar = Calendar.app) -> Date? {
        calendar.dateInterval(of: component, for: self)?.start
    }

    /// Returns end of a component. Eg, last day of month.
    func getEnd(of component: Calendar.Component, calendar: Calendar = Calendar.app) -> Date? {
        calendar.dateInterval(of: component, for: self)?.end
    }
}

public extension Date {
    /// Returns all days in a month for day.
    func daysOfMonth(calendar: Calendar = Calendar.app, _ body: (Date) throws -> Void) rethrows {
        guard let startDate = calendar.dateInterval(of: .month, for: self)?.start,
              let endDate = calendar.dateInterval(of: .month, for: self)?.end else {
            return
        }
        try Date.daysBetween(startDate: startDate, endDate: endDate, calendar: calendar, body)
    }

    /// Returns days between the range
    static func daysBetween(
        startDate: Date, endDate: Date, calendar: Calendar = Calendar.app, _ body: (Date) throws -> Void
    ) rethrows {
        try body(startDate)

        let midnightComponents = DateComponents(hour: 0, minute: 0, second: 0)
        Calendar.app.enumerateDates(
            startingAfter: startDate, matching: midnightComponents, matchingPolicy: .nextTime
        ) { date, _, stop in
            guard let date = date else { return }
            guard date < endDate else {
                stop = true
                return
            }
            do { try body(date) }
            catch {}
        }
    }

    enum Weekday: Int {
        case sunday = 1, monday, tuesday, wednesday, thurthday, friday, saturday
    }

    /// Get date matching specified weekday on  the nth week of the month.
    func getDate(nthWeek: Int, weekday: Weekday, calendar: Calendar = Calendar.app) -> Date? {
        var component = DateComponents()
        component.weekdayOrdinal = nthWeek
        component.month = calendar.component(.month, from: self)
        component.year = calendar.component(.year, from: self)
        component.weekday = weekday.rawValue
        return calendar.date(from: component)
    }

    /// Get dates on the nth week of the month.
    func getDates(nthWeek: Int, calendar: Calendar = Calendar.app) -> [Date]? {
        guard var firstMonday = getDate(nthWeek: nthWeek, weekday: .monday, calendar: calendar),
              let firstSunday = getDate(nthWeek: nthWeek, weekday: .sunday, calendar: calendar)
        else { return nil }
        // If first monday is less than sunday, previous monday will be last monday of the previous month.
        if firstMonday > firstSunday,
           let previousMonday = getDate(nthWeek: nthWeek - 1, weekday: .monday, calendar: calendar) {
            firstMonday = previousMonday
        }
        var dates: [Date] = []
        Date.daysBetween(startDate: firstMonday, endDate: firstSunday, calendar: calendar) { date in
            dates.append(date)
        }
        dates.append(firstSunday)
        return dates
    }

    /// Returns date's number of weeks.
    func numberOfWeeksInMonth(calendar: Calendar = Calendar.app) -> Int? {
        calendar.range(of: .weekOfMonth, in: .month, for: self)?.count
    }

    /// 0 based week index of the date.
    func weekIndexInMonth(calendar: Calendar = Calendar.app) -> Int {
        calendar.component(.weekOfMonth, from: self) - 1
    }
}
