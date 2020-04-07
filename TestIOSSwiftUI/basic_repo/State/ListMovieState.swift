//
//  ListMovieState.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 4/6/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation
import SwiftUI
import Alamofire

class ListMovieState : ObservableObject {
    
    @Published var movies = [Movie]()
    @Published var loading = false
    @Published var loadableState = LoadAbleState.loading
    
    var movieRepository = MovieRepository()
    
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
    
    func getData(params: Parameters?) {
        loading = true
        movieRepository.getMovieRemote(params: params,  completionHandler: { response in
            
            debugPrint("Response: \(response)")
            
            switch(response.result) {
            case .success(let moviesResponse):
                print(moviesResponse)
                self.movies = moviesResponse.results
//                self.loading = false
                self.loadableState = LoadAbleState.success
                
            case .failure(let error):
                print(error)
//                self.loading = false
                self.loadableState = LoadAbleState.error
            }
        }
        )
    }
    
    func toggleFavorite(movie: Movie, isFavorite: Bool) {
        if (movies.isEmpty) {
            return
        }
        let pos = movies.firstIndex(where: { $0.id == movie.id })!
        movies[pos].isFavorite = isFavorite
    }
    
    func isFavorite(movie: Movie) -> Bool {
        if (movies.isEmpty) {
            return false
        }
        let pos = movies.firstIndex(where: { $0.id == movie.id })!
        return movies[pos].isFavorite ?? false
    }
}

