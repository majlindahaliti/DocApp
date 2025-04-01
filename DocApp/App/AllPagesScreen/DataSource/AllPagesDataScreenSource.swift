//
//  AllPagesDataScreenSource.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import Foundation
import UIKit

class AllPagesDataSource : NSObject ,UITableViewDelegate, UITableViewDataSource{
    //MARK: - Properties
    var allPages = ["1", "2", "3"]
    
    //MARK: - Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(PageTableViewCell.self, for: indexPath)
        cell.selectionStyle = .none
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
