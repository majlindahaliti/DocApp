//
//  HomeScreenViewModelProtocol.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

import Foundation

protocol HomeScreenViewModelProtocol : BaseViewModel {
    var coordinatorDelegate : HomeScreenViewModelCoordinatorDelegate? {get set}
    var dataSource: SectionsListDataSource? {get}
    var subsectionsDataSource: SubsectionsListDataSourceDataSource? {get}
    var viewDelegate: HomeScreenViewModelViewProtocol? {get set}
    func showDetailsScreen()
    func showAllPages()
}
