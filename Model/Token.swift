//
//  Token.swift
//  FindPeer
//
//  Created by Anton Ivanov on 29.07.2022.
//

import Foundation

//     MARK: - Token
struct Token: Decodable {
	let accessToken: String?
	let tokenType: String?
	let expiresIn: Int?
	let scope: String?
	let createdAt: Int?

	enum CodingKeys: String, CodingKey {
		case accessToken = "access_token"
		case tokenType = "token_type"
		case expiresIn = "expires_in"
		case scope
		case createdAt = "created_at"

	}

}

