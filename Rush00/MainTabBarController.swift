//
//  MainTabBarController.swift
//  Project-01
//
//  Created by Anton Ivanov on 15.08.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

	private let coalitionColor = Coalition.salamander.color

    override func viewDidLoad() {
        super.viewDidLoad()

		generateTabBar()
		setupTabBar()
    }

	private func generateTabBar() {
		viewControllers = [
			generate(viewController: SignInViewController(),
					 image: UIImage(systemName: "house.fill")),
			generate(profile: ProfileViewController(),
					 image: UIImage(systemName: "person.fill")),
//			generate(viewController: HomeViewController(),
//					 image: UIImage(systemName: "house.fill")),
						  ]
	}

	private func generate(profile viewController: ProfileViewController, image: UIImage?) -> UIViewController {
		viewController.tabBarItem.image = image
		viewController.coalitionColor = coalitionColor
		return viewController
	}

	private func generate(viewController: UIViewController, image: UIImage?) -> UIViewController {
		viewController.tabBarItem.image = image
		return viewController
	}

	private func setupTabBar() {
		tabBar.backgroundColor = .systemGray6
		tabBar.tintColor = coalitionColor
	}


}

