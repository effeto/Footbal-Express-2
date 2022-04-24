//
//  MyBidTableViewCell.swift
//  Fotball Express
//
//  Created by Демьян on 24.04.2022.
//

import UIKit

class MyBidTableViewCell: UITableViewCell {
    
    let constants = Constants()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setTeamImage()
        setSelectedTeamLabel()
        setWinLabel()
       
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
    
    let teamImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let selectedTeam: UILabel = {
        let team = UILabel()
        team.textAlignment = .left
        team.translatesAutoresizingMaskIntoConstraints = false
        team.font = UIFont.boldSystemFont(ofSize: 21)
        team.textColor = Constants().textColor
        return team
    }()
    
    let winLabel: UILabel = {
        let win = UILabel()
        win.textAlignment = .center
        win.translatesAutoresizingMaskIntoConstraints = false
        win.font = UIFont.boldSystemFont(ofSize: 24)
        win.textColor = Constants().textColor
        return win
    }()
    
    func setUpView() {
        addSubview(view)
        view.backgroundColor = constants.cellColor
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        view.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setTeamImage() {
        addSubview(teamImage)
        teamImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        teamImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        teamImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        teamImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setSelectedTeamLabel() {
        addSubview(selectedTeam)
        selectedTeam.leftAnchor.constraint(equalTo: teamImage.rightAnchor, constant: 10).isActive = true
        selectedTeam.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setWinLabel() {
        addSubview(winLabel)
        winLabel.leftAnchor.constraint(equalTo: selectedTeam.rightAnchor, constant: 10).isActive = true
        winLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    

}
