//
//  Cursus.swift
//  FindPeer
//
//  Created by Anton Ivanov on 29.07.2022.
//

import Foundation

//     MARK: - Curs
struct Curs: Decodable {
	let id: Int?
	let createdAt: String?
	let name: String?
	let slug: String?
	let kind: String?

	enum CodingKeys: String, CodingKey {
		case id
		case createdAt = "created_at"
		case name
		case slug
		case kind

	}

}

typealias Cursus = [Curs]

