//
//  SubscribeViewController.swift
//  Rush-00-03
//
//  Created by Сергей Хмизюк on 17.08.2022.
//

import UIKit

class SubscribeViewController: UIViewController {
    
    var eventName: String?
    var eventDescription: String?
    var eventDate: String?
    
    var event: Event?
    
    private var contentSize: CGSize {
        CGSize(width: self.view.frame.width,
               height: self.view.frame.height + 2000)
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

        return contentView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5

        return stackView
    }()
    
    private lazy var labelEventName: UILabel = {
        let label = UILabel()

        return label
    }()
    
    private lazy var labelEventDescription: UILabel = {
        let label = UILabel()

        return label
    }()
    
    private lazy var labelEventDate: UILabel = {
        let label = UILabel()

        return label
    }()

	private lazy var labelEmpty: UILabel = {
		let label = UILabel()

		return label
	}()

	private lazy var labelEmpty1: UILabel = {
		let label = UILabel()

		return label
	}()

	
	private lazy var labelWAR: UILabel = {
		let label = UILabel()

		return label
	}()

    @objc func subscribeAction(_ sender : UIButton) {

    }

	private lazy var labelMax: UILabel = {
		let label = UILabel()

		return label
	}()

	private lazy var labelTime: UILabel = {
		let label = UILabel()

		return label
	}()

	private lazy var labelLang: UILabel = {
		let label = UILabel()

		return label
	}()

    private lazy var subscribeButton: UIButton = {
        let subscribeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 300.00, height: 30.00))

        subscribeButton.backgroundColor = UIColor(named: "42 green")
        subscribeButton.setTitle("SIGN IN", for: .normal)
        subscribeButton.setTitleColor(.white, for: .normal)
        subscribeButton.addTarget(self, action: #selector(subscribeAction(_:)), for:.touchUpInside)

        return subscribeButton
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.stackView)

		self.stackView.addArrangedSubview(self.labelEmpty1)
        self.stackView.addArrangedSubview(self.labelEventName)
		self.stackView.addArrangedSubview(self.labelEventDate)
		self.stackView.addArrangedSubview(self.labelTime)
		self.stackView.addArrangedSubview(self.labelMax)
		self.stackView.addArrangedSubview(self.labelLang)
		self.stackView.addArrangedSubview(self.labelWAR)
		self.stackView.addArrangedSubview(self.labelEmpty)
		

		
        self.stackView.addArrangedSubview(self.labelEventDescription)
        
        setupViewConstraints()
        
        labelEventName.text = event?.name

		labelEventName.textColor = .orange
        labelEventName.numberOfLines = 0
		labelMax.text = "\(event?.nbrSubscribers ?? 0)/\(event?.maxPeople ?? 0)"
		labelTime.text = event?.endAt
		labelTime.textColor = .red
        labelEventDate.text = event?.beginAt
		labelTime.numberOfLines = 0
		labelLang.numberOfLines = 0
		

		let formatter = DateFormatter()
		formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
	
		
		let startT = formatter.date(from: event!.beginAt!)!
		let endT = formatter.date(from: event!.endAt!)!
		let calendar = Calendar.current
		let hourS = calendar.component(.hour, from: startT)
		let minutesS = calendar.component(.minute, from: startT)
		let hourE = calendar.component(.hour, from: endT)
		let minutesE = calendar.component(.minute, from: endT)
		
		let raznizaHour = hourE - hourS
		let raznizaMin = minutesE - minutesS
		
		labelWAR.text = "\(raznizaHour)h \(raznizaMin)m"
		labelWAR.numberOfLines = 0
		if let id = event?.campusIds?[0] {
			API42Manager.shared.getCampus(by: id) { campus, error in
				if let error = error {
					print(error)
					return
				}
				
				guard let campus = campus else {
					return
				}
				
				DispatchQueue.main.async {
					self.labelLang.text = campus.language.name
				}
			}
		}

	
		labelTime.font = UIFont(name:  "default", size: 8)
        labelEventDate.numberOfLines = 0
		labelEventDate.font = UIFont(name:  "default", size: 8)
        labelEventDescription.text = event?.descriptionEvent
        labelEventDescription.numberOfLines = 0
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.frame = self.view.bounds
        contentView.frame.size = self.contentSize
    }
}

extension SubscribeViewController {

    private func setupViewConstraints() {
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            self.stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
                                    ])
        
        NSLayoutConstraint.activate([
            self.subscribeButton.widthAnchor.constraint(equalToConstant: 200),
            self.subscribeButton.heightAnchor.constraint(equalToConstant: 50)
                                    ])
		
		NSLayoutConstraint.activate([
			self.labelEmpty.widthAnchor.constraint(equalToConstant: 200),
			self.labelEmpty.heightAnchor.constraint(equalToConstant: 10)
									])
		
		NSLayoutConstraint.activate([
			self.labelEmpty1.widthAnchor.constraint(equalToConstant: 200),
			self.labelEmpty1.heightAnchor.constraint(equalToConstant: 10)
									])
        
        NSLayoutConstraint.activate([
            self.labelEventDate.widthAnchor.constraint(equalToConstant: 200)
                                    ])
        
        NSLayoutConstraint.activate([
            self.labelEventName.widthAnchor.constraint(equalToConstant: 200)
                                    ])
        
        NSLayoutConstraint.activate([
            self.labelEventDescription.widthAnchor.constraint(equalToConstant: 200)
                                    ])
		NSLayoutConstraint.activate([
			self.labelMax.widthAnchor.constraint(equalToConstant: 200),
			self.labelMax.heightAnchor.constraint(equalToConstant: 50),
		])
		NSLayoutConstraint.activate([
			self.labelTime.widthAnchor.constraint(equalToConstant: 200),
			self.labelTime.heightAnchor.constraint(equalToConstant: 50),
		])
		
		NSLayoutConstraint.activate([
			self.labelLang.widthAnchor.constraint(equalToConstant: 200),
			self.labelLang.heightAnchor.constraint(equalToConstant: 50),
		])
		NSLayoutConstraint.activate([
			self.labelWAR.widthAnchor.constraint(equalToConstant: 200),
			self.labelWAR.heightAnchor.constraint(equalToConstant: 50),
		])
		
    }
}
