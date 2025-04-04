//
//  HomeScreenViewController.swift
//  DocApp
//
//  Created by Majlinda on 31.3.25.
//

import UIKit

class HomeScreenViewController: UIViewController, Storyboarded {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var noDataStackView: UIStackView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var seAllPagesButton: UIButton!
    @IBOutlet weak var backButtonHeightConstraint: NSLayoutConstraint!
    
    //MARK: - Properties
    var viewModel: HomeScreenViewModelProtocol?
    var coordinator: HomeScreenCoordinator?
    var sectionsList: [SectionsList]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTable()
    }
    
    //MARK: - Functions
    func setupUI(){
        self.viewModel?.viewDelegate = self
        tableView.sectionHeaderHeight = 0
        tableView.sectionFooterHeight = 0
        dispatch{
            self.containerView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
            self.tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        }
        if self.viewModel?.showBack == false{
            self.backButton.isHidden = true
            self.backButtonHeightConstraint.constant = 0
            getPageDetails()
        }
        else{
            self.seAllPagesButton.isHidden = true
            if let items = self.viewModel?.page{
                self.mainTitleLabel.text = items.title
                if let sections = self.viewModel?.page?.items{
                    self.viewModel?.populateTableView(data: sections)
                }
            }
        }
    }
    
    func setupTable(){
        self.tableView.register(SubsectionTableViewCell.self)
        self.tableView.registerHeaderFooter(PageExpandableSection.self)
        self.tableView.delegate = self.viewModel?.dataSource
        self.tableView.dataSource = self.viewModel?.dataSource
    }
    
    func getPageDetails(){
        // Show loader
        LottieLoader.shared.showLoader()
        self.viewModel?.getPageDetails(completion: { (response, error) in
            // Hide loader
            LottieLoader.shared.hideLoader()
            if let model = response {
                self.sectionsList = model.items
                self.mainTitleLabel.text = model.title
                self.viewModel?.populateTableView(data: model.items)
                if response?.items.count == 0{
                    self.noDataStackView.isHidden = false
                }
                dispatch {
                    self.tableView.reloadData()
                }
            } else if let error = error {
                self.noDataStackView.isHidden = false
                print("Request failed with error: \(error.localizedDescription)")
            }
        })
    }
    
    func filterText(_ searchText: String) {
        viewModel?.filterResults(with: searchText)
        
        //update UI
        self.tableView.reloadData()
        self.noDataStackView.isHidden = !(self.viewModel?.filteredResults?.isEmpty ?? true)

    }
    
    //MARK: - IBActions
    @IBAction func seeAllPagesButtonPressed(_ sender: Any) {
        let filteredData = sectionsList?.filter { $0.type == "page" }
        self.viewModel?.showAllPages(pages: filteredData)
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.coordinator?.stop()
    }
}

extension HomeScreenViewController : HomeScreenViewModelViewProtocol {
    func updateSection(section: [Int]) {
        self.tableView.reloadSections(IndexSet(section), with: .none)
    }
}

extension HomeScreenViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let search = textField.text ?? ""
        filterText(search)
    }
}

//MARK : Coordinated
extension HomeScreenViewController : Coordinated {
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as? HomeScreenCoordinator
    }
}
