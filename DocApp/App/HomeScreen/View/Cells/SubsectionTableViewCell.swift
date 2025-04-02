//
//  SubsectionTableViewCell.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import UIKit

class SubsectionTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: ContentSizedTableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    var viewModel: HomeScreenViewModelProtocol?
    
    //MARK: - Properties
    var sectionItem: ItemItem!{
        didSet{
            setValues()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTable()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupTable(){
        self.viewModel = HomeScreenViewModel(page: nil, showBack: nil)
        self.tableView.dataSource = self.viewModel?.subsectionsDataSource
        self.tableView.delegate = self.viewModel?.subsectionsDataSource
        self.tableView.register(SubSubsectionTableViewCell.self)
    }
    
    func setValues(){
        self.viewModel?.populateSubsections(data: [])
        self.titleLabel.text = sectionItem.title
        if let cover = sectionItem.src{
            self.coverImageView.isHidden = false
            self.coverImageView.setImage(with: cover)
        }
        else{
            self.coverImageView.isHidden = true
        }
        if let subsections = sectionItem.items{
            self.viewModel?.populateSubsections(data: subsections)
        }
        self.tableView.reloadData()
        self.tableViewHeightConstraint.constant = self.tableView.intrinsicContentSize.height
    }
}
