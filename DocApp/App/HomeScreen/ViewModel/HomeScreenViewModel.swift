//
//  HomeScreenViewModel.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

class HomeScreenViewModel: HomeScreenViewModelProtocol{
    weak var coordinatorDelegate : HomeScreenViewModelCoordinatorDelegate?
    var dataSource: SectionsListDataSource?
    weak var viewDelegate: HomeScreenViewModelViewProtocol?
    
    public init(){
        dataSource = SectionsListDataSource()
        dataSource?.delegate = self
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
