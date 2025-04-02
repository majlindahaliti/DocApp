//
//  AllPagesViewModelProtocol.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import Foundation

protocol AllPagesViewModelProtocol : BaseViewModel {
    var coordinatorDelegate : AllPagesViewModelCoordinatorDelegate? {get set}
    var dataSource: AllPagesDataSource? {get}
    func showMainScreen(showBack: Bool, page: SectionsList)
}
