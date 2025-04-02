//
//  SplashViewController.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

import UIKit

class SplashViewController: UIViewController, Storyboarded {
    
    //MARK: - Properties
    var viewModel: SplashViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        launchApp()
    }
    
    //MARK: - Functions
    func launchApp(){
        delay(delay: 1.5) {
            self.viewModel?.splashScreenShown()
        }
    }
}
