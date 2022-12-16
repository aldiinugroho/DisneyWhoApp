//
//  AppDelegate.swift
//  DisneyWhoApp
//
//  Created by aldinugroho on 12/12/22.
//

import UIKit

let appColor: UIColor = UIColor(named: "basecolor")!

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = appColor
        let view = UINavigationController(rootViewController: MainViewController())
        window?.rootViewController = view
        return true
    }
}
