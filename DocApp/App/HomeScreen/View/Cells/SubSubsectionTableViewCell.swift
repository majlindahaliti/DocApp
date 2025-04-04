//
//  SubSubsectionTableViewCell.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import UIKit

class SubSubsectionTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
//    //MARK: - Properties
    var sectionItem: SectionsList!{
        didSet{
            setValues()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValues(){
        self.titleLabel.text = sectionItem.title
        if let cover = sectionItem.src{
            self.coverImageView.isHidden = false
            self.coverImageView.setImage(with: cover)
        }
        else{
            self.coverImageView.isHidden = true
        }
    }
}
