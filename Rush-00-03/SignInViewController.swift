//
//  ViewControllerSignIn.swift
//  Project-01
//
//  Created by Anton Ivanov on 15.08.2022.
//

import UIKit
import WebKit

class SignInViewController: UIViewController {

	var webViewConstraint: [NSLayoutConstraint]?

	var profile: Profile?
	var events: Events?

	private lazy var webView: WKWebView = {
		webView =  WKWebView()

		API42Manager.shared.getCode() { request, error in
			if let error = error {
				print(error)
				return
			}

			guard let request = request else {
				return
			}

			self.webView.load(request)
		}

		return webView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.addSubview(self.webView)
		webView.navigationDelegate = self
        
	}

	override func viewDidLayoutSubviews() {
		webView.frame = view.bounds
		setupViewConstraints()
	}

	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|



	func goToTableControler(profile: Profile, events: Events) {
        print(events)
        
        Event.allEvents = events
        
        DispatchQueue.main.async {
            
                let second = ProfileViewController()
                second.profile = profile
                
                let navVC = UINavigationController(rootViewController: second)
                navVC.modalPresentationStyle = .fullScreen

                self.present(navVC, animated: true)
            
            
        }
	}



	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|
	//		|

}


//        MARK: - Constraints
extension SignInViewController {

	private func setupViewConstraints() {
		webViewConstraint = [
			self.webView.topAnchor.constraint(equalTo: view.topAnchor),
			self.webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			self.webView.leftAnchor.constraint(equalTo: view.leftAnchor),
			self.webView.rightAnchor.constraint(equalTo: view.rightAnchor),
							]
		NSLayoutConstraint.activate(webViewConstraint!)

	}

}

extension SignInViewController: WKNavigationDelegate {

	func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

		if let _ = navigationAction.request.url?.host {
			guard let url =  navigationAction.request.url else {
				decisionHandler(.cancel)
				return
			}

			let strings = url.absoluteString.components(separatedBy: "code=")

			if strings.count == 2 {
				let code = strings[1]
	
				API42Manager.shared.getToken(code: code) { token, error in
					if let error = error {
						print(error)
						return
					}

					guard let token = token else {
						return
					}

					API42Manager.shared.accessToken = token.accessToken
					API42Manager.shared.getMe { profile, error in
						if let error = error {
							print(error)
							return
						}

						guard let profile = profile else {
							return
						}

						self.profile = profile
						API42Manager.shared.getEvents(userId: profile.id!) { events, error in
							if let error = error {
								print(error)
								return
							}

							guard let events = events else {
								return
							}

							self.events = events
                            
                            self.goToTableControler(profile: self.profile!, events: self.events!)
						}
					}
				}

//				dismiss(animated: true)
				decisionHandler(.cancel)
				return
			}

			decisionHandler(.allow)
			return

		}

		decisionHandler(.cancel)
	}

}

