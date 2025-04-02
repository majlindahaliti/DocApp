//
//  Helper.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

import Foundation
import UIKit

func dispatch(_ closure: @escaping ()->()) {
    DispatchQueue.main.async {
        closure()
    }
}

func delay(delay: Double, closure: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}
