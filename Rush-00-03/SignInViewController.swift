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

		ApiManager.shared.getCode() { request in
			guard let request = request else {
				return
			}

			self.webView.load(request)
		}

		return webView
	}()

	class Delegate: NSObject, URLSessionDataDelegate {
		   func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
			   guard let queueLabel = OperationQueue.current?.underlyingQueue?.label else { return }
			   print(queueLabel)
		}
	}

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
		// Something...


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
	
				ApiManager.shared.getToken(code: code) { token in
					guard let token = token else {
						return
					}

					ApiManager.shared.accessToken = token.accessToken
				}
				sleep(1)
				ApiManager.shared.getMe { profile in
					guard let profile = profile else {
						return
					}

					self.profile = profile
				}
				sleep(1)
				ApiManager.shared.getEvents(userId: profile!.id!) { events in
					guard let events = events else {
						return
					}

					self.events = events
				}
				sleep(1)
				self.goToTableControler(profile: self.profile!, events: self.events!)

				dismiss(animated: true)
				decisionHandler(.cancel)
				return
			}

			decisionHandler(.allow)
			return

		}

		decisionHandler(.cancel)
	}

}

