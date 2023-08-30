//
//	People.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
  
//  Resolved: Removed unnecessary CodeingKey
struct People : Codable {

    let avatar : String?
    let createdAt : String?
    let email : String?
    let favouriteColor : String?
    let firstName : String?
    let fromName : String?
    let id : String?
    let jobtitle : String?
    let lastName : String?
    let name : String?
    let size : String?
    let to : String?
    let type : String?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        favouriteColor = try values.decodeIfPresent(String.self, forKey: .favouriteColor)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        fromName = try values.decodeIfPresent(String.self, forKey: .fromName)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        jobtitle = try values.decodeIfPresent(String.self, forKey: .jobtitle)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        size = try values.decodeIfPresent(String.self, forKey: .size)
        to = try values.decodeIfPresent(String.self, forKey: .to)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }

}
