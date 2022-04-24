//
//  MatchBidViewController.swift
//  Fotball Express
//
//  Created by Демьян on 21.04.2022.
//

import UIKit
import Firebase

class MatchBidViewController: UIViewController {
    
    let constants = Constants()
    var matchBidView = MatchBidView()
    let mainVc = MatchesTableViewController()
    let storage = Storage.storage()
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()
    
    let team1ImageView = UIImageView()
    let team2ImageView = UIImageView()
    let selectWinner = UILabel()
    let selectTeam1Btn = UIButton()
    let selectTeam2Btn = UIButton()
    let fiftyBtn = UIButton()
    let oneHundredBtn = UIButton()
    let twoHundredBtn = UIButton()
    let textLabel = UITextField()
    let bidLabel = UILabel()
    let oddLabel = UILabel()
    let winLabel = UILabel()
    let makeBidBtn = UIButton()
    
    
    
    var team1name = ""
    var team2name = ""
    var bid = ""
    var teamSelected: String?
    var bidSeleted: Double?
    var yourWin: Double?
    var team1Image = UIImage()
    var team2Image = UIImage()
    var team1Odd = 0.0
    var team2Odd = 0.0
    let oddTitle = "  Odds: "
    let deafaultWinLAbelTxt = "Select a team and make a bid first"
    var selectedTeam = ""
    var selectedOdds = 0.0
    var selectedBid = 0.0
    var earnSum = 0.0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMatchBidView()
        setImageViewOne()
        setImageViewTwo()
        setSelectWiner()
        setSelectTeam1Btn()
        setSelectTeam2Btn()
        setFiftyBtn()
        setOneHudredBtn()
        setTwoHundredBtn()
        setTextLabel()
        setBidLabel()
        setMakeBidBtn()
        setOddLabel()
        setWinLabel()
        
        
    }
    
    func setMatchBidView() {
        let mainView = MatchBidView(frame: self.view.frame)
        self.matchBidView = mainView
        self.view.addSubview(matchBidView)
        matchBidView.setUpView()
        
    }
}

