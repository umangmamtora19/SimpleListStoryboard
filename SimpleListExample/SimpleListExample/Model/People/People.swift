//
//	People.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

class People{

	var avatar : String!
	var createdAt : String!
	var email : String!
	var favouriteColor : String!
	var firstName : String!
	var fromName : String!
	var id : String!
	var jobtitle : String!
	var lastName : String!
	var name : String!
	var size : String!
	var to : String!
	var type : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		avatar = dictionary["avatar"] as? String
		createdAt = dictionary["createdAt"] as? String
		email = dictionary["email"] as? String
		favouriteColor = dictionary["favouriteColor"] as? String
		firstName = dictionary["firstName"] as? String
		fromName = dictionary["fromName"] as? String
		id = dictionary["id"] as? String
		jobtitle = dictionary["jobtitle"] as? String
		lastName = dictionary["lastName"] as? String
		name = dictionary["name"] as? String
		size = dictionary["size"] as? String
		to = dictionary["to"] as? String
		type = dictionary["type"] as? String
	}

}
