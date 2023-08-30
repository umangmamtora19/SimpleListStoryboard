//
//	Room.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
  
//  Resolved: Removed unnecessary CodeingKey
struct Room: Codable {
    var createdAt : String?
    var id : String?
    var isOccupied : Bool?
    var maxOccupancy : Int?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        isOccupied = try values.decodeIfPresent(Bool.self, forKey: .isOccupied)
        maxOccupancy = try values.decodeIfPresent(Int.self, forKey: .maxOccupancy)
    }
}
