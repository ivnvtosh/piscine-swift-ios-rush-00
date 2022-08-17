//
//  Service.swift
//  Rush00
//
//  Created by Anton Ivanov on 16.08.2022.
//

import Foundation


//   MARK: - API42Error
private enum API42Error: Error {

	case invalidURL
	case noData
	case failedToDecode(String)
	case invalidRequest

}


//      MARK: - API42Type
private enum API42Type {

	case v2Me
	case v2UsersUserIdEvents(Int)

	case oauthTokenInfo
	case oauthToken(String)
	case oauthAuthorize

	private var uid: String {
		return "9a335f9166cbc3de28c99b211113646e9fa1c637145037542f5ff56b210518f2"
	}

	private var secret: String {
		return "d084c222c677d5e48c06a439576873c86675dfb8a4c03d827e86d2c37de42e19"
	}

	private var baseURL: String {
		return "https://api.intra.42.fr/"
	}

	private var redirectURI: String {
		return "https://profile.intra.42.fr"
	}

	private var path: String {
		switch self {
		case .v2Me:
			return "v2/me"
		case .v2UsersUserIdEvents(let userId):
			return "/v2/users/\(userId)/events"
		case .oauthTokenInfo:
			return "oauth/token/info"
		case .oauthToken:
			return "oauth/token"
		case .oauthAuthorize:
			return "oauth/authorize"
		}
	}

	private var headers: [String : String]? {
		switch self {
		case .oauthToken:
			return ["Content-Type" : "application/json"]
		case .oauthAuthorize:
			return ["Content-Type" : "application/json"]
		default:
			guard let accessToken = API42Manager.shared.accessToken else {
				return nil
			}

			return ["Authorization" : "Bearer \(accessToken)"]
		}
	}

	private var parametrs: Parametrs? {
		switch self {
		case .oauthToken(let code):
			return ["grant_type"    : "authorization_code",
					"client_id"     : "\(uid)",
					"client_secret" : "\(secret)",
					"code"          : "\(code)",
					"redirect_uri"  : "\(redirectURI)",
//					"state"         : "a_very_long_random_string_witchmust_be_unguessable",
				   ]
		case .oauthAuthorize:
			return ["client_id"     : "\(uid)",
					"response_type" : "code",
					"redirect_uri"  : "\(redirectURI)",
//					"scope"			: "public",
//					"state"         : "a_very_long_random_string_witchmust_be_unguessable",
				   ]
		default:
			return nil
		}
	}

	private var method: String {
		switch self {
		case .v2Me:
			return "GET"
		case .v2UsersUserIdEvents:
			return "GET"
		case .oauthTokenInfo:
			return "GET"
		case .oauthToken:
			return "POST"
		case .oauthAuthorize:
			return "GET"
		}
	}

	public var request: URLRequest? {
		guard let baseURL = URL(string: baseURL) else {
			return nil
		}

		guard let url = URL(string: path, relativeTo: baseURL) else {
			return nil
		}

		var request = URLRequest(url: url)

		request.httpMethod = method

		if let headers = headers {
			request.allHTTPHeaderFields = headers
		}

		if let parametrs = parametrs {
			request.httpBody = try? JSONSerialization.data(withJSONObject: parametrs)
		}

		return request
	}

}


//    MARK: - API42Manager
class API42Manager {

	static let shared = API42Manager()

	public var accessToken: String?

	private func executeRequest<T: Decodable>(with type: API42Type, completion: @escaping (T?, Error?) -> Void) {
		guard let request = type.request else {
			completion(nil, API42Error.invalidRequest)
			return
		}

		URLSession.shared.dataTask(with: request) { data, response, error in
			if let error = error {
				completion(nil, error)
			}

			guard let data = data else {
				completion(nil, API42Error.noData)
				return
			}

			guard let object = try? JSONDecoder().decode(T.self, from: data) else {
				completion(nil, API42Error.failedToDecode(String(data: data, encoding: .utf8) ?? "Unknown encoding"))
				return
			}

			completion(object, nil)
		}.resume()
	}

	public func getMe(completion: @escaping (Profile?, Error?) -> Void)  {
		executeRequest(with: API42Type.v2Me, completion: completion)
	}

	public func getEvents(userId: Int, completion: @escaping (Events?, Error?) -> Void) {
		executeRequest(with: API42Type.v2UsersUserIdEvents(userId), completion: completion)
	}

	public func getTokenInfo(completion: @escaping (TokenInfo?, Error?) -> Void) {
		executeRequest(with: API42Type.oauthTokenInfo, completion: completion)
	}

	public func getToken(code: String, completion: @escaping (Token?, Error?) -> Void) {
		executeRequest(with: API42Type.oauthToken(code), completion: completion)
	}

	public func getCode(completion: @escaping (URLRequest?, Error?) -> Void) {
		guard let url = URL(string: "https://api.intra.42.fr/" +
									"oauth/authorize" +
									"?client_id=9a335f9166cbc3de28c99b211113646e9fa1c637145037542f5ff56b210518f2" +
									"&redirect_uri=https://profile.intra.42.fr" +
									"&response_type=code") else {
			return
		}

		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		completion(request, nil)

//		guard let request = API42Type.oauthAuthorize.request else {
//			completion(nil, API42Error.invalidRequest)
//			return
//		}
//
//		completion(request, nil)
	}

}


typealias Parametrs = [String : String]

