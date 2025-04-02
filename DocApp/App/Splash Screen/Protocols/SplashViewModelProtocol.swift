//
//  SplashViewModelProtocol.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

import Foundation

protocol SplashViewModelProtocol : BaseViewModel {
    var coordinatorDelegate : SplashViewModelCoordinatorDelegate? {get set}
    
    func splashScreenShown()
}
