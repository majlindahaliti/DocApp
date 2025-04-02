//
//  AllPagesDataScreenSource.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import Foundation
import UIKit

protocol AllPagesDataSourceProtocol: AnyObject{
    func showMainScreen(item: SectionsList?)
}

class AllPagesDataSource : NSObject ,UITableViewDelegate, UITableViewDataSource{
    //MARK: - Properties
    var allPages: [SectionsList]?
    var delegate: AllPagesDataSourceProtocol?
    
    //MARK: - Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPages?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(PageTableViewCell.self, for: indexPath)
        cell.selectionStyle = .none
        cell.titleLabel.text = allPages?[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.showMainScreen(item: allPages?[indexPath.row])
    }
}
