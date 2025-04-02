//
//  PageDetailsEndpoint.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import Foundation
import UIKit
import Alamofire

enum PageDetailsEndpoint: APIConfiguration {
    
    case getPageDetails
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .getPageDetails:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        var urlComponents = URLComponents()
        switch self {
        case .getPageDetails:
            return "/6c823976-465e-401e-ae8d-d657d278e98e"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .getPageDetails:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let urlString =  APIConstants.DevelopmentServer.baseURL + path
        let finalURL = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        var urlRequest = URLRequest(url: finalURL!)
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        print("urlRequest: \(urlRequest)")
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)

        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
}
