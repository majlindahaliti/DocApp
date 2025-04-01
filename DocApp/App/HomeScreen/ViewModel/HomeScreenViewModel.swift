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
    
    func showDetailsScreen() {
        self.coordinatorDelegate?.showDetailsScreen()
    }
    
    func showAllPages() {
        self.coordinatorDelegate?.showAllPages()
    }
}

extension HomeScreenViewModel: SectionsListDataSourceProtocol{
    func itemTapped(item: SectionItem, hasChilds: Bool) {
        if hasChilds {
            self.viewDelegate?.reloadTable()
        }else{
//            self.didSelectItem(item: item)
        }
    }
    
    func updateSection(section: [Int]) {
        self.viewDelegate?.updateSection(section: section)
    }
    
    func selectedRow(row: Int, hasChild: Bool) {
        print("selectedRow tapped")
    }
}
