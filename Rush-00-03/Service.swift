//
//  Service.swift
//  Rush00
//
//  Created by Anton Ivanov on 16.08.2022.
//

import Foundation

//   MARK: - ApiType
private enum ApiType {

	case v2Me
	case v2UsersUserIdEvents(Int)
	case tokenInfo
	case token(String)
	case code

	var baseURL: String {
		return "https://api.intra.42.fr/"
	}

	var path: String {
		switch self {
		case .v2Me:
			return "v2/me"
		case .v2UsersUserIdEvents(let userId):
			return "/v2/users/\(userId)/events"
		case .tokenInfo:
			return "oauth/token/info"
		case .token:
			return "oauth/token"
		case .code:
			return "oauth/authorize"
		}
	}

	var headers: [String : String] {
		switch self {
		case .token:
			return ["Content-Type" : "application/json"]
		case .code:
			return ["Content-Type" : "application/json"]
		default:
			guard let accessToken = ApiManager.shared.accessToken else {
				print("HEADERS WTF")
				return [ : ]
			}

			return ["Authorization" : "Bearer \(accessToken)"]
		}
	}

//	client_credentials
//	authorization_code

	var parametrs: [String: String] {
		switch self {
		case .token(let code):
			return ["grant_type"    : "authorization_code",
					"client_id"     : "\(ApiManager.shared.uid)",
					"client_secret" : "\(ApiManager.shared.secret)",
					"code"          : "\(code)",
					"redirect_uri"  : "https://api.intra.42.fr",
//					"state"         : ""
				   ]
		case .code:
			return [
					"client_id"     : "\(ApiManager.shared.uid)",
//					"client_secret" : "\(ApiManager.shared.secret)",
					"redirect_uri"  : "http%3A%2F%2Flocalhost%3A1919%2Fusers%2Fauth%2Fft%2Fcallback",
					"response_type" : "code",
					"scope"			: "public",
					"state"         : "a_very_long_random_string_witchmust_be_unguessable",
				   ]
		default:
			return [ : ]
		}
	}

	var method: String {
		switch self {
		case .v2Me:
			return "GET"
		case .v2UsersUserIdEvents:
			return "GET"
		case .tokenInfo:
			return "GET"
		case .token:
			return "POST"
		case .code:
			return "GET"
		}
	}

	var request: URLRequest? {
		let baseURL = URL(string: baseURL)

		guard let url = URL(string: path, relativeTo: baseURL) else {
			print("Invalid URL")
			return nil
		}

		var request = URLRequest(url: url)
		request.allHTTPHeaderFields = headers
		request.httpMethod = method

//		if let httpBody =  try? JSONSerialization.data(withJSONObject: parametrs) {
//			request.httpBody = httpBody
//		}

		return request
	}

}

//    MARK: - ApiManager
class ApiManager {

	static let shared = ApiManager()

	public let uid = "9a335f9166cbc3de28c99b211113646e9fa1c637145037542f5ff56b210518f2"
	public let secret = "d084c222c677d5e48c06a439576873c86675dfb8a4c03d827e86d2c37de42e19"

	public var accessToken: String?

	public func getMe(completion: @escaping (Profile?) -> Void)  {
		guard let request = ApiType.v2Me.request else {
			completion(nil)
			return
		}

		URLSession.shared.dataTask(with: request) { data, response, error in
			if let error = error {
				print(error)
				completion(nil)
			}

			guard let data = data else {
				print("No data available")
				completion(nil)
				return
			}

			if let profile = try? JSONDecoder().decode(Profile.self, from: data) {
				completion(profile)
			} else {
				print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
				completion(nil)
			}

		}.resume()
	}

	public func getEvents(userId: Int, completion: @escaping (Events?) -> Void) {
		guard let request = ApiType.v2UsersUserIdEvents(userId).request else {
			completion(nil)
			return
		}

		URLSession.shared.dataTask(with: request) { data, response, error in
			if let error = error {
				print(error)
				completion(nil)
			}

			guard let data = data else {
				print("No data available")
				completion(nil)
				return
			}

			if let profile = try? JSONDecoder().decode(Events.self, from: data) {
				completion(profile)
			} else {
				print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
				completion(nil)
			}

		}.resume()
	}

	func getTokenInfo(completion: @escaping (TokenInfo?) -> Void) {
		guard let request = ApiType.tokenInfo.request else {
			completion(nil)
			return
		}

		URLSession.shared.dataTask(with: request) { data, response, error in
			if let error = error {
				print(error)
				completion(nil)
			}

			guard let data = data else {
				print("No data available")
				completion(nil)
				return
			}

			if let tokenInfo = try? JSONDecoder().decode(TokenInfo.self, from: data) {
				completion(tokenInfo)
			} else {
				print("Failed to decode")
				completion(nil)
			}
		}.resume()
	}

	func getToken(code: String, completion: @escaping (Token?) -> Void) {
		guard let url = URL(string: "https://api.intra.42.fr/" +
									"oauth/token" +
									"?grant_type=authorization_code" +
									"&client_id=\(ApiManager.shared.uid)" +
									"&client_secret=\(ApiManager.shared.secret)" +
									"&code=\(code)" +
									"&redirect_uri=https://profile.intra.42.fr") else {
							return
						}

						var request = URLRequest(url: url)
						request.httpMethod = "POST"
		
		URLSession.shared.dataTask(with: request) { data, response, error in
			if let error = error {
				print(error)
				completion(nil)
			}

			guard let data = data else {
				print("No data available")
				completion(nil)
				return
			}

			if let token = try? JSONDecoder().decode(Token.self, from: data) {
				completion(token)
			} else {
				print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
				print("Failed to decode")
				completion(nil)
			}
		}.resume()

//		guard let request = ApiType.token(code).request else {
//			completion(nil)
//			return
//		}
//
//		URLSession.shared.dataTask(with: request) { data, response, error in
//			if let error = error {
//				print(error)
//				self.accessToken = nil
//				completion(nil)
//			}
//
//			guard let data = data else {
//				print("No data available")
//				self.accessToken = nil
//				completion(nil)
//				return
//			}
//
//			if let token = try? JSONDecoder().decode(Token.self, from: data) {
//				self.accessToken = token.accessToken
//				print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
//				completion(token)
//			} else {
//				print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
//				print("Failed to decode")
//				self.accessToken = nil
//				completion(nil)
//			}
//		}.resume()
	}

	func getCode(completion: @escaping (URLRequest?) -> Void) {
		guard let url = URL(string: "https://api.intra.42.fr/" +
									"oauth/authorize" +
									"?client_id=\(ApiManager.shared.uid)" +
									"&redirect_uri=https://profile.intra.42.fr" +
									"&response_type=code") else {
			return
		}

		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		completion(request)

//		guard let request = ApiType.code.request else {
//			completion(nil)
//			return
//		}
//
//		completion(request)
	}

}

