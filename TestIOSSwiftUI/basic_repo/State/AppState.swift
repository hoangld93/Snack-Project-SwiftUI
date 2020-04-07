//
//  AppState.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 4/7/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation
import SwiftUI

class AppState: ObservableObject {
    @Published var session = ""
    @Published var deviceUUID = ""
    @Published var userName = ""
    @Published var password = ""
    
    init() {
        if (session.isEmpty) {
            updateSessionInStore()
        }
    }
    
    func updateSessionInStore() {
        session = ""
    }
    
    func setSessionInStore(session: String) {
        // do something
    }
}
