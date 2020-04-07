//
//  RestClient.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 4/7/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation
import SwiftUI
import Alamofire

let base_url = "https://api.themoviedb.org/"

class RestClient {
    @ObservedObject var appState = AppState()
    
    private func getHeader(paramHeaders: HTTPHeaders?) -> HTTPHeaders {
        var headers = HTTPHeaders()
        headers.add(name: "session", value: appState.session)
        headers.add(name: "device_UUID", value: appState.deviceUUID)
        
//        headers.add(name: "session", value: REQ_HEADERS_SESSION)
//        headers.add(name: "device_UUID", value: REQ_HEADERS_UUID)
        
        if (paramHeaders != nil) {
            paramHeaders?.forEach{ paramHeader in
                headers.add(paramHeader)
            }
        }
        
        return headers
    }
    
    func getAFRestClient(method: HTTPMethod, endpoint: String, headers: HTTPHeaders?, param: Parameters?) -> DataRequest {
        return AF.request(base_url + endpoint, method: method, parameters: param, headers: getHeader(paramHeaders: headers))
    }
    
    func getOtherCombineClient() {
        
    }
}
