//
//  User.swift
//  FindPeer
//
//  Created by Anton Ivanov on 29.07.2022.
//

import Foundation

//     MARK: - User
struct User: Decodable {
	let id: Int?
	let email: String?
	let login: String?
	let firstName: String?
	let lastName: String?
	let usualFullName: String?
	let usualFirstName: String?
	let url: String?
	let phone: String?
	let displayname: String?
	let imageURL: String?
	let newImageURL: String?
	let isStaff: Bool?
	let correctionPoint: Int?
	let poolMonth: String?
	let poolYear: String?
	let location: String?
	let wallet: Int?
	let anonymizeDate: String?
	let dataErasureDate: String?
	let createdAt: String?
	let updatedAt: String?
	let alumnizedAt: String?
	let isAlumni: Bool?

	enum CodingKeys: String, CodingKey {
		case id
		case email
		case login
		case firstName = "first_name"
		case lastName = "last_name"
		case usualFullName = "usual_full_name"
		case usualFirstName = "usual_first_name"
		case url
		case phone
		case displayname
		case imageURL = "image_url"
		case newImageURL = "new_image_url"
		case isStaff = "staff"
		case correctionPoint = "correction_point"
		case poolMonth = "pool_month"
		case poolYear = "pool_year"
		case location
		case wallet
		case anonymizeDate = "anonymize_date"
		case dataErasureDate = "data_erasure_date"
		case createdAt = "created_at"
		case updatedAt = "updated_at"
		case alumnizedAt = "alumnized_at"
		case isAlumni = "alumni"

	}

}

typealias Users = [User]

