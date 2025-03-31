//
//  BaseNavigationController.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isHidden = true
    }
}
