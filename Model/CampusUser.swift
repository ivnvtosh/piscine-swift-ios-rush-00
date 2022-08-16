//
//  CampusUser.swift
//  FindPeer
//
//  Created by Anton Ivanov on 30.07.2022.
//

import Foundation

//     MARK: - CampusUser
struct CampusUser: Decodable {
	let id: Int?
	let userId: Int?
	let campusId: Int?
	let isPrimary: Bool?
	let createdAt: String?
	let updatedAt: String?

	enum CodingKeys: String, CodingKey {
		case id
		case userId = "user_id"
		case campusId = "campus_id"
		case isPrimary = "is_primary"
		case createdAt = "created_at"
		case updatedAt = "updated_at"

	}

}

typealias CampusesUser = [CampusUser]

