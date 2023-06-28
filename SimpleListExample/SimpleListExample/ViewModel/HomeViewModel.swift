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
    
    func getPeoples() {
        var request = URLRequest(url: URL(string: baseURL + Endpoint.people.rawValue)!)
        request.httpMethod = "GET"
        
        CommonUtility.shared.showLoadingIndicator()
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data) as? [[String: Any]] ?? []
                        appPrint(json)
                        json.forEach { dic in
                            self.peopleList.append(People(fromDictionary: dic))
                        }
                        CommonUtility.shared.hideLoadingIndicator()
                    } catch (let decodingError) {
                        CommonUtility.shared.hideLoadingIndicator()
                        appPrint(decodingError.localizedDescription)
                    }
                } else {
                    CommonUtility.shared.hideLoadingIndicator()
                    appPrint(error?.localizedDescription ?? "")
                }
            }
        }.resume()
    }
    
    func getRoomAvailability() {
        var request = URLRequest(url: URL(string: baseURL + Endpoint.rooms.rawValue)!)
        request.httpMethod = "GET"
        
        CommonUtility.shared.showLoadingIndicator()
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data) as? [[String: Any]] ?? []
                        json.forEach { dic in
                            self.roomList.append(Room(fromDictionary: dic))
                        }
                        CommonUtility.shared.hideLoadingIndicator()
                    } catch (let decodingError) {
                        CommonUtility.shared.hideLoadingIndicator()
                        appPrint(decodingError.localizedDescription)
                    }
                } else {
                    CommonUtility.shared.hideLoadingIndicator()
                    appPrint(error?.localizedDescription ?? "")
                }
            }
        }.resume()
    }
}
