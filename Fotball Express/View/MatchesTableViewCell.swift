//
//  MatchesTableViewCell.swift
//  Fotball Express
//
//  Created by Демьян on 21.04.2022.
//

import UIKit

class MatchesTableViewCell: UITableViewCell {

    let constants = Constants()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpOddLabel()
        setUpTeam1Label()
        setUpTeam2Label()
        setUpOdd2Label()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let view: UIView = {
        let cellView = UIView()
        cellView.layer.cornerRadius = 10
        cellView.translatesAutoresizingMaskIntoConstraints = false
    
        return cellView
    }()
    
    let team1Label: UILabel = {
        let team1 = UILabel()
        team1.textAlignment = .left
        team1.translatesAutoresizingMaskIntoConstraints = false
        team1.textColor = Constants().textColor
        return team1
    }()
    
    let team2Label: UILabel = {
        let team2 = UILabel()
        team2.textAlignment = .left
        team2.translatesAutoresizingMaskIntoConstraints = false
        team2.textColor = Constants().textColor

        return team2
    }()
    
    let odd1Label: UILabel = {
        let odd = UILabel()
        odd.textAlignment = .center
        odd.translatesAutoresizingMaskIntoConstraints = false
        odd.backgroundColor = .green
        odd.layer.masksToBounds = true
     
        

        return odd
    }()
    
    let odd2Label: UILabel = {
        let odd2 = UILabel()
        odd2.textAlignment = .center
        odd2.translatesAutoresizingMaskIntoConstraints = false
        odd2.backgroundColor = .green
        odd2.layer.masksToBounds = true
        
        return odd2
    }()
    
    
    func setUpView() {
        addSubview(view)
        view.backgroundColor = constants.cellColor
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setUpOddLabel() {
        view.addSubview(odd1Label)
        
        odd1Label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 120).isActive = true
        odd1Label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -205).isActive = true
        odd1Label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5 ).isActive = true
        odd1Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        odd1Label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        odd1Label.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setUpOdd2Label() {
        view.addSubview(odd2Label)
        
        odd2Label.leftAnchor.constraint(equalTo: team2Label.rightAnchor, constant: 10).isActive = true
        odd2Label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        odd2Label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5 ).isActive = true
        odd2Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        odd2Label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        odd2Label.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setUpTeam1Label() {
        view.addSubview(team1Label)
        
        team1Label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        team1Label.rightAnchor.constraint(equalTo: odd1Label.rightAnchor, constant: 5).isActive = true
        team1Label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        team1Label.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setUpTeam2Label() {
        view.addSubview(team2Label)
        
        team2Label.leftAnchor.constraint(equalTo: odd1Label.leftAnchor, constant: 60).isActive = true
        team2Label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        team2Label.heightAnchor.constraint(equalTo: team1Label.heightAnchor).isActive = true
        team2Label.widthAnchor.constraint(equalTo: team1Label.widthAnchor).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            view.backgroundColor = constants.colorWhenSelected
        }else {
            view.backgroundColor = constants.cellColor
        }
    }

}
