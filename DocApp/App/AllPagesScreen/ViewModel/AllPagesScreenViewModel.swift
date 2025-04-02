//
//  AllPagesViewModel.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import Foundation

class AllPagesViewModel: AllPagesViewModelProtocol{
    weak var coordinatorDelegate : AllPagesViewModelCoordinatorDelegate?
    var dataSource: AllPagesDataSource?
    
    public init(pagesList: [SectionsList]?){
        dataSource = AllPagesDataSource()
        dataSource?.allPages = pagesList
        dataSource?.delegate = self
    }
    
    func showMainScreen(showBack: Bool, page: SectionsList) {
        self.coordinatorDelegate?.showMainScreen(showBack: showBack, page: page)
    }
}

extension AllPagesViewModel: AllPagesDataSourceProtocol{
    func showMainScreen(item: SectionsList?) {
        if let page = item{
            self.showMainScreen(showBack: true, page: page)
        }
    }
}
