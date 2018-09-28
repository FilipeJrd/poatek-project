//
//  MovieDetailViewModel.swift
//  poatek-project
//
//  Created by Filipe Jordão on 27/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation

struct MovieDetailViewModel {
    let title: String
    let averageRating: Float
    let releaseDate: String
    let imageURL: String?
    let summary: String

    static func from(movie: Movie) -> MovieDetailViewModel {
        return MovieDetailViewModel(title: movie.title,
                              averageRating: movie.averageRating * 10 ,
                              releaseDate: movie.releaseDate,
                              imageURL: MovieDetailViewModel.imageURL(from: movie),
                              summary: movie.overview)
    }

    private static func imageURL(from movie: Movie) -> String? {
        if let backdrop = movie.backdropPath {
            return "https://image.tmdb.org/t/p/w500\(backdrop)"
        }
        return nil
    }
}
