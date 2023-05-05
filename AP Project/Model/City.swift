import Foundation

struct City: Hashable, Codable, Identifiable {
    var id: Int
    let city: String
    let latitude: Double
    let province: String
    let populationUrban: Int
    let populationProper: Int
    let imageURL: String
}
