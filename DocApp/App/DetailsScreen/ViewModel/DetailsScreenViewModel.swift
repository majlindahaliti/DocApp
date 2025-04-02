//
//  DetailsScreenViewModel.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import Foundation

class DetailsScreenViewModel: DetailsScreenViewModelProtocol{
    weak var coordinatorDelegate : DetailsScreenViewModelCoordinatorDelegate?
    
    var item: SectionsList?
    
    public init(item: SectionsList?){
        self.item = item
    }
}
