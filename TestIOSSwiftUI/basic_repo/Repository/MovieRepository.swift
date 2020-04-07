//
//  MovieData.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 4/1/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import Alamofire

final class MovieRepository {
    
    var apiService: APIService
    
    init() {
        apiService = APIService()
    }
    
    func getData() {
        //                guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=4bba104c148c5e6386556e64925f7274") else { return }
        //                URLSession.shared.dataTask(with: url){ (data, _, _) in
        //                    guard let data = data else { return }
        //                    let movies = try! JSONDecoder().decode(MovieList.self, from: data)
        //                    DispatchQueue.main.async {
        //                        self.movies = movies.results
        //                    }
        //                    }.resume()
    }
    
    func getMovieRemote(params: Parameters?, completionHandler: @escaping (AFDataResponse<MovieList>) -> Void) {
        apiService.getMovieData(params: params, completionHandler: completionHandler)
    }
}
