//
//  PageDetailsModel.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import Foundation

struct PageDetailsResponse: Codable {
    let type, title: String
    let items: [SectionsList]
}

struct SectionsList: Codable {
    let type, title: String
    let src: String?
    let items: [SectionsList]?
}
