import Foundation

// Dates

public extension Phony {
    private func yearsToSeconds(numberOfYears: Int) -> Double {
        return Double(numberOfYears * 365 * 24 * 3600)
    }

    private func daysToSeconds(numberOfDays: Int) -> Double {
        return Double(numberOfDays * 24 * 3600)
    }

    /// This function returns a date sometime in the past, choosing a random timeframe using `numberOfYears` as a reference.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.past()) // Dec 4, 2014 at 11:07 AM
    ///     print(Phony.default.past(numberOfYears: 6)) // Nov 19, 2017 at 1:18 AM
    ///
    /// - Parameters:
    ///     - numberOfYears: an Int representing the number of years
    ///     - refDate: The date to add the time to.
    ///
    /// - Returns: A date in the past.
    func past(numberOfYears: Int = 1, refDate: Date = Date()) -> Date {
        var past = refDate.timeIntervalSince1970
        past -= Double.random(in: 0...self.yearsToSeconds(numberOfYears: numberOfYears))

        return Date(timeIntervalSince1970: past)
    }

    /// This function returns a date sometime in the future, choosing a random timeframe using `numberOfYears` as a reference.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.future()) // Dec 4, 2022 at 12:01 PM
    ///     print(Phony.default.future(numberOfYears: 6)) // Feb 20, 2025 at 11:18 AM
    ///
    /// - Parameters:
    ///     - numberOfYears: an Int representing the number of years
    ///     - refDate: The date to add the time to.
    ///
    /// - Returns: A date in the future.
    func future(numberOfYears: Int = 1, refDate: Date = Date()) -> Date {
        return refDate.addingTimeInterval(Double.random(in: 0...self.yearsToSeconds(numberOfYears: numberOfYears)))
    }
    /// This function returns a random date between a closed range of dates.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.past()...Phony.default.future()) // Dec 4, 2021 at 12:01 PM
    ///
    /// - Parameter dateRange: A closed range of dates
    ///
    /// - Returns: A date picked inside the closed range.
    func between(dateRange: ClosedRange<Date>) -> Date {
        return Date(timeIntervalSince1970: Double.random(in: dateRange.lowerBound.timeIntervalSince1970...dateRange.upperBound.timeIntervalSince1970))
    }

    /// This function returns a date sometime in the recent past, choosing a random timeframe using `numberOfDays` as a reference.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.recent()) // Dec 3, 2021 at 11:07 AM
    ///     print(Phony.default.recent(numberOfDays: 6)) // Dec 1, 2021 at 11:07 AM
    ///
    /// - Parameters:
    ///     - numberOfDays: an Int representing the number of days
    ///     - refDate: The date to add the time to.
    ///
    /// - Returns: A date in the recent past.
    func recent(numberOfDays: Int = 1, refDate: Date = Date()) -> Date {
        return refDate.addingTimeInterval(-Double.random(in: 0...self.daysToSeconds(numberOfDays: numberOfDays)))
    }

    /// This function returns a date sometime in the near future, choosing a random timeframe using `numberOfDays` as a reference.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.recent()) // Dec 5, 2021 at 11:07 AM
    ///     print(Phony.default.recent(numberOfDays: 6)) // Dec 11, 2021 at 11:07 AM
    ///
    /// - Parameters:
    ///     - numberOfDays: an Int representing the number of days
    ///     - refDate: The date to add the time to.
    ///
    /// - Returns: A date in the near future.
    func soon(numberOfDays: Int = 1, refDate: Date = Date()) -> Date {
        return refDate.addingTimeInterval(Double.random(in: 0...self.daysToSeconds(numberOfDays: numberOfDays)))
    }

    /// This function returns a random month string.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.month(isAbbreviated: true)) // Mar
    ///     print(Phony.default.month(isAbbreviated: false)) // March
    ///
    /// - Parameter isAbbreviated: Bool for indicating if you'd like the string abbreviated or not.
    /// - Returns: A string representing a random month.
    func month(isAbbreviated: Bool = false) -> String {
        return isAbbreviated ? self.definitions.monthsAbbreviated.randomElement()! : self.definitions.months.randomElement()!
    }

    /// This function returns a random day of the week.
    ///
    /// Usage:
    ///
    ///     print(Phony.default.weekday(isAbbreviated: true)) // Mon
    ///     print(Phony.default.weekday(isAbbreviated: false)) // Monday
    ///
    /// - Parameter isAbbreviated: Bool for indicating if you'd like the string abbreviated or not.
    /// - Returns: A string representing a random day of the week.
    func weekday(isAbbreviated: Bool = false) -> String {
        return isAbbreviated ? self.definitions.weekdaysAbbreviated.randomElement()! : self.definitions.weekdays.randomElement()!
    }
}
