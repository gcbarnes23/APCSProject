import Foundation

struct City: Hashable, Codable, Identifiable {
    var id: Int
    let city: String
    let latitude: String
    let province: String
    let populationUrban: String
    let populationProper: String
    let imageURL: String
}
