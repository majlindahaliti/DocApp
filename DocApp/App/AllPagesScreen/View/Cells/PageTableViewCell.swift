//
//  PageTableViewCell.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import UIKit

class PageTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
