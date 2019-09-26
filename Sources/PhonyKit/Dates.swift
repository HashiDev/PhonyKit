
public class Dates {
    var phony: Phony!
    
    private func yearsToSeconds(numberOfYears: Int) -> Double {
        return Double(numberOfYears * 365 * 24 * 3600)
    }
    
    private func daysToSeconds(numberOfDays: Int) -> Double {
        return Double(numberOfDays * 24 * 3600)
    }
    
    public func past(numberOfYears: Int = 1, refDate: Date = Date()) -> Date {
        var past = refDate.timeIntervalSince1970
        past -= Double.random(in: 0...self.yearsToSeconds(numberOfYears: numberOfYears))
        
        return Date(timeIntervalSince1970: past)
    }

    public func future(numberOfYears: Int = 1, refDate: Date = Date()) -> Date {
        return refDate.addingTimeInterval(Double.random(in: 0...self.yearsToSeconds(numberOfYears: numberOfYears)))
    }

    public func between(dateRange: ClosedRange<Date>) -> Date {
        return Date(timeIntervalSince1970: Double.random(in: dateRange.lowerBound.timeIntervalSince1970...dateRange.upperBound.timeIntervalSince1970))
    }

    public func recent(numberOfDays: Int = 1, refDate: Date = Date()) -> Date {
        return refDate.addingTimeInterval(-Double.random(in: 0...self.daysToSeconds(numberOfDays: numberOfDays)))
    }

    public func soon(numberOfDays: Int = 1, refDate: Date = Date()) -> Date {
        return refDate.addingTimeInterval(Double.random(in: 0...self.daysToSeconds(numberOfDays: numberOfDays)))
    }

    public func month(isAbbreviated: Bool = false) -> String {
        return isAbbreviated ? self.phony.definitions.monthsAbbreviated.randomElement()! : self.phony.definitions.months.randomElement()!
    }

    public func weekday(isAbbreviated: Bool = false) -> String {
        return isAbbreviated ? self.phony.definitions.weekdaysAbbreviated.randomElement()! : self.phony.definitions.weekdays.randomElement()!
    }
}
