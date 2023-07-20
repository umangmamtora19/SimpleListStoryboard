//
//  HomeService.swift
//  SimpleListExample
//
//  Created by Umang on 19/07/23.
//

import Foundation

protocol HomeViewDelegate {
    func getPeoplesData(method: HTTPMethod, completion: @escaping(Result<[People], APIError>) -> Void)
    func getRoomData(method: HTTPMethod, completion: @escaping(Result<[Room], APIError>) -> Void)

}

class HomeViewService: HomeViewDelegate {
    func getPeoplesData(method: HTTPMethod, completion: @escaping (Result<[People], APIError>) -> Void) {
        NetworkManager().fetchRequest(method: .get, endpoint: .people, params: [:], type: [People].self, completion: completion)
    }
    
    func getRoomData(method: HTTPMethod, completion: @escaping (Result<[Room], APIError>) -> Void) {
        NetworkManager().fetchRequest(method: .get, endpoint: .rooms, params: [:], type: [Room].self, completion: completion)
    }
}
