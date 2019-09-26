
public class Name {
    public enum Gender {
        case male, female
    }

    var phony: Phony!

    /// Creates a genderized first name
    ///
    /// - Parameter gender: Optional gender
    /// - Returns: a gender-based first name
    public func firstName(for gender: Name.Gender = .male) -> String {
        switch gender {
        case .male:
            return self.phony.definitions.maleFirstName.randomElement()!
        case .female:
            return self.phony.definitions.femaleFirstName.randomElement()!
        }
    }

    /// Creates a last name
    ///
    /// - Returns: a gender-based first name
    public func lastName() -> String {
        return self.phony.definitions.lastName.randomElement()!
    }

    /// Function that returns a full name
    ///
    /// - Parameters:
    ///   - firstName: Optional first name
    ///   - lastName: Optional last name
    ///   - gender: Optional gender
    /// - Returns: A fake full name
    public func findName(for firstName: String? = nil, or lastName: String? = nil, andOr gender: Gender? = nil) -> String {
        let gender = gender ?? self.gender()
        let firstName = firstName ?? self.firstName(for: gender)
        let lastName = lastName ?? self.lastName()

        switch Int.random(in: 0...8) {
        case 0:
            return "\(self.prefix(for: gender)) \(firstName) \(lastName)"
        case 1:
            return "\(firstName) \(lastName) \(self.suffix(for: gender))"
        default:
            return "\(firstName) \(lastName)"
        }
    }

    public func jobTitle() -> String {
        return "\(self.jobDescriptor()) \(self.jobArea()) \(self.jobType())"
    }

    public func gender() -> Gender {
        return [Gender.male, Gender.female].randomElement()!
    }

    public func prefix(for gender: Gender = .male) -> String {
        switch gender {
        case .male:
            return self.phony.definitions.maleNamePrefix.randomElement()!
        default:
            return self.phony.definitions.femaleNamePrefix.randomElement()!
        }
    }

    public func suffix(for gender: Gender = .male) -> String {
        switch gender {
        case .male:
            return self.phony.definitions.maleNameSuffix.randomElement()!
        default:
            return self.phony.definitions.femaleNameSuffix.randomElement()!
        }
    }

    public func title() -> String {
        return "\(self.jobDescriptor()) \(self.jobArea()) \(self.jobType())"
    }

    public func jobDescriptor() -> String {
        return self.phony.definitions.titleDecriptor.randomElement()!
    }

    public func jobArea() -> String {
        return self.phony.definitions.titleLevel.randomElement()!
    }

    public func jobType() -> String {
        return self.phony.definitions.titleJob.randomElement()!
    }
}
