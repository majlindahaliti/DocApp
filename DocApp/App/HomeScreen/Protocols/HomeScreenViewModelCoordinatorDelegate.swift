//
//  HomeScreenViewModelCoordinatorDelegate.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

import Foundation

protocol HomeScreenViewModelCoordinatorDelegate: AnyObject {
    func showDetailsScreen(item: SectionsList)
    func showAllPages(pages: [SectionsList]?)
}
