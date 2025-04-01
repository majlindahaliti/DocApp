//
//  SubsectionTableViewCell.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import UIKit

class SubsectionTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: ContentSizedTableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    var viewModel: HomeScreenViewModelProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTable()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupTable(){
        self.viewModel = HomeScreenViewModel()
        self.tableView.dataSource = self.viewModel?.subsectionsDataSource
        self.tableView.register(SubSubsectionTableViewCell.self)
        self.tableViewHeightConstraint.constant = self.tableView.intrinsicContentSize.height
    }
}
