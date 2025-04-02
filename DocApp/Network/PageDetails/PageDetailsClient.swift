//
//  PageDetailsClient.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import Foundation
import Alamofire
import PromisedFuture
import Foundation

class PageDetailsClient {
    static func getPageDetails() -> Future<PageDetailsResponse, Error> {
        return APIClient.performRequest(route: PageDetailsEndpoint.getPageDetails)
    }
}
