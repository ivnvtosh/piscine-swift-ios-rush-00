//
//  ExpertisUser.swift
//  FindPeer
//
//  Created by Anton Ivanov on 30.07.2022.
//

import Foundation

//     MARK: - ExpertisUser
struct ExpertisUser: Decodable {
	let id: Int?
	let expertiseId: Int?
	let isInterested: Bool?
	let value: Int?
	let isContactMe: Bool?
	let createdAt: String?
	let userId: Int?

	enum CodingKeys: String, CodingKey {
		case id
		case expertiseId = "expertise_id"
		case isInterested = "interested"
		case value
		case isContactMe = "contact_me"
		case createdAt = "created_at"
		case userId = "user_id"

	}

}

typealias ExpertisesUser = [ExpertisUser]

