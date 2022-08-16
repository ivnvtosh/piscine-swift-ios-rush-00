//
//  UserAll.swift
//  FindPeer
//
//  Created by Anton Ivanov on 30.07.2022.
//

import Foundation

//     MARK: - Profile
struct Profile: Decodable {
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
//	let groups
	let cursusUser: CursusUser
	let projectsUser: ProjectsUser
	let languagesUser: LanguagesUser
	let achievements: Achievements
//	let titles
//	let titlesUser
//	let partnerships
//	let patroned
//	let patroning
	let expertisesUser: ExpertisesUser
//	let roles
	let campuses: Campuses
	let campusesUser: CampusesUser
//
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
//		case groups
		case cursusUser = "cursus_users"
		case projectsUser = "projects_users"
		case languagesUser = "languages_users"
		case achievements
//		case titles
//		case titlesUser = "titles_users"
//		case partnerships
//		case patroned
//		case patroning
		case expertisesUser = "expertises_users"
//		case roles
		case campuses = "campus"
		case campusesUser = "campus_users"

	}

}
