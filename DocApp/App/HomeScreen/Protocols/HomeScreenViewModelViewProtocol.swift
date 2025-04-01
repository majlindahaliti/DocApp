//
//  HomeScreenViewModelViewProtocol.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import Foundation

protocol HomeScreenViewModelViewProtocol: AnyObject {
    func reloadTable()
    func updateSection(section: [Int])
    func selectedRow(row: Int, hasChild: Bool)
}
