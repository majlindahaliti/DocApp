//
//  DetailsScreenViewModel.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import Foundation

class DetailsScreenViewModel: DetailsScreenViewModelProtocol{
    weak var coordinatorDelegate : DetailsScreenViewModelCoordinatorDelegate?
    
    var item: ItemItem?
    
    public init(item: ItemItem?){
        self.item = item
    }
}
