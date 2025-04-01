//
//  SectionsListDataSource.swift
//  DocApp
//
//  Created by Majlinda on 1.4.25.
//

import UIKit

protocol SectionsListDataSourceProtocol: AnyObject {
    func itemTapped(item: SectionItem, hasChilds: Bool)
    func updateSection(section: [Int])
    func selectedRow(row: Int, hasChild: Bool)
}

class SectionsListDataSource: NSObject {
    // MARK: - Properties
    var items: [(section: SectionItem, mItems: [SectionItem])] = [
        (SectionItem(title: "Section 1"), [SectionItem(title: "Item 1.1"), SectionItem(title: "Item 1.2")]),
        (SectionItem(title: "Section 2"), [SectionItem(title: "Item 2.1"), SectionItem(title: "Item 2.2")]),
        (SectionItem(title: "Section 3"), [SectionItem(title: "Item 3.1"), SectionItem(title: "Item 3.2")])
    ]
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
        return (self.expandedSectionHeaderNumber == section) ? items[section].mItems.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self[indexPath]
        let cell = tableView.dequeue(SubsectionTableViewCell.self, for: indexPath)
//        cell.setRowText(string: item.title)
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
        
        if items[section].mItems.count > 0 {
            headerView.expnad(should: self.expandedSectionHeaderNumber == section)
        }else{
            headerView.detailImageView.isHidden = true
        }
        return headerView
    }
    
    @objc private func sectionHeaderWasTouched(_ sender: UITapGestureRecognizer) {
        let headerView = sender.view as! UITableViewHeaderFooterView
        let section    = headerView.tag
        let item = self.items[section].section
        self.delegate?.itemTapped(item: item, hasChilds: items[section].mItems.count > 0)
        self.delegate?.selectedRow(row: section, hasChild: items[section].mItems.count > 0)
        
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
    subscript(indexPath: IndexPath) -> SectionItem {
        return self.items[indexPath.section].mItems[indexPath.row]
    }
    
    subscript(section: Int) -> SectionItem {
        return self.items[section].section
    }
}

struct SectionItem {
    let title: String
}


