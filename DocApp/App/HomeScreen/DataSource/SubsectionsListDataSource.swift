//
//  SubsectionsListDataSourve.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//
import UIKit

class SubsectionsListDataSourceDataSource : NSObject ,UITableViewDelegate, UITableViewDataSource{
    //MARK: - Properties
    var subsectionsList = ["1", "2", "3"]
    
    //MARK: - Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subsectionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(SubSubsectionTableViewCell.self, for: indexPath)
        cell.selectionStyle = .none

        return cell
    }
}
