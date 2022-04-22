//
//  MatchBidView.swift
//  Fotball Express
//
//  Created by Демьян on 21.04.2022.
//

import UIKit

class MatchBidView: UIView {

    
    var team1name = ""
    var team2name = ""
    var team1Image = UIImage()
    var team2Image = UIImage()
    var team1Odd = 0.0
    var team2Odd = 0.0
    let oddTitle = "  Odds: "
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        backgroundColor = Constants().viewBackgroundColor

    }

}
