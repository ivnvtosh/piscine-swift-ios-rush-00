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
               height: self.view.frame.height + 500)
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
    
    @objc func subscribeAction(_ sender : UIButton) {

    }

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

        self.stackView.addArrangedSubview(self.labelEventDate)
        self.stackView.addArrangedSubview(self.labelEventName)
        self.stackView.addArrangedSubview(self.labelEventDescription)
        
        setupViewConstraints()
        
        labelEventName.text = event?.name
        labelEventName.numberOfLines = 0
        labelEventDate.text = event?.beginAt
        labelEventDate.numberOfLines = 0
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
            self.labelEventDate.widthAnchor.constraint(equalToConstant: 200)
                                    ])
        
        NSLayoutConstraint.activate([
            self.labelEventName.widthAnchor.constraint(equalToConstant: 200)
                                    ])
        
        NSLayoutConstraint.activate([
            self.labelEventDescription.widthAnchor.constraint(equalToConstant: 200)
                                    ])
    }
}
