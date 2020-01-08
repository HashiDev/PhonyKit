public class Phony {
    public static var `default`: Phony = Phony()

    public var address: Address
    public var commerce: Commerce
    public var company: Company
    public var date: Dates
    public var definitions: Definitions
    public var hacker: Hacker
    public var helpers: Helpers
    public var internet: Internet
    public var image: Images
    public var lorem: Lorem
    public var name: Name
    public var phoneNumber: PhoneNumber
    public var random: Random
    public var video: Video

    private init() {
        self.address = Address()
        self.commerce = Commerce()
        self.company = Company()
        self.date = Dates()
        self.definitions = Definitions()
        self.hacker = Hacker()
        self.helpers = Helpers()
        self.internet = Internet()
        self.image = Images()
        self.lorem = Lorem()
        self.name = Name()
        self.phoneNumber = PhoneNumber()
        self.random = Random()
        self.video = Video()

        self.address.phony = self
        self.commerce.phony = self
        self.company.phony = self
        self.date.phony = self
        self.hacker.phony = self
        self.helpers.phony = self
        self.internet.phony = self
        self.image.phony = self
        self.lorem.phony = self
        self.name.phony = self
        self.phoneNumber.phony = self
        self.random.phony = self
        self.video.phony = self
        self.definitions = DefaultDefinitions()
    }
}
