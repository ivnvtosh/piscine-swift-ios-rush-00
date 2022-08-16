//
//  AppDelegate.swift
//  Rush-00-03
//
//  Created by Сергей Хмизюк on 16.08.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = SignInViewController()
        window?.makeKeyAndVisible()

        return true
    }

}
