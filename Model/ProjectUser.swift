//
//  ProjectUser.swift
//  FindPeer
//
//  Created by Anton Ivanov on 29.07.2022.
//

import Foundation

//     MARK: - ProjectUser
struct ProjectUser: Decodable {
	let id: Int?
	let occurrence: Int?
	let finalMark: Int?
	let status: String?
	let isValidated: Bool?
	let currentTeamId: Int?
	let project: Project
	let cursusIds: [Int]?
	let markedAt: String?
	let isMarked: Bool?
	let retriableAt: String?
	let createdAt: String?
	let updatedAt: String?

	enum CodingKeys: String, CodingKey {
		case id
		case occurrence
		case finalMark = "final_mark"
		case status
		case isValidated = "validated"
		case currentTeamId = "current_team_id"
		case project
		case cursusIds = "cursus_ids"
		case markedAt = "marked_at"
		case isMarked = "marked"
		case retriableAt = "retriable_at"
		case createdAt = "created_at"
		case updatedAt = "updated_at"

	}

}

typealias ProjectsUser = [ProjectUser]

