//
//  ViewControllerProfile.swift
//  Project-01
//
//  Created by Anton Ivanov on 15.08.2022.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var profile: Profile?

	public var coalitionColor: UIColor!
    
    private lazy var eventsTableView: UITableView = {
        let eventsTableView = UITableView()
        
        eventsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "eventCell")
        eventsTableView.dataSource = self
        
        eventsTableView.delegate = self
        
        return eventsTableView
    }()

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

        Manager.shared.loadImage(with: URL(string: "https://cdn.intra.42.fr/users/default.png")) { image in
            guard let image = image else {
                return
            }

            DispatchQueue.main.async {
                imageView.image = image
            }
        }

		imageView.tintColor = .systemGray5
		imageView.contentMode = .scaleAspectFill

		return imageView
	}()

	private lazy var labelDisplayName: UILabel = {
		let label = UILabel()

        label.text = profile?.displayname
		label.textColor = coalitionColor
		label.textAlignment = .center

		return label
	}()

	private lazy var labelWallet: UILabel = {
		let label = UILabel()

        label.text = profile?.wallet?.description
		label.textColor = coalitionColor
		label.textAlignment = .center

		return label
	}()

	private lazy var labelPoints: UILabel = {
		let label = UILabel()

		label.text = ""
		label.textColor = coalitionColor
		label.textAlignment = .center

		return label
	}()

	private lazy var labelCursus: UILabel = {
		let label = UILabel()

        label.text = ""
		label.textColor = coalitionColor
		label.textAlignment = .center

		return label
	}()

	private lazy var labelGrade: UILabel = {
		let label = UILabel()

        label.text = profile?.cursusUser[1].level?.description
		label.textColor = coalitionColor
		label.textAlignment = .center

		return label
	}()
    
    private lazy var labelFree: UILabel = {
        let label = UILabel()

        label.text = ""
        label.textColor = coalitionColor
        label.textAlignment = .center

        return label
    }()
    
    @objc func logOutAction(_ sender : UIButton) {

        let second = MainViewController()

//            let navVC = UINavigationController(rootViewController: second)
//            navVC.modalPresentationStyle = .fullScreen
        
        second.modalPresentationStyle = .overCurrentContext

        self.present(second, animated: false)
        
    }

    private lazy var logOutButton: UIButton = {
        let logOutButton = UIButton(frame: CGRect(x: 0, y: 0, width: 300.00, height: 30.00))

        logOutButton.backgroundColor = UIColor(named: "42 green")
        logOutButton.setTitle("LOG OUT", for: .normal)
        logOutButton.setTitleColor(.white, for: .normal)
        logOutButton.addTarget(self, action: #selector(logOutAction(_:)), for:.touchUpInside)

        return logOutButton
    }()


	private var contentSize: CGSize {
		CGSize(width: self.view.frame.width,
			   height: self.view.frame.height + 500)
	}

	override func viewDidLayoutSubviews() {
		//        eventsTableView.topAnchor.constraint(equalTo:logOutButton.topAnchor).isActive = true
				eventsTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
				eventsTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
		//        eventsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
				
				setupViewConstraints()
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
		
		self.stackView.addArrangedSubview(self.labelGrade)
        
        //------------------------------------------------------
    
        self.stackView.addArrangedSubview(self.labelFree)
        
        self.stackView.addArrangedSubview(self.logOutButton)
        
        self.stackView.addArrangedSubview(self.labelCursus)
        
        self.stackView.addArrangedSubview(eventsTableView)
        
    }

    //-----------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Event.allEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        cell.textLabel?.text = Event.allEvents[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell \(indexPath.row)")
        
        let second = SubscribeViewController()

        let navVC = UINavigationController(rootViewController: second)
        navVC.modalPresentationStyle = .fullScreen

        second.event = Event.allEvents[indexPath.row]
        
        navigationController!.pushViewController(second, animated: true)
        
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
        
        NSLayoutConstraint.activate([
            self.labelFree.widthAnchor.constraint(equalToConstant: 200),
            self.labelFree.heightAnchor.constraint(equalToConstant: 20)
                                    ])
        
        NSLayoutConstraint.activate([
            self.logOutButton.widthAnchor.constraint(equalToConstant: 200),
            self.logOutButton.heightAnchor.constraint(equalToConstant: 50)
                                    ])
        
        NSLayoutConstraint.activate([
            self.eventsTableView.heightAnchor.constraint(equalToConstant: 200)
                                    ])

	}
    
}

