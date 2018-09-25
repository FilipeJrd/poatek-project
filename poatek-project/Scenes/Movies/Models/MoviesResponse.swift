//
//  MoviesResponse.swift
//  poatek-project
//
//  Created by Filipe Jordão on 23/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation

struct MoviesResponse: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let movies: [Movie]

    private enum CodingKeys: String, CodingKey {
        case page, totalResults = "total_results", totalPages = "total_pages", movies = "results"
    }
}
