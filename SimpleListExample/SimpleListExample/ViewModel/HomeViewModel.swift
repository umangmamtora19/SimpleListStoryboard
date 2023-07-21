//
//  HomeViewModel.swift
//  SimpleListExample
//
//  Created by Umang on 28/06/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    //    MARK: - VARIABLES
    @Published var selection = 0
    @Published var peopleList = [People]()
    @Published var roomList = [Room]()
    
    let homeViewService: HomeViewService
    
    //    MARK: - INITIALIZER
    init(homeViewService: HomeViewService = HomeViewService()) {
        self.homeViewService = homeViewService
    }
    
    //    MARK: - USER DEFIEND METHODS
    
    //    This method is used to fetch people list from api.
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
    
    //    This method is used to fetch room list from api
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
