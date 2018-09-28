//
//  Movie.swift
//  poatek-project
//
//  Created by Filipe Jordão on 23/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let votes: Int
    let identifier: Int
    let hasVideo: Bool
    let averageRating: Float
    let title: String
    let popularity: Float
    let posterPath: String?
    let originalTitle: String
    let originalLanguage: String
    let isAdult: Bool
    let overview: String
    let releaseDate: String
    let backdropPath: String?

    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title
        case overview
        case popularity
        case votes = "vote_count"
        case hasVideo = "video"
        case averageRating = "vote_average"
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case isAdult = "adult"
        case releaseDate = "release_date"
        case backdropPath = "backdrop_path"
    }

    init(votes: Int,
         identifier: Int,
         hasVideo: Bool,
         averageRating: Float,
         title: String,
         popularity: Float,
         posterPath: String?,
         originalTitle: String,
         originalLanguage: String,
         isAdult: Bool,
         overview: String,
         releaseDate: String,
         backdropPath: String?) {

        self.votes = votes
        self.identifier = identifier
        self.hasVideo = hasVideo
        self.averageRating = averageRating
        self.title = title
        self.popularity = popularity
        self.posterPath = posterPath
        self.originalTitle = originalTitle
        self.originalLanguage = originalLanguage
        self.isAdult = isAdult
        self.overview = overview
        self.releaseDate = releaseDate
        self.backdropPath = backdropPath
    }
}
