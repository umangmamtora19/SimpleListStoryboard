//
//  PeopleTVC.swift
//  SimpleListExample
//
//  Created by Umang on 28/06/23.
//

import UIKit

class PeopleTVC: UITableViewCell {

//    MARK: - OUTLETS
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgProfile.setCircularCorner()
    }

}
