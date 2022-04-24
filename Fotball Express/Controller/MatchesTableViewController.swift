//
//  MatchesTableViewController.swift
//  Fotball Express
//
//  Created by Демьян on 21.04.2022.
//

import UIKit
import Firebase
import FirebaseFirestore


class MatchesTableViewController: UIViewController {
    
    var matchesView = MatchesView()
    let storage = Storage.storage()
    
    var matchesTable = UITableView()
    var matches:[Matches] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Matches"
        setView()
        getData()
        setNavigationBar()
        
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
        cell.odd1Label.text = String(matches[indexPath.row].team1odd)
        cell.odd2Label.text = String(matches[indexPath.row].team2odd)
        cell.team1Label.text = matches[indexPath.row].team1name
        cell.team2Label.text = matches[indexPath.row].team2name
      
        
        let backgroudView = UIView()
        backgroudView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroudView
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let bidVC = MatchBidViewController()
        bidVC.team2Image = matches[indexPath.row].team2Image ??  UIImage(named: Constants().noImage)!
        bidVC.team1name = matches[indexPath.row].team1name
        bidVC.team2name = matches[indexPath.row].team2name
        bidVC.team1Odd = matches[indexPath.row].team1odd
        bidVC.team2Odd = matches[indexPath.row].team2odd
        bidVC.title = String(matches[indexPath.row].team1name + " vs " + matches[indexPath.row].team2name)
        navigationController?.pushViewController(bidVC, animated: false)
    }
    
}

////fetch Data from model
extension MatchesTableViewController {
    
    public func getData() {
        let db = Firestore.firestore()
        
        db.collection("matches").getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documers: \(err)")
            }else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    self.matches = querySnapshot!.documents.map { d in
                        
                        return Matches(id: d.documentID,
                                       team1name: d["team1name"] as? String ?? "",
                                       team2name: d["team2name"] as? String ?? "",
                                       team1odd: d["team1odd"] as? Double ?? 0.0,
                                       team2odd: d["team2odd"] as? Double ?? 0.0,
                                       team1Image: nil,
                                       team2Image: nil)
                    }
                    self.matchesTable.reloadData()
                }
            }
        }
        
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
            let mybidsVC = MyBidsViewController()
            self.navigationController?.pushViewController(mybidsVC, animated: true)
            mybidsVC.modalPresentationStyle = .currentContext
        }
        
    }
