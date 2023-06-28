//
//  Constant.swift
//  Practical
//
//  Created by Umang on 23/06/23.
//

import Foundation

let baseURL = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"

func appPrint(_ data: Any) {
    print(data)
}

enum Endpoint: String {
    case people, rooms
}


