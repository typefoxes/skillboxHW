import Foundation
import RealmSwift

class MorteyDataAll: Object, Codable {
    var results: List<MorteyData> = List()
}

class MorteyData: Object, Codable {
    @objc dynamic var name = ""
    @objc dynamic var status = ""
    @objc dynamic var species = ""
    @objc dynamic var gender = ""
    @objc dynamic var location = Location()
    @objc dynamic var image = ""
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case status = "status"
        case species = "species"
        case gender = "gender"
        case location = "location"
        case image = "image"
    }
}

class Location: Object, Codable {
    @objc dynamic var name: String? = ""

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

    
class saveIt: Object, Codable {
    @objc dynamic var name = String()
    @objc dynamic var status = String()
    @objc dynamic var species = String()
    @objc dynamic var gender = String()
    @objc dynamic var location = String()
    @objc dynamic var image = String()
    
    enum CodingKeys: String, CodingKey {
     case name = "name"
     case status = "status"
     case species = "species"
     case gender = "gender"
     case location = "location"
     case image = "image"
        }
}
