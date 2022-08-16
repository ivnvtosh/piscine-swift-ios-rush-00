//
//  Campus.swift
//  FindPeer
//
//  Created by Anton Ivanov on 29.07.2022.
//

import Foundation

//     MARK: - Campus
struct Campus: Decodable {
	let id: Int?
	let name: String?
	let timeZone: String?
	let language: Language
	let usersCount: Int?
	let vogsphereId: Int?
	let country: String?
	let address: String?
	let zip: String?
	let city: String?
	let website: String?
	let facebook: String?
	let twitter: String?
	let isActive: Bool?
	let isPublic: Bool?
	let emailExtension: String?
	let isDefaultHiddenPhone: Bool?

	enum CodingKeys: String, CodingKey {
		case id
		case name
		case timeZone = "time_zone"
		case language
		case usersCount = "users_count"
		case vogsphereId = "vogsphere_id"
		case country
		case address
		case zip
		case city
		case website
		case facebook
		case twitter
		case isActive = "active"
		case isPublic = "public"
		case emailExtension = "email_extension"
		case isDefaultHiddenPhone = "default_hidden_phone"

	}

}

typealias Campuses = [Campus]

