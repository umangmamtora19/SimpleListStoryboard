//
//  ProfileDetailVC.swift
//  SimpleListExample
//
//  Created by Umang on 28/06/23.
//

import UIKit

class PersonDetailVC: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblFavColor: UILabel!
    @IBOutlet weak var lblJobTitle: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    
    var person: People?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Person Details"

        imgProfile.setCircularCorner()
        imgProfile.sd_setImage(with: URL(string: person?.avatar ?? ""))
        lblName.text = "\(person?.firstName ?? "") \(person?.lastName ?? "")"
        lblEmail.text = person?.email ?? ""
        lblJobTitle.text = person?.jobtitle ?? ""
        lblFavColor.text = person?.favouriteColor ?? ""
    }

}
