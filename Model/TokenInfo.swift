//
//  TokenInfo.swift
//  FindPeer
//
//  Created by Anton Ivanov on 29.07.2022.
//

import Foundation

//     MARK: - TokenInfo
struct TokenInfo: Decodable {
	let resourceOwnerId: Int?
	let scopes: [String]?
	let expiresInSeconds: Int?
	let application: Application?
	let createdAt: Int?

	enum CodingKeys: String, CodingKey {
		case resourceOwnerId = "resource_owner_id"
		case scopes
		case expiresInSeconds = "expires_in_seconds"
		case application
		case createdAt = "created_at"
	}

}

// MARK: - Application
struct Application: Decodable {
	let uid: String?

	enum CodingKeys: String, CodingKey {
		case uid

	}

}

