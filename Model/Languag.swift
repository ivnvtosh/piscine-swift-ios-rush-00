//
//  Languag.swift
//  FindPeer
//
//  Created by Anton Ivanov on 29.07.2022.
//

import Foundation

//     MARK: - Language
struct Language: Decodable {
	let id: Int?
	let name: String?
	let identifier: String?
	let createdAt: String?
	let updatedAt: String?

	enum CodingKeys: String, CodingKey {
		case id
		case name
		case identifier
		case createdAt = "created_at"
		case updatedAt = "updated_at"

	}

}

typealias Languages = [Language]

