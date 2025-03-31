//
//  SplashViewModel.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

import Foundation

class SplashViewModel: SplashViewModelProtocol{
    weak var coordinatorDelegate : SplashViewModelCoordinatorDelegate?
    
    func splashScreenShown() {
        coordinatorDelegate?.splashScreenShown()
    }
}
