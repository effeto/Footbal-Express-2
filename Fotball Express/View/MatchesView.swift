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
    
    
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return ViewController().matches.count
    //    }
    //
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //                let cell = matchesTable.dequeueReusableCell(withIdentifier: Constants().matchesCellIdentifier, for: indexPath) as! MatchesTableViewCell
    //                cell.backgroundColor = UIColor.clear
    //                cell.odd1Label.text = String(ViewController().matches[indexPath.row].odd1)
    //                cell.odd2Label.text = String(ViewController().matches[indexPath.row].odd2)
    //                cell.team1Label.text = ViewController().matches[indexPath.row].team1
    //                cell.team2Label.text = ViewController().matches[indexPath.row].team2
    //
    //                let backgroudView = UIView()
    //                backgroudView.backgroundColor = .clear
    //                cell.selectedBackgroundView = backgroudView
    //
    //
    //                return cell
    //    }
}


