//
//  Storyboarded.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate(_ storyboard: UIStoryboard) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(_ storyboard: UIStoryboard) -> Self {
        return storyboard.instantiateViewController(withIdentifier: String(describing: Self.self)) as! Self
    }
}

extension UIStoryboard {
    static var splash: UIStoryboard {
        return UIStoryboard(name: "Splash", bundle: nil)
    }

    static var homeScreen: UIStoryboard {
        return UIStoryboard(name: "HomeScreen", bundle: nil)
    }
    
    static var detailsScreen: UIStoryboard {
        return UIStoryboard(name: "DetailsScreen", bundle: nil)
    }
    
    static var allPages: UIStoryboard {
        return UIStoryboard(name: "AllPagesScreen", bundle: nil)
    }
}

extension UIStoryboard {
    func instantiate<T: UIViewController>(_ : T.Type, identifier: String? = nil) -> T {
        return self.instantiateViewController(withIdentifier: identifier ?? String(describing: T.self)) as! T
    }
}