extension MatchBidViewController{
    func setImageViewOne() {
        let path1Rf = storage.reference(withPath: "\(team1name).png")
        path1Rf.getData(maxSize:1 * 1024 * 1024) { data, error in
            if let error = error {
                self.team1ImageView.image  = UIImage(named: Constants().noImage)!
                print(error.localizedDescription)
            } else {
                let image = UIImage(data: data!)
                self.team1ImageView.image  = image!
            }
        }
        
        //        team1ImageView.image = team1Image
        team1ImageView.translatesAutoresizingMaskIntoConstraints = false
        team1ImageView.backgroundColor = constants.colorWhenSelected
        team1ImageView.layer.cornerRadius = 10
        view.addSubview(team1ImageView)
        
        team1ImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        team1ImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        team1ImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        team1ImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setImageViewTwo() {
        let path2Rf = storage.reference(withPath: "\(team2name).png")
        path2Rf.getData(maxSize:1 * 1024 * 1024) { data, error in
            if let error = error {
                self.team2ImageView.image  = UIImage(named: Constants().noImage)!
                print(error.localizedDescription)
            } else {
                // Data for "images/island.jpg" is returned
                
                let image = UIImage(data: data!)
                self.team2ImageView.image  = image!
            }
        }
        team2ImageView.translatesAutoresizingMaskIntoConstraints = false
        team2ImageView.backgroundColor = constants.colorWhenSelected
        team2ImageView.layer.cornerRadius = 10
        view.addSubview(team2ImageView)
        
        team2ImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        team2ImageView.leftAnchor.constraint(equalTo: team1ImageView.rightAnchor, constant: 40).isActive = true
        team2ImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        team2ImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func setSelectWiner() {
        selectWinner.text = "Select Your Winner"
        selectWinner.backgroundColor = constants.cellColor
        selectWinner.layer.cornerRadius = 10
        selectWinner.textAlignment = .center
        selectWinner.textColor = .white
        selectWinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(selectWinner)
        
        selectWinner.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
        selectWinner.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45).isActive = true
        selectWinner.heightAnchor.constraint(equalToConstant: 25).isActive = true
        selectWinner.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func setSelectTeam1Btn() {
        selectTeam1Btn.backgroundColor = .gray
        selectTeam1Btn.setTitle(team1name + oddTitle + String(team1Odd), for: .normal)
        selectTeam1Btn.titleLabel?.font = UIFont(name: "San Francisco", size: 10)
        selectTeam1Btn.translatesAutoresizingMaskIntoConstraints = false
        selectTeam1Btn.layer.cornerRadius = 10
        selectTeam1Btn.addTarget(self, action: #selector(team1BtnPresed), for: .touchUpInside)
        
        self.view.addSubview(selectTeam1Btn)
        
        selectTeam1Btn.topAnchor.constraint(equalTo: team1ImageView.bottomAnchor, constant: 10).isActive = true
        selectTeam1Btn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        selectTeam1Btn.widthAnchor.constraint(equalTo:team1ImageView.widthAnchor).isActive = true
        selectTeam1Btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setSelectTeam2Btn() {
        selectTeam2Btn.backgroundColor = .gray
        selectTeam2Btn.setTitle(team2name + oddTitle + String(team2Odd), for: .normal)
        selectTeam2Btn.titleLabel?.font = UIFont(name: "San Francisco", size: 10)
        selectTeam2Btn.translatesAutoresizingMaskIntoConstraints = false
        selectTeam2Btn.layer.cornerRadius = 10
        selectTeam2Btn.addTarget(self, action: #selector(team2BtnPressed), for: .touchUpInside)
        
        self.view.addSubview(selectTeam2Btn)
        
        selectTeam2Btn.topAnchor.constraint(equalTo: team2ImageView.bottomAnchor, constant: 10).isActive = true
        selectTeam2Btn.leftAnchor.constraint(equalTo: selectTeam1Btn.rightAnchor, constant: 40).isActive = true
        selectTeam2Btn.widthAnchor.constraint(equalTo:team1ImageView.widthAnchor).isActive = true
        selectTeam2Btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setFiftyBtn() {
        fiftyBtn.backgroundColor = .gray
        fiftyBtn.translatesAutoresizingMaskIntoConstraints = false
        fiftyBtn.setTitle("Bid 50$", for: .normal)
        fiftyBtn.layer.cornerRadius = 10
        fiftyBtn.addTarget(self, action: #selector(fiftydBtnTapped), for: .touchUpInside)
        fiftyBtn.isEnabled = false
        
        self.view.addSubview(fiftyBtn)
        
        fiftyBtn.topAnchor.constraint(equalTo: selectTeam1Btn.bottomAnchor, constant: 10).isActive = true
        fiftyBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        fiftyBtn.widthAnchor.constraint(equalToConstant: 75).isActive = true
        fiftyBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    
    func setOneHudredBtn() {
        oneHundredBtn.backgroundColor = .gray
        oneHundredBtn.translatesAutoresizingMaskIntoConstraints = false
        oneHundredBtn.setTitle("Bid 100$", for: .normal)
        oneHundredBtn.layer.cornerRadius = 10
        oneHundredBtn.addTarget(self, action: #selector(onehudredBtnTapped), for: .touchUpInside)
        oneHundredBtn.isEnabled = false
        
        self.view.addSubview(oneHundredBtn)
        
        oneHundredBtn.topAnchor.constraint(equalTo: selectTeam1Btn.bottomAnchor, constant: 10).isActive = true
        oneHundredBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        oneHundredBtn.widthAnchor.constraint(equalToConstant: 75).isActive = true
        oneHundredBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setTwoHundredBtn() {
        twoHundredBtn.backgroundColor = .gray
        twoHundredBtn.translatesAutoresizingMaskIntoConstraints = false
        twoHundredBtn.setTitle("Bid 200$", for: .normal)
        twoHundredBtn.layer.cornerRadius = 10
        twoHundredBtn.addTarget(self, action: #selector(twoHudredBtnTapped), for: .touchUpInside)
        twoHundredBtn.isEnabled = false
        
        self.view.addSubview(twoHundredBtn)
        
        twoHundredBtn.topAnchor.constraint(equalTo: selectTeam1Btn.bottomAnchor, constant: 10).isActive = true
        twoHundredBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant:  -25).isActive = true
        twoHundredBtn.widthAnchor.constraint(equalToConstant: 75).isActive = true
        twoHundredBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setTextLabel() {
        textLabel.backgroundColor = .systemGray
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.placeholder = "Enter Your Own Sum"
        textLabel.textAlignment = .center
        textLabel.layer.cornerRadius = 10
        textLabel.keyboardType = .numberPad
        textLabel.delegate = self
        textLabel.isEnabled = false
        textLabel.addTarget(self, action: #selector(sendTextToLabel), for: .editingChanged)
        
        self.view.addSubview(textLabel)
        
        textLabel.topAnchor.constraint(equalTo: oneHundredBtn.bottomAnchor, constant: 10).isActive = true
        textLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        textLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func setBidLabel() {
        bidLabel.text = "Select a team first"
        bidLabel.backgroundColor = constants.cellColor
        bidLabel.layer.cornerRadius = 10
        bidLabel.lineBreakMode = .byWordWrapping
        bidLabel.textAlignment = .center
        bidLabel.textColor = .white
        bidLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bidLabel)
        
        bidLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10).isActive = true
        bidLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        bidLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        bidLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func setMakeBidBtn() {
        makeBidBtn.backgroundColor = .gray
        makeBidBtn.setTitle("Make Bid", for: .normal)
        makeBidBtn.titleLabel?.font = UIFont(name: "San Francisco", size: 10)
        makeBidBtn.translatesAutoresizingMaskIntoConstraints = false
        makeBidBtn.layer.cornerRadius = 10
        makeBidBtn.addTarget(self, action: #selector(makeBidTapped), for: .touchUpInside)
        
        view.addSubview(makeBidBtn)
        
        makeBidBtn.topAnchor.constraint(equalTo: bidLabel.bottomAnchor, constant: 200).isActive = true
        makeBidBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100).isActive = true
        makeBidBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -100).isActive = true
        makeBidBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setOddLabel() {
        oddLabel.text = "Make a bid first"
        oddLabel.backgroundColor = constants.cellColor
        oddLabel.layer.cornerRadius = 10
        oddLabel.lineBreakMode = .byWordWrapping
        oddLabel.textAlignment = .center
        oddLabel.textColor = .white
        oddLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(oddLabel)
        
        oddLabel.topAnchor.constraint(equalTo: bidLabel.bottomAnchor, constant: 10).isActive = true
        oddLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        oddLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
        oddLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
    }
    func setWinLabel() {
        winLabel.text = deafaultWinLAbelTxt
        winLabel.backgroundColor = constants.cellColor
        winLabel.layer.cornerRadius = 10
        winLabel.lineBreakMode = .byWordWrapping
        winLabel.textAlignment = .center
        winLabel.textColor = .white
        winLabel.translatesAutoresizingMaskIntoConstraints = false
        winLabel.numberOfLines = 0
        
        
        view.addSubview(winLabel)
        
        winLabel.topAnchor.constraint(equalTo: oddLabel.bottomAnchor, constant: 10).isActive = true
        winLabel.bottomAnchor.constraint(equalTo: makeBidBtn.topAnchor, constant: -10).isActive = true
        winLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
        winLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -25).isActive = true
    }
}




extension MatchBidViewController{
    @objc func team1BtnPresed() {
        teamChoice(butt1: selectTeam1Btn, butt2: selectTeam2Btn)
        if selectTeam1Btn.isSelected {
            selectedTeam = team1name
            selectedOdds = team1Odd
            print(selectedTeam)
        }
    }
    
    @objc func team2BtnPressed() {
        teamChoice(butt1: selectTeam2Btn, butt2: selectTeam1Btn)
        if selectTeam2Btn.isSelected {
            selectedTeam = team2name
            selectedOdds = team2Odd
            print(selectedTeam)
            
        }
    }
    
    
    @objc func fiftydBtnTapped() {
        bidsChoice(butt1: fiftyBtn, butt2: oneHundredBtn, butt3: twoHundredBtn)
        if fiftyBtn.isSelected {
            selectedBid = 50.0
            print(selectedBid)
        }
        
    }
    
    @objc func onehudredBtnTapped() {
        bidsChoice(butt1: oneHundredBtn, butt2: twoHundredBtn, butt3: fiftyBtn)
        if oneHundredBtn.isSelected {
            selectedBid = 100.0
            print(selectedBid)
            
        }
    }
    
    @objc func twoHudredBtnTapped() {
        if twoHundredBtn.isEnabled {
            bidsChoice(butt1: twoHundredBtn, butt2: oneHundredBtn, butt3: fiftyBtn)
            selectedBid = 200.0
            print(selectedBid)
            
        }
    }
    
    @objc func makeBidTapped() {
        ref = db.collection("userBids").addDocument(data: [
            "selectedTeam": selectedTeam,
            "selectedBid":selectedBid,
            "selectedOdds": selectedOdds,
            "earnSum": earnSum
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(self.ref!.documentID)")
            }
        }
    }
    
    func teamChoice(butt1:UIButton, butt2: UIButton) {
        butt1.isSelected = !butt1.isSelected
        if butt1.isSelected && !butt2.isSelected{
            butt1.backgroundColor = constants.colorWhenSelected
            if let _ = butt1.currentTitle {
                teamSelected = butt1.currentTitle
                bidLabel.text = "Team Slected: " + teamSelected!
            }
            butt2.isEnabled = false
            fiftyBtn.isEnabled = true
            oneHundredBtn.isEnabled = true
            twoHundredBtn.isEnabled = true
            textLabel.isEnabled = true
        }else{
            butt1.backgroundColor = .gray
            bidLabel.text = "Select a team first"
            butt2.isEnabled = true
            fiftyBtn.isEnabled = false
            oneHundredBtn.isEnabled = false
            twoHundredBtn.isEnabled = false
            textLabel.isEnabled = false
        }
    }
    
    func bidsChoice(butt1:UIButton, butt2: UIButton, butt3: UIButton)  {
        if textLabel.isSelected {
            fiftyBtn.isEnabled = false
            oneHundredBtn.isEnabled = false
            twoHundredBtn.isEnabled = false
        }else{
            fiftyBtn.isEnabled = true
            oneHundredBtn.isEnabled = true
            twoHundredBtn.isEnabled = true
            butt1.isSelected = !butt1.isSelected
            if butt1.isSelected && !butt2.isSelected && !butt3.isSelected && !textLabel.isSelected{
                butt1.backgroundColor = constants.colorWhenSelected
                if let _ = butt1.currentTitle{
                    bid = butt1.currentTitle!
                    oddLabel.text = bid
                }
                earnSum = winMath(odd: selectedOdds, bid: selectedBid)
                makeBidBtn.backgroundColor = constants.colorWhenSelected
                makeBidBtn.isEnabled = true
                butt2.isEnabled = false
                butt3.isEnabled = false
                textLabel.isEnabled = false
                print("Sum: \(winMath(odd: selectedOdds, bid: selectedBid))")
            }else {
                butt1.backgroundColor = .gray
                oddLabel.text = "Select a bid first"
                butt2.isEnabled = true
                butt3.isEnabled = true
                textLabel.isEnabled = true
                makeBidBtn.backgroundColor = .gray
                makeBidBtn.isEnabled = false
                winLabel.text = deafaultWinLAbelTxt
            }
        }
    }
}

extension MatchBidViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textLabel.self.endEditing(true)
    }
    
    @objc func sendTextToLabel() {
        
        if let _ = textLabel.text {
            bid = textLabel.text!
            oddLabel.text =  "Your bid: " + bid
            selectedBid = Double(bid) ?? 0.0
            fiftyBtn.isEnabled = false
            oneHundredBtn.isEnabled = false
            twoHundredBtn.isEnabled = false
            earnSum = winMath(odd: selectedOdds, bid: selectedBid)
            makeBidBtn.backgroundColor = constants.colorWhenSelected
            makeBidBtn.isEnabled = true
            
            print("Sum: \(winMath(odd: selectedOdds, bid: selectedBid))")
            print(selectedBid)
            
        }
        if textLabel.text == "" {
            fiftyBtn.isEnabled = true
            oneHundredBtn.isEnabled = true
            twoHundredBtn.isEnabled = true
            oddLabel.text = "Make a bid first"
            print(selectedBid)
            makeBidBtn.backgroundColor = .gray
            makeBidBtn.isEnabled = false
            winLabel.text = deafaultWinLAbelTxt
        }
    }
    
    @objc func sentToWinTable() {
        

       
        
    }
    
    func winMath (odd: Double, bid: Double ) -> Double {
            let sum = odd * bid

            winLabel.text = "If \(selectedTeam) win, you wil earn \(sum)$"
            return sum
    }
}
