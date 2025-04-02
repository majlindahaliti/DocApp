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
    var page: SectionsList? {get set}
    var showBack: Bool? {get set}
    func showDetailsScreen(item: SectionsList)
    func showAllPages(pages: [SectionsList]?)
    func populateTableView(data: [SectionsList])
    func populateSubsections(data: [SectionsList])
    func filterResults(with searchText: String)
    var filteredResults: [SectionsList]? { get set }
    
    func getPageDetails(completion: @escaping ((PageDetailsResponse?, Error?) -> Void))
}
