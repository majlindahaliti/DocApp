//
//  UIImageView+Extensions.swift
//  DocApp
//
//  Created by Majlinda on 2.4.25.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = Kingfisher.KF.ImageResource(downloadURL: url, cacheKey: urlString)
        var kf = self.kf
        kf.indicatorType = .activity
        self.kf.setImage(with: resource)
    }
}
