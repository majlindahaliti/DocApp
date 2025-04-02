//
//  AllPagesViewModelCoordinatorDelegate.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import Foundation

protocol AllPagesViewModelCoordinatorDelegate: AnyObject {
    func showMainScreen(showBack: Bool, page: SectionsList)
}
