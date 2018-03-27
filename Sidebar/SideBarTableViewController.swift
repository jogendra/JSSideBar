//
//  SideBarTableViewController.swift
//  Technex18
//
//  Created by JOGENDRA on 25/03/17.
//  Copyright © 2017 Jogendra Singh. All rights reserved.
//

import UIKit

protocol SideBarTableViewControllerDelegate {
    func SideBarControlDidSelectRow(_ indexPath: IndexPath)
}

class SideBarTableViewController: UITableViewController {

    var delegate: SideBarTableViewControllerDelegate?
    var tableData: Array<String> = []
    var leftIcons: [String]? = []
    var selectedView: UIView?
    let rowHeight: CGFloat = 50.0
    let sectionHeaderHeight: CGFloat = 0.0
    var headerView: UIView?
    let cellBackgroundColor: UIColor? = UIColor.clear
    let cellTextLabelColor: UIColor? = UIColor.init(red: 100/255, green: 100/255, blue: 100/255, alpha: 1.0)
    let cellHighlighetTextColor: UIColor? = UIColor.white
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?  = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
            
            // Configure the cell...
            cell!.backgroundColor = cellBackgroundColor
            cell!.textLabel?.textColor = cellTextLabelColor
            
            // Selected view
            selectedView = UIView(frame: CGRect(x: 0, y: 0, width: cell!.frame.size.width, height: cell!.frame.size.height))
            selectedView?.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            
            cell?.textLabel?.highlightedTextColor = cellHighlighetTextColor
            
            cell!.selectedBackgroundView = selectedView
            
            
        }
        
        // Set left icons to the cell
        if let leftIcons = leftIcons, leftIcons.count > 0 {
            cell?.imageView?.bounds = CGRect(x: 0, y: 0, width: 10, height: 10)
            
            cell?.imageView?.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
            cell?.imageView?.contentMode = .scaleAspectFit
            cell?.imageView?.image = UIImage(named: leftIcons[indexPath.row])
        }
        
        cell!.textLabel?.text = tableData[indexPath.row]
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.SideBarControlDidSelectRow(indexPath)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.tableView.sectionHeaderHeight = sectionHeaderHeight
        headerView = UIView(frame: CGRect.zero)
        return headerView
    }
    
}
