//
//  APIConfiguration.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
