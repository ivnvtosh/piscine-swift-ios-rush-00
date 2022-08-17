//
//  MainViewController.swift
//  Rush-00-03
//
//  Created by Anton Ivanov on 16.08.2022.
//

import UIKit

class MainViewController: UIViewController {

	private var contentSize: CGSize {
		CGSize(width: self.view.frame.width,
			   height: self.view.frame.height)
	}

	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()

		scrollView.contentSize = self.contentSize
		scrollView.showsHorizontalScrollIndicator = false
		scrollView.showsVerticalScrollIndicator = false

		return scrollView
	}()

	private lazy var contentView: UIView = {
		let contentView = UIView()

		contentView.backgroundColor = .systemGray6
		contentView.backgroundColor = UIColor(patternImage: UIImage(named: "42 background login")!)

		return contentView
	}()

	private lazy var stackView: UIStackView = {
		let stackView = UIStackView()

		stackView.axis = .vertical
		stackView.alignment = .center
		stackView.spacing = 5

		return stackView
	}()

	//  MARK: - Content
	private lazy var imageView: UIImageView = {
		let imageView = UIImageView()

		imageView.image = UIImage(named: "42 logo white")
		imageView.contentMode = .scaleAspectFill

		return imageView
	}()

	@objc func logInAction(_ sender : UIButton) {

//		let second = EventsViewController()
//		second.title = "Event"

		let second = SignInViewController()

		let navVC = UINavigationController(rootViewController: second)
		navVC.modalPresentationStyle = .fullScreen

		present(navVC, animated: true)
	}

	private lazy var loginButton: UIButton = {
		let loginButton = UIButton(frame: CGRect(x: 0, y: 0, width: 300.00, height: 30.00))

		loginButton.backgroundColor = UIColor(named: "42 green")
		loginButton.setTitle("SIGN IN", for: .normal)
		loginButton.setTitleColor(.white, for: .normal)
		loginButton.addTarget(self, action: #selector(logInAction(_:)), for:.touchUpInside)

		return loginButton
	}()

	override func viewDidLoad() {
		super.viewDidLoad()

        self.modalPresentationStyle = .overCurrentContext
        
		self.view.addSubview(self.scrollView)
		self.scrollView.addSubview(self.contentView)
		self.contentView.addSubview(self.stackView)

		self.stackView.addArrangedSubview(self.imageView)
		self.stackView.addArrangedSubview(self.loginButton)

		setupViewConstraints()

		self.modalPresentationStyle = .fullScreen
	}

	override func viewDidLayoutSubviews() {
		scrollView.frame = self.view.bounds
		contentView.frame.size = self.contentSize
	}

}


// MARK: - Constraints
extension MainViewController {

	private func setupViewConstraints() {
		self.stackView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			self.stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
			self.stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
			self.stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
									])

		NSLayoutConstraint.activate([
			self.imageView.widthAnchor.constraint(equalToConstant: 200),
			self.imageView.heightAnchor.constraint(equalToConstant: 200)
									])
		
		NSLayoutConstraint.activate([
			self.loginButton.widthAnchor.constraint(equalToConstant: 200),
			self.loginButton.heightAnchor.constraint(equalToConstant: 50)
									])
	}

}

