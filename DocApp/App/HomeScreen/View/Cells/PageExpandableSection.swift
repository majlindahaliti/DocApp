//
//  PageExpandableSection.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import UIKit

class PageExpandableSection: UITableViewHeaderFooterView {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func expnad(should: Bool){
        self.detailImageView.isHidden = false
        self.detailImageView.image = should ? UIImage(named: "expand_less") : UIImage(named: "expand_more")
    }
}
