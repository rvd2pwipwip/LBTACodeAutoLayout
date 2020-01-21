//
//  AppDelegate.swift
//  LBTACodeAutoLayout
//
//  Created by Herve Desrosiers on 2020-01-15.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.makeKeyAndVisible()
        
//        let randomViewController = UIViewController()
//        randomViewController.view.backgroundColor = .purple
//        window?.rootViewController = randomViewController
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let swipingController = SwipingController(collectionViewLayout: layout)
        window?.rootViewController = swipingController
        
        return true
    }
}

