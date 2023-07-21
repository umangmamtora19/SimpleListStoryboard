//
//  NetworkMonitor.swift
//
//

import Foundation
import Network

class NetworkMonitor {
    static let shared = NetworkMonitor()

    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachable: Bool { status == .satisfied }
    var isReachableOnCellular: Bool = true

    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            self?.isReachableOnCellular = path.isExpensive

            if path.status == .satisfied {
                appPrint("We're connected!")
                // post connected notification
            } else {
                appPrint("No connection.")
                CommonUtility.shared.showToast("Oppps...you are not connected to internet")
                // post disconnected notification
            }
            appPrint("isExpensive : \(path.isExpensive)")
        }

        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }

    func stopMonitoring() {
        monitor.cancel()
    }
}
