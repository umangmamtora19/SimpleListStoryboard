//
//	Room.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class Room{

	var createdAt : String!
	var id : String!
	var isOccupied : Bool!
	var maxOccupancy : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		createdAt = dictionary["createdAt"] as? String
		id = dictionary["id"] as? String
		isOccupied = dictionary["isOccupied"] as? Bool
		maxOccupancy = dictionary["maxOccupancy"] as? Int
	}

}
