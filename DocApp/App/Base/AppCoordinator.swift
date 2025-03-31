//
//  AppCoordinator.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    let window: UIWindow
    var splashCoordinator: SplashCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        initializeSplashScreen()
    }
    
    private func initializeSplashScreen()
    {
        splashCoordinator = SplashCoordinator()
        splashCoordinator?.start()
        if let vc = splashCoordinator?.viewController{
            let nav = BaseNavigationController(rootViewController: vc)
            nav.navigationBar.isHidden = true
            window.rootViewController = nav
        }
    }
}
