import Foundation

//Dates

public extension Phony {
    
    private func yearsToSeconds(numberOfYears: Int) -> Double {
        return Double(numberOfYears * 365 * 24 * 3600)
    }
    
    private func daysToSeconds(numberOfDays: Int) -> Double {
        return Double(numberOfDays * 24 * 3600)
    }
    
    func past(numberOfYears: Int = 1, refDate: Date = Date()) -> Date {
        var past = refDate.timeIntervalSince1970
        past -= Double.random(in: 0...self.yearsToSeconds(numberOfYears: numberOfYears))
        
        return Date(timeIntervalSince1970: past)
    }

    func future(numberOfYears: Int = 1, refDate: Date = Date()) -> Date {
        return refDate.addingTimeInterval(Double.random(in: 0...self.yearsToSeconds(numberOfYears: numberOfYears)))
    }

    func between(dateRange: ClosedRange<Date>) -> Date {
        return Date(timeIntervalSince1970: Double.random(in: dateRange.lowerBound.timeIntervalSince1970...dateRange.upperBound.timeIntervalSince1970))
    }

    func recent(numberOfDays: Int = 1, refDate: Date = Date()) -> Date {
        return refDate.addingTimeInterval(-Double.random(in: 0...self.daysToSeconds(numberOfDays: numberOfDays)))
    }

    func soon(numberOfDays: Int = 1, refDate: Date = Date()) -> Date {
        return refDate.addingTimeInterval(Double.random(in: 0...self.daysToSeconds(numberOfDays: numberOfDays)))
    }

    func month(isAbbreviated: Bool = false) -> String {
        return isAbbreviated ? self.definitions.monthsAbbreviated.randomElement()! : self.definitions.months.randomElement()!
    }

    func weekday(isAbbreviated: Bool = false) -> String {
        return isAbbreviated ? self.definitions.weekdaysAbbreviated.randomElement()! : self.definitions.weekdays.randomElement()!
    }
}
