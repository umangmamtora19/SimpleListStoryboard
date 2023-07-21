//
//  ViewController.swift
//  SimpleListExample
//
//  Created by Umang on 28/06/23.
//

import UIKit
import SDWebImage
import Combine

class HomeVC: UIViewController {
    
//    MARK: - OUTLETS
    @IBOutlet weak var tblPeople: UITableView!
    @IBOutlet weak var segPeople: UISegmentedControl!
    
//    MARK: - VARIABLES
    let homeVM = HomeViewModel()
    private var cancellable: AnyCancellable?
    
//    MARK: - VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        cancellable = homeVM.objectWillChange.sink { _ in
            DispatchQueue.main.async {
                self.tblPeople.reloadWithAnimation()
            }
        }
        homeVM.getPeoples()
    }
    
//    MARK: - EVENTS
    @IBAction func segValueChange(_ sender: UISegmentedControl) {
        if segPeople.selectedSegmentIndex == 0 && homeVM.peopleList.isEmpty {
            homeVM.getPeoples()
        } else if homeVM.roomList.isEmpty {
            homeVM.getRoomAvailability()
        }
        self.tblPeople.reloadWithAnimation()
    }
}

//    MARK: - TABLEVIEW DATASOURCE AND DELEGATE METHODS
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return segPeople.selectedSegmentIndex == 0 ? homeVM.peopleList.count : homeVM.roomList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if segPeople.selectedSegmentIndex == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleTVC") as? PeopleTVC else { return UITableViewCell() }
            let cellItem = homeVM.peopleList[indexPath.row]
            cell.imgProfile.sd_setImage(with: URL(string: cellItem.avatar ?? ""))
            cell.lblName.text = "\(cellItem.firstName ?? "") \(cellItem.lastName ?? "")"
            cell.lblEmail.text = cellItem.email
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTVC") as? RoomTVC else { return UITableViewCell() }
            let cellItem = homeVM.roomList[indexPath.row]
            cell.lblCreatedAt.text = ""
            cell.lblRoomID.text = "\(cellItem.id ?? "")"
            cell.lblMaxOccupancy.text = "\(cellItem.maxOccupancy ?? 0)"
            cell.backgroundColor = cellItem.isOccupied ?? false ? UIColor.red.withAlphaComponent(0.1) : UIColor.white
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if segPeople.selectedSegmentIndex == 0 {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "PersonDetailVC") as? PersonDetailVC else { return }
            vc.personVM.person = homeVM.peopleList[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
