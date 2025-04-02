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
    
    public init(){
        dataSource = SectionsListDataSource()
        subsectionsDataSource = SubsectionsListDataSourceDataSource()
        dataSource?.delegate = self
    }
    
    func getPageDetails(completion: @escaping ((PageDetailsResponse?, Error?) -> Void)) {
        let client = PageDetailsClient.getPageDetails()
        client.execute(onSuccess: { response in
            completion(response, nil) // Success
        }, onFailure: { error in
            completion(nil, error) // Failure
        })
    }
    
    func showDetailsScreen(item: ItemItem) {
        self.coordinatorDelegate?.showDetailsScreen(item: item)
    }
    
    func showAllPages(pages: [SectionsList]?) {
        self.coordinatorDelegate?.showAllPages(pages: pages)
    }
    
    func populateTableView(data: [SectionsList]) {
        let filteredData = data.filter { $0.type != "page" }
        self.dataSource?.items = filteredData
    }
    
    func populateSubsections(data: [ItemItem]) {
        self.subsectionsDataSource?.subsectionsList = data
    }
}

extension HomeScreenViewModel: SectionsListDataSourceProtocol{
    func itemTapped(item: ItemItem, hasChilds: Bool) {
        if hasChilds {
            self.viewDelegate?.reloadTable()
        }else{
            self.showDetailsScreen(item: item)
        }
    }
    
    func updateSection(section: [Int]) {
        self.viewDelegate?.updateSection(section: section)
    }
    
    func selectedRow(row: Int, hasChild: Bool) {
        print("selectedRow tapped")
    }
}
