//
//  Skill.swift
//  FindPeer
//
//  Created by Anton Ivanov on 29.07.2022.
//

import Foundation

//     MARK: - Skill
struct Skill: Decodable {
	let id: Int?
	let name: String?
	let level: Float?

	enum CodingKeys: String, CodingKey {
		case id
		case name
		case level

	}

}

typealias Skills = [Skill]

