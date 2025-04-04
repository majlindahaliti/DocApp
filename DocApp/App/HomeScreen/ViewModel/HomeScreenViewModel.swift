//
//  HomeScreenViewModel.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

class HomeScreenViewModel: HomeScreenViewModelProtocol{
    weak var coordinatorDelegate : HomeScreenViewModelCoordinatorDelegate?
    var dataSource: SectionsListDataSource?
    var subsectionsDataSource: SubsectionsListDataSourceDataSource?
    weak var viewDelegate: HomeScreenViewModelViewProtocol?
    var page: SectionsList?
    var showBack: Bool?
    var filteredResults: [SectionsList]?
    var sectionsList: [SectionsList] = []
    
    public init(page: SectionsList?, showBack: Bool?){
        dataSource = SectionsListDataSource()
        subsectionsDataSource = SubsectionsListDataSourceDataSource()
        dataSource?.delegate = self
        subsectionsDataSource?.delegate = self
        self.page = page
        self.showBack = showBack
    }
    
    func getPageDetails(completion: @escaping ((PageDetailsResponse?, Error?) -> Void)) {
        let client = PageDetailsClient.getPageDetails()
        client.execute(onSuccess: { response in
            self.sectionsList = response.items
            completion(response, nil) // Success
        }, onFailure: { error in
            completion(nil, error) // Failure
        })
    }
    
    func filterResults(with searchText: String) {
        if searchText.isEmpty {
            filteredResults = sectionsList
          } else {
              filteredResults = sectionsList.filter { square in
                  let name = square.title.lowercased()
                  return name.contains(searchText.lowercased())
              }
          }
        if let results = filteredResults{
            self.populateTableView(data: results)
        }
    }
    
    func showDetailsScreen(item: SectionsList) {
        self.coordinatorDelegate?.showDetailsScreen(item: item)
    }
    
    func showAllPages(pages: [SectionsList]?) {
        self.coordinatorDelegate?.showAllPages(pages: pages)
    }
    
    func populateTableView(data: [SectionsList]) {
        let filteredData = data.filter { $0.type != "page" }
        self.dataSource?.items = filteredData
    }
    
    func populateSubsections(data: [SectionsList]) {
        self.subsectionsDataSource?.subsectionsList = data
    }
}

extension HomeScreenViewModel: SubsectionsListDataSourceDataSourceProtocol{
    func showDetails(item: SectionsList) {
        self.showDetailsScreen(item: item)
    }
}

extension HomeScreenViewModel: SectionsListDataSourceProtocol{
    func itemTapped(item: SectionsList, hasChilds: Bool) {
        if !hasChilds {
            self.showDetailsScreen(item: item)
        }
    }
    
    func updateSection(section: [Int]) {
        self.viewDelegate?.updateSection(section: section)
    }
}
