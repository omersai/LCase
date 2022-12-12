//
//  AppRouter.swift
//  MoviesUI
//
//  Created by OMER on 7.12.2022.
//

import UIKit

final class AppRouter{
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func splashScreen() -> SplashViewController{
        let launchScreenVC = UIStoryboard.init(name: "Main", bundle: nil)
        let view = launchScreenVC.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
        return view
    }
    
    func start(){
        let viewController = splashScreen()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
