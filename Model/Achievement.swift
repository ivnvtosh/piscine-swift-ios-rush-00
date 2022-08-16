//
//  Achievement.swift
//  FindPeer
//
//  Created by Anton Ivanov on 29.07.2022.
//

import Foundation

//     MARK: - Achievements
struct Achievement: Decodable {
	let id: Int?
	let name: String?
	let description: String?
	let tier: String?
	let kind: String?
	let isVisible: Bool?
	let image: String?
	let nbrOfSuccess: Int?
	let usersURL: String?

	enum CodingKeys: String, CodingKey {
		case id
		case name
		case description
		case tier
		case kind
		case isVisible = "visible"
		case image
		case nbrOfSuccess = "nbr_of_success"
		case usersURL = "users_url"

	}

}

typealias Achievements = [Achievement]

