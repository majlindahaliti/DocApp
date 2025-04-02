//
//  DetailsScreenViewModelProtocol.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import Foundation

protocol DetailsScreenViewModelProtocol : BaseViewModel {
    var coordinatorDelegate : DetailsScreenViewModelCoordinatorDelegate? {get set}
    var item: SectionsList? {get set}
}
