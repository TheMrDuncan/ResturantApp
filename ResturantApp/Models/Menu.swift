// MARK: Menu structure

struct MenuItem: Codable, Hashable {
    let itemName: String
    let imageName: String
    let iconName: String?
    let itemDescription: String?
    let price: Double
    let rating: Int
}

struct Menu: Codable, Hashable {
    let name: String
    let menuItems: [MenuItem]
}
