//
//  ViewControllerProfile.swift
//  Project-01
//
//  Created by Anton Ivanov on 15.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {

	public var coalitionColor: UIColor!

	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()

		scrollView.frame = self.view.bounds
		scrollView.contentSize = self.contentSize
		scrollView.showsHorizontalScrollIndicator = false
		scrollView.showsVerticalScrollIndicator = false

		return scrollView
	}()

	private lazy var contentView: UIView = {
		let contentView = UIView()

		contentView.backgroundColor = .systemGray6
		contentView.frame.size = self.contentSize

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

		imageView.image = UIImage(systemName: "person.circle")
		imageView.tintColor = .systemGray5
		imageView.contentMode = .scaleAspectFill

		return imageView
	}()

	private lazy var labelDisplayName: UILabel = {
		let label = UILabel()

		label.text = "Display name"
		label.textColor = coalitionColor
		label.textAlignment = .center

		return label
	}()

	private lazy var labelWallet: UILabel = {
		let label = UILabel()

		label.text = "Wallet"
		label.textColor = coalitionColor
		label.textAlignment = .center

		return label
	}()

	private lazy var labelPoints: UILabel = {
		let label = UILabel()

		label.text = "Evaluation points"
		label.textColor = coalitionColor
		label.textAlignment = .center

		return label
	}()

	private lazy var labelCursus: UILabel = {
		let label = UILabel()

		label.text = "Cursus"
		label.textColor = coalitionColor
		label.textAlignment = .center

		return label
	}()

	private lazy var labelGrade: UILabel = {
		let label = UILabel()

		label.text = "Grade"
		label.textColor = coalitionColor
		label.textAlignment = .center

		return label
	}()

	private var contentSize: CGSize {
		CGSize(width: self.view.frame.width,
			   height: self.view.frame.height + 500)
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		self.view.addSubview(self.scrollView)
		self.scrollView.addSubview(self.contentView)
		self.contentView.addSubview(self.stackView)

		self.stackView.addArrangedSubview(self.imageView)
		self.stackView.addArrangedSubview(self.labelDisplayName)

		self.stackView.addArrangedSubview(self.labelWallet)
		self.stackView.addArrangedSubview(self.labelPoints)
		self.stackView.addArrangedSubview(self.labelCursus)
		self.stackView.addArrangedSubview(self.labelGrade)

		setupViewConstraints()
        
        self.modalPresentationStyle = .fullScreen
    }


}

//        MARK: - Constraints
extension ProfileViewController {

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
			self.labelDisplayName.widthAnchor.constraint(equalToConstant: 200),
			self.labelDisplayName.heightAnchor.constraint(equalToConstant: 50)
									])

		NSLayoutConstraint.activate([
			self.labelWallet.widthAnchor.constraint(equalToConstant: 200),
			self.labelWallet.heightAnchor.constraint(equalToConstant: 20)
									])

		NSLayoutConstraint.activate([
			self.labelPoints.widthAnchor.constraint(equalToConstant: 200),
			self.labelPoints.heightAnchor.constraint(equalToConstant: 20)
									])

		NSLayoutConstraint.activate([
			self.labelCursus.widthAnchor.constraint(equalToConstant: 200),
			self.labelCursus.heightAnchor.constraint(equalToConstant: 20)
									])

		NSLayoutConstraint.activate([
			self.labelGrade.widthAnchor.constraint(equalToConstant: 200),
			self.labelGrade.heightAnchor.constraint(equalToConstant: 20)
									])

	}

}

