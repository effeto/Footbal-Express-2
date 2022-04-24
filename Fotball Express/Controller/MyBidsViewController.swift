//
//  MyBidsViewController.swift
//  Fotball Express
//
//  Created by Демьян on 24.04.2022.
//

import UIKit
import Firebase

class MyBidsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var myBidsView = MyBidsView()
    var myBidsTable = UITableView()
    var myBids:[MyBids] = []
    let storage = Storage.storage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        setView()
    }
    
    func setView() {
        let mainView = MyBidsView(frame: self.view.frame)
        self.myBidsView = mainView
        self.view.addSubview(myBidsView)
        myBidsView.setView()
        myBidsTable = myBidsView.myBidsTable
        myBidsTable.dataSource = self
        myBidsTable.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myBids.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myBidsTable.dequeueReusableCell(withIdentifier: Constants().myBidsIndentifier, for: indexPath) as! MyBidTableViewCell
        let path1Rf = storage.reference(withPath: "\(myBids[indexPath.row].selectedTeam).png")
        path1Rf.getData(maxSize:1 * 1024 * 1024) { data, error in
            if let error = error {
                cell.teamImage.image  = UIImage(named: Constants().noImage)!
                print(error.localizedDescription)
            } else {
                let image = UIImage(data: data!)
                cell.teamImage.image  = image!
            }
        }
        cell.backgroundColor = UIColor.clear
        cell.selectedTeam.text = myBids[indexPath.row].selectedTeam
        let sum = Double(myBids[indexPath.row].earnSum) + myBids[indexPath.row].selectedBid
        cell.winLabel.text = "You win: \(sum) $"
        
        let backgroudView = UIView()
        backgroudView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroudView
        return cell
    }
    
 
    
    public func getData() {
        let db = Firestore.firestore()
        
        db.collection("userBids").getDocuments { (querySnapshot, err) in
            if let err = err {
                print("Error getting documers: \(err)")
            }else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    self.myBids = querySnapshot!.documents.map { d in
                        
                        return MyBids(id: d.documentID,
                                      selectedTeam: d["selectedTeam"] as? String ?? "",
                                      selectedOdd: d["selectedOdd"] as? Double ?? 0.0,
                                      selectedBid: d["selectedBid"] as? Double ?? 0.0,
                                      earnSum: d["earnSum"] as? Double ?? 0.0)
                    }
                    self.myBidsTable.reloadData()
                }
            }
        }
        
    }
    

    


}
