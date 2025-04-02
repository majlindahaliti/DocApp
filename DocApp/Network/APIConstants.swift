//
//  APIConstants.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import Foundation

struct APIConstants {
    struct DevelopmentServer {
        static let baseURL = "https://mocki.io/v1"
    }
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
