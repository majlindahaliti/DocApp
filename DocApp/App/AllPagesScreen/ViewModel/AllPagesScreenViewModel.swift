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
    
    public init(){
        dataSource = AllPagesDataSource()
    }
}
