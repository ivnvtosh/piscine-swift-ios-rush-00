//
//  Waitlist.swift
//  Rush-00-03
//
//  Created by Anton Ivanov on 16.08.2022.
//

import Foundation

//     MARK: - Waitlist
struct Waitlist: Decodable {
	let id: Int?
	let waitlistableId: Int?
	let waitlistableType: String?
	let createdAt: String?
	let updatedAt: String?

	enum CodingKeys: String, CodingKey {
		case id
		case waitlistableId = "waitlistable_id"
		case waitlistableType = "waitlistable_type"
		case createdAt = "created_at"
		case updatedAt = "updated_at"

	}

}

extension Waitlist: CustomStringConvertible {

	var description: String {
		return "id               : \(String(describing: self.id))\n" +
			   "waitlistableId   : \(String(describing: self.waitlistableId))\n" +
			   "waitlistableType : \(String(describing: self.waitlistableType))\n" +
			   "createdAt        : \(String(describing: self.createdAt))\n" +
			   "updatedAt        : \(String(describing: self.updatedAt))\n"
	}

}

