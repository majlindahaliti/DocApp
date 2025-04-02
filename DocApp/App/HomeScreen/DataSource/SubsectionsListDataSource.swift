//
//  SubsectionsListDataSourve.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//
import UIKit
protocol SubsectionsListDataSourceDataSourceProtocol: AnyObject{
    func showDetails(item: ItemItem)
}
class SubsectionsListDataSourceDataSource : NSObject ,UITableViewDelegate, UITableViewDataSource{
    //MARK: - Properties
    var subsectionsList: [ItemItem]?
    var delegate: SubsectionsListDataSourceDataSourceProtocol?
    //MARK: - Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subsectionsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(SubSubsectionTableViewCell.self, for: indexPath)
        cell.selectionStyle = .none
        cell.sectionItem = subsectionsList?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if subsectionsList?[indexPath.row].items?.isEmpty != false, let item = subsectionsList?[indexPath.row]{
            self.delegate?.showDetails(item: item)
        }
    }
}
