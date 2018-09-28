//
//  MovieViewModel.swift
//  poatek-project
//
//  Created by Filipe Jordão on 23/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation

struct MovieViewModel {
    let title: String
    let averageRating: Float
    let releaseDate: String
    let imageURL: String?

    static func from(movie: Movie) -> MovieViewModel {
        return MovieViewModel(title: movie.title,
                              averageRating: movie.averageRating * 10 ,
                              releaseDate: movie.releaseDate,
                              imageURL: MovieViewModel.imageURL(from: movie))
    }

    private static func imageURL(from movie: Movie) -> String? {
        if let backdrop = movie.backdropPath {
            return "https://image.tmdb.org/t/p/w500\(backdrop)"
        }
        return nil
    }
}
