//
//  HomeViewModel.swift
//  SimpleListExample
//
//  Created by Umang on 28/06/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var selection = 0
    @Published var peopleList = [People]()
    @Published var roomList = [Room]()
    
    let homeViewService: HomeViewService
    
    init(homeViewService: HomeViewService = HomeViewService()) {
        self.homeViewService = homeViewService
    }
    
    func getPeoples() {
        CommonUtility.shared.showLoadingIndicator()
        homeViewService.getPeoplesData(method: .get) { [weak self] result in
            guard let `self` = self else { return }
            CommonUtility.shared.hideLoadingIndicator()
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.peopleList.append(contentsOf: response)
                case .failure(let failure):
                    appPrint(failure.localizedDescription)
                }
            }
        }
    }
    
    func getRoomAvailability() {
        CommonUtility.shared.showLoadingIndicator()
        homeViewService.getRoomData(method: .get) { [weak self] result in
            guard let `self` = self else { return }
            CommonUtility.shared.hideLoadingIndicator()
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.roomList.append(contentsOf: response)
                case .failure(let failure):
                    appPrint(failure.localizedDescription)
                }
            }
        }
    }
}
