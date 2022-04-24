//
//  MyBidsView.swift
//  Fotball Express
//
//  Created by Демьян on 24.04.2022.
//

import UIKit

class MyBidsView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
        backgroundColor = Constants().viewBackgroundColor
        addSubview(myBidsTable)
        setTableView()
    }
    
    let myBidsTable:UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .red
        tableView.automaticallyAdjustsScrollIndicatorInsets = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 75
        tableView.register(MyBidTableViewCell.self, forCellReuseIdentifier: Constants().myBidsIndentifier)
        tableView.backgroundColor = Constants().viewBackgroundColor
        
        
        
        return tableView
        
    }()
    
    func setTableView() {
        myBidsTable.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        myBidsTable.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        myBidsTable.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        myBidsTable.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }

}
