//
//  Event.swift
//  Rush00
//
//  Created by Сергей Хмизюк on 16.08.2022.
//

import Foundation

//struct Event {
//
//    let title: String
//    let description: String
//
//    static var allEvents: [Event] = [
//        Event(title: "test", description: "test"),
//        Event(title: "test", description: "test"),
//        Event(title: "test", description: "test"),
//        Event(title: "test", description: "test"),
//        Event(title: "test", description: "test"),
//        Event(title: "test", description: "test"),
//        Event(title: "test", description: "test"),
//        Event(title: "test", description: "test"),
//        Event(title: "test", description: "test"),
//        Event(title: "test", description: "test"),
//        Event(title: "test", description: "test"),
//        Event(title: "test", description: "test"),
//        Event(title: "test", description: "test"),
//        Event(title: "test", description: "test")
//    ]
//}
//

//     MARK: - Event
struct Event: Decodable {
    
    static var allEvents: [Event] = []
    
	let id: Int?
	let name: String?
	let descriptionEvent: String?
	let location: String?
	let kind: String?
	let maxPeople: Int?
	let nbrSubscribers: Int?
	let beginAt: String?
	let endAt: String?
	let campusIds: [Int]?
	let cursusIds: [Int]?
	let createdAt: String?
	let updatedAt: String?
//	let prohibitionOfCancellation: null
	let waitlist: Waitlist?
//	let themes: []

	enum CodingKeys: String, CodingKey {
		case id
		case name
		case descriptionEvent = "description"
		case location
		case kind
		case maxPeople = "max_people"
		case nbrSubscribers = "nbr_subscribers"
		case beginAt = "begin_at"
		case endAt = "end_at"
		case campusIds = "campus_ids"
		case cursusIds = "cursus_ids"
		case createdAt = "created_at"
		case updatedAt = "updated_at"
//		case prohibitionOfCancellation = "prohibition_of_cancellation
		case waitlist
//		case themes

	}

}

typealias Events = [Event]

extension Event: CustomStringConvertible {

	var description: String {
		return "id                        : \(String(describing: self.id))\n" +
			   "name                      : \(String(describing: self.name))\n" +
			   "descriptionEvent          : \(String(describing: self.descriptionEvent))\n" +
			   "location                  : \(String(describing: self.location))\n" +
			   "kind                      : \(String(describing: self.kind))\n" +
			   "maxPeople                 : \(String(describing: self.maxPeople))\n" +
			   "nbrSubscribers            : \(String(describing: self.nbrSubscribers))\n" +
			   "beginAt                   : \(String(describing: self.beginAt))\n" +
			   "endAt                     : \(String(describing: self.endAt))\n" +
			   "campusIds                 : \(String(describing: self.campusIds))\n" +
			   "cursusIds                 : \(String(describing: self.cursusIds))\n" +
			   "createdAt                 : \(String(describing: self.createdAt))\n" +
			   "updatedAt                 : \(String(describing: self.updatedAt))\n" +
//			   "prohibitionOfCancellation : \(String(describing: self.prohibitionOfCancellation))\n" +
			   "waitlist                  : \(String(describing: self.waitlist))\n"
//			   "themes                    : \(String(describing: self.themes))\n" +
	}

}

