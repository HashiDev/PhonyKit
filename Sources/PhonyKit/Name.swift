import Foundation

/// Name
public extension Phony {
    enum Gender {
        case male, female
    }

    /// Creates a gendered first name
    ///
    /// - Parameter gender: Optional gender
    /// - Returns: a gender-based first name
    func firstName(for gender: Gender? = nil) -> String {
        let gender = gender ?? self.gender()
        switch gender {
        case .male:
            return self.definitions.maleFirstName.randomElement()!
        case .female:
            return self.definitions.femaleFirstName.randomElement()!
        }
    }

    /// Creates a last name
    ///
    /// - Returns: a gender-based first name
    func lastName() -> String {
        self.definitions.lastName.randomElement()!
    }

    /// Creates a gendered full name
    ///
    /// - Parameter gender: Optional gender
    /// - Returns: a gender-based full name
    func fullName(for gender: Gender? = nil) -> String {
        let gender = gender ?? self.gender()
        return "\(self.firstName(for: gender)) \(self.lastName())"
    }

    /// Function that returns a full name
    ///
    /// - Parameters:
    ///   - firstName: Optional first name
    ///   - lastName: Optional last name
    ///   - gender: Optional gender
    /// - Returns: A fake full name
    func findName(for firstName: String? = nil, or lastName: String? = nil, andOr gender: Gender? = nil) -> String {
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

    /// Creates a job title.
    ///
    /// - Returns: A randomized job title string.
    func jobTitle() -> String {
        "\(self.jobDescriptor()) \(self.jobArea()) \(self.jobType())"
    }
    /// Creates a gender.
    ///
    /// - Returns: a gender enum
    func gender() -> Gender {
        [Gender.male, Gender.female].randomElement()!
    }

    /// Creates a name prefix based on gender.
    ///
    /// - Parameters:
    ///   - gender: Gender enum, defaults to `.male`
    ///
    /// - Returns: A String gendered name prefix
    func prefix(for gender: Gender = .male) -> String {
        switch gender {
        case .male:
            return self.definitions.maleNamePrefix.randomElement()!
        default:
            return self.definitions.femaleNamePrefix.randomElement()!
        }
    }

    /// Creates a name suffix based on gender.
    ///
    /// - Parameters:
    ///   - gender: Gender enum, defaults to `.male`
    ///
    /// - Returns: A String gendered name suffix
    func suffix(for gender: Gender = .male) -> String {
        switch gender {
        case .male:
            return self.definitions.maleNameSuffix.randomElement()!
        default:
            return self.definitions.femaleNameSuffix.randomElement()!
        }
    }

    /// Returns a random job description String.
    ///
    /// - Returns: a job descriptor String
    func jobDescriptor() -> String {
        self.definitions.titleDecriptor.randomElement()!
    }

    /// Returns a random job area String.
    ///
    /// - Returns: a job area String
    func jobArea() -> String {
        self.definitions.titleLevel.randomElement()!
    }

    /// Returns a random job type String.
    ///
    /// - Returns: a job type String
    func jobType() -> String {
        self.definitions.titleJob.randomElement()!
    }
}
