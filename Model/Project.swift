//
//  Project.swift
//  FindPeer
//
//  Created by Anton Ivanov on 29.07.2022.
//

import Foundation

//     MARK: - Project
struct Project: Decodable {
	let id: Int?
	let name: String?
	let slug: String?
	let parentId: Int?

	enum CodingKeys: String, CodingKey {
		case id
		case name
		case slug
		case parentId = "parent_id"

	}

}

typealias Projects = [Project]

