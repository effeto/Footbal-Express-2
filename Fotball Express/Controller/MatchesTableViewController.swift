//
//  MatchesTableViewController.swift
//  Fotball Express
//
//  Created by Демьян on 21.04.2022.
//

import UIKit

class MatchesTableViewController: UIViewController {

    var matchesView = MatchesView()
    
    
    var matchesTable = UITableView()
    var matches:[Matches] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Matches"
        setView()
        setNavigationBar()
        matches = fetchData()
    }
    
    func setView() {
        let mainView = MatchesView(frame: self.view.frame)
        self.matchesView = mainView
        self.view.addSubview(matchesView)
        matchesView.setView()
        matchesTable = matchesView.matchesTable
        matchesTable.dataSource = self
        matchesTable.delegate = self
        
        
    }
}



//Set tabel view abd cell
extension MatchesTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = matchesTable.dequeueReusableCell(withIdentifier: Constants().matchesCellIdentifier, for: indexPath) as! MatchesTableViewCell
        cell.backgroundColor = UIColor.clear
        cell.odd1Label.text = String(matches[indexPath.row].odd1)
        cell.odd2Label.text = String(matches[indexPath.row].odd2)
        cell.team1Label.text = matches[indexPath.row].team1
        cell.team2Label.text = matches[indexPath.row].team2
        
        let backgroudView = UIView()
        backgroudView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroudView
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let bidVC = MatchBidViewController()
        bidVC.team1Image = matches[indexPath.row].team1Image ??  UIImage(named: Constants().noImage)!
        bidVC.team2Image = matches[indexPath.row].team2Image ??  UIImage(named: Constants().noImage)!
        bidVC.team1name = matches[indexPath.row].team1
        bidVC.team2name = matches[indexPath.row].team2
        bidVC.team1Odd = matches[indexPath.row].odd1
        bidVC.team2Odd = matches[indexPath.row].odd2
        bidVC.title = String(matches[indexPath.row].team1 + " vs " + matches[indexPath.row].team2)
        navigationController?.pushViewController(bidVC, animated: false)
    }
    
}

////fetch Data from model
extension MatchesTableViewController {
    public func fetchData() -> [Matches] {
        let match1 = Matches(odd1: 1.0,odd2: 0.3, team1: "Ravens", team2: "Bills", team1Image: UIImage(named: Constants().ravensImage), team2Image: UIImage(named: Constants().billsImage))
        let match2 = Matches(odd1: 3.0,odd2: 2.5, team1: "Raiders", team2: "SeaHawks", team1Image: nil, team2Image: nil)
        let match3 = Matches(odd1: 0.5,odd2: 1.0, team1: "Bears", team2: "Eagles", team1Image: nil, team2Image: nil)
        
        return [match1, match2, match3]
    }
    
}

//set navigation bar
extension MatchesTableViewController {
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 44))
        title = "Matches"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "My Bids",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(goToMyBids))
        self.view.addSubview(navBar)
    }
    
    @objc private func goToMyBids() {
        
    }

}
