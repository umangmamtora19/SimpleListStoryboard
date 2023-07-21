//
//  ProfileDetailVC.swift
//  SimpleListExample
//
//  Created by Umang on 28/06/23.
//

import UIKit

class PersonDetailVC: UIViewController {

    //    MARK: - OUTLETS
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblFavColor: UILabel!
    @IBOutlet weak var lblJobTitle: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    
    //    MARK: - VARIABLES
    var personVM: PersonDetailViewModel = PersonDetailViewModel()

    //    MARK: - VIEW LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Person Details"
        imgProfile.setCircularCorner()
        imgProfile.sd_setImage(with: URL(string: personVM.person?.avatar ?? ""))
        lblName.text = "\(personVM.person?.firstName ?? "") \(personVM.person?.lastName ?? "")"
        lblEmail.text = personVM.person?.email ?? ""
        lblJobTitle.text = personVM.person?.jobtitle ?? ""
        lblFavColor.text = personVM.person?.favouriteColor ?? ""
    }

}
