
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
   // @objc dynamic var location = Location()
    @objc dynamic var image = ""
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case status = "status"
        case species = "species"
        case gender = "gender"
      //  case location = "location"
        case image = "image"
    }
}

//class Location: Object, Codable {
//    @objc dynamic var name: String? = ""
//
//    enum CodingKeys: String, CodingKey {
//        case name = "name"
//    }
//}


