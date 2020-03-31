//
//  Movie.swift
//  TestIOSSwiftUI
//
//  Created by Hoang Duy Le on 3/25/20.
//  Copyright © 2020 Hoang KMS. All rights reserved.
//

import Foundation

struct Movie: Decodable, Hashable, Identifiable {
  var vote_count: Int
  var id: Int
  var vote_average: Float
  var title: String
  var poster_path: String
  var original_language: String
  var original_title: String
  var adult: Bool
  var overview: String
  var release_date: String
}

struct MovieList: Decodable {
  var results: [Movie]
}
