//
//  MatchesView.swift
//  Fotball Express
//
//  Created by Демьян on 21.04.2022.
//

import UIKit

class MatchesView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView() {
        backgroundColor = Constants().viewBackgroundColor
        addSubview(matchesTable)
        setTableView()
    }
    
    let matchesTable:UITableView = {
        let tableView = UITableView()
        
        tableView.backgroundColor = .white
        tableView.automaticallyAdjustsScrollIndicatorInsets = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MatchesTableViewCell.self, forCellReuseIdentifier: Constants().matchesCellIdentifier)
        tableView.backgroundColor = Constants().viewBackgroundColor
        
        
        
        return tableView
        
    }()
    
    func setTableView() {
        matchesTable.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        matchesTable.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        matchesTable.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        matchesTable.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
    
}


