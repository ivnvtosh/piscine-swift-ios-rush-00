//
//  LanguageUser.swift
//  FindPeer
//
//  Created by Anton Ivanov on 30.07.2022.
//

import Foundation

//     MARK: - LanguagUser
struct LanguagUser: Decodable {
	let id: Int?
	let languageId: Int?
	let userId: Int?
	let position: Int?
	let createdAt: String?

	enum CodingKeys: String, CodingKey {
		case id
		case languageId = "language_id"
		case userId = "user_id"
		case position
		case createdAt = "created_at"

	}

}

typealias LanguagesUser = [LanguagUser]

