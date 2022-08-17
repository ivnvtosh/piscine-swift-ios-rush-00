//
//  CursusUser.swift
//  FindPeer
//
//  Created by Anton Ivanov on 29.07.2022.
//

import Foundation

//     MARK: - CursUser
struct CursUser: Decodable {
	let grage: String?
	let level: Float?
	let skills: Skills
	let blackholedAt: String?
	let id: Int?
	let beginAt: String?
	let endAt: String?
	let cursusId: Int?
	let hasCoalition: Bool?
	let createdAt: String?
	let updatedAt: String?
	let user: User
	let curs: Curs

	enum CodingKeys: String, CodingKey {
		case grage
		case level
		case skills
		case blackholedAt = "blackholed_at"
		case id
		case beginAt = "begin_at"
		case endAt = "end_at"
		case cursusId = "cursus_id"
		case hasCoalition = "has_coalition"
		case createdAt = "created_at"
		case updatedAt = "updated_at"
		case user
		case curs = "cursus"

	}

}

typealias CursusUser = [CursUser]
