//
//  SectionsListDataSource.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import UIKit

protocol SectionsListDataSourceProtocol: AnyObject {
    func itemTapped(item: ItemItem, hasChilds: Bool)
    func updateSection(section: [Int])
    func selectedRow(row: Int, hasChild: Bool)
}

class SectionsListDataSource: NSObject {
    // MARK: - Properties
    var items: [SectionsList] = []
    var expandedSectionHeaderNumber = -1
    weak var delegate: SectionsListDataSourceProtocol?
}

extension SectionsListDataSource: UITableViewDataSource, UITableViewDelegate {
    // Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self[indexPath]
        self.delegate?.itemTapped(item: item, hasChilds: false)
        self.delegate?.selectedRow(row: indexPath.row, hasChild: false)
    }
    
    // Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.expandedSectionHeaderNumber == section) ? items[section].items.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self[indexPath]
        let cell = tableView.dequeue(SubsectionTableViewCell.self, for: indexPath)
        cell.sectionItem = item
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueHeaderFooter(PageExpandableSection.self)
//        headerView.item = self[section]
        headerView.titleLabel.text = self[section].title
        
        headerView.tag = section
        let headerTapGesture = UITapGestureRecognizer()
        headerTapGesture.addTarget(self, action: #selector(SectionsListDataSource.sectionHeaderWasTouched(_:)))
        headerView.addGestureRecognizer(headerTapGesture)
        
        if items[section].items.count > 0 {
            headerView.expnad(should: self.expandedSectionHeaderNumber == section)
        }else{
            headerView.detailImageView.isHidden = true
        }
        return headerView
    }
    
    @objc private func sectionHeaderWasTouched(_ sender: UITapGestureRecognizer) {
        let headerView = sender.view as! UITableViewHeaderFooterView
        let section    = headerView.tag
        let hasChilds = !self.items[section].items.isEmpty
        if hasChilds, let item = self.items[section].items.first {
            self.delegate?.itemTapped(item: item, hasChilds: hasChilds)
        }
        self.delegate?.selectedRow(row: section, hasChild: hasChilds)
        
        if (self.expandedSectionHeaderNumber == -1) {
            self.expandedSectionHeaderNumber = section
            self.delegate?.updateSection(section: [section])
        } else {
            if (self.expandedSectionHeaderNumber == section) {
                self.expandedSectionHeaderNumber = -1
                self.delegate?.updateSection(section: [section])
                
            } else {
                let old = Int(self.expandedSectionHeaderNumber)
                self.expandedSectionHeaderNumber = section
                
                self.delegate?.updateSection(section: [old, section])
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  70
    }
}

extension SectionsListDataSource {
    subscript(indexPath: IndexPath) -> ItemItem {
        return self.items[indexPath.section].items[indexPath.row]
    }
    
    subscript(section: Int) -> SectionsList {
        return self.items[section]
    }
}

