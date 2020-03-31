//
//  NetworkManager.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 3/25/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Combine
import SwiftUI
import Alamofire

class NetworkManager: ObservableObject {
//    var didChange = PassthroughSubject<NetworkManager, Never>()
//    var movies = MovieList(results: []){
//        didSet {
//            didChange.send(self)
//        }
//    }
    
    @Published var movies = MovieList(results: [])
    
    init() {
//        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=4bba104c148c5e6386556e64925f7274") else { return }
        //        URLSession.shared.dataTask(with: url){ (data, _, _) in
        //            guard let data = data else { return }
        //            let movies = try! JSONDecoder().decode(MovieList.self, from: data)
        //            DispatchQueue.main.async {
        //                self.movies = movies
        //            }
        //        }.resume()
        
        AF.request("https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=4bba104c148c5e6386556e64925f7274").responseDecodable(of: MovieList.self) { response in
            
            debugPrint("Response: \(response)")
            
            switch(response.result) {
            case .success(let moviesResponse):
                print(moviesResponse)
                self.movies = moviesResponse
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
