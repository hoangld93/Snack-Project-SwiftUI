//
//  APIService.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 4/4/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation
import Alamofire
import SwiftUI
import Combine

let API_GET_MOVIE = "3/discover/movie"
let API_POST_MOVIE = "abc"
let API_UPLOAD_MOVIE = "xyz"

class APIService {
    
    var restClient = RestClient()
    
    func getMovieData(params: Parameters?, completionHandler: @escaping (AFDataResponse<MovieList>) -> Void) {
        restClient.getAFRestClient(method: .get, endpoint: API_GET_MOVIE, headers: nil, param: params).responseDecodable(completionHandler: completionHandler)
    }
}
