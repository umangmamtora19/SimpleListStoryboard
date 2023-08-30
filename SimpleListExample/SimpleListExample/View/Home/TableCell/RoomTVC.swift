//
//  RoomTVC.swift
//  SimpleListExample
//
//  Created by Umang on 28/06/23.
//

import UIKit

class RoomTVC: UITableViewCell {
    
//    MARK: - OUTLETS
    @IBOutlet weak var lblCreatedAt: UILabel!
    @IBOutlet weak var lblRoomID: UILabel!
    @IBOutlet weak var lblMaxOccupancy: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.setCorner(radius: 15)
    }
 
}
