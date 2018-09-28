//
//  FavoriteMoviesDB.swift
//  poatek-project
//
//  Created by Filipe Jordão on 27/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import RealmSwift

class FavoriteMoviesDB {
    private let realm: Realm

    init() throws {
        self.realm = try Realm()
    }

    func saveFavorite(_ movie: Movie) throws {
        let realmObject = toRealm(movie)
        try realm.write {
            realm.add(realmObject, update: false)
        }
    }

    func updateFavorite(_ movie: Movie) throws {
        let realmObject = toRealm(movie)
        try realm.write {
            realm.add(realmObject, update: true)
        }
    }

    func isFavorite(_ movie: Movie) -> Bool {
        return realm.objects(RealmMovie.self).contains { $0.identifier == movie.identifier }
    }

    func removeFavorite(_ movie: Movie) throws {
        try realm.write {
            guard let realmObject = realm.objects(RealmMovie.self).first(where: { realmMovie in
                return realmMovie.identifier == movie.identifier
            }) else { return }
            realm.delete(realmObject)
        }
    }

    func getFavorites() -> [Movie] {
        return realm.objects(RealmMovie.self).map(fromRealm)
    }

    private func toRealm(_ movie: Movie) -> RealmMovie {
        let realmMovie = RealmMovie()
        realmMovie.votes = movie.votes
        realmMovie.identifier = movie.identifier
        realmMovie.hasVideo = movie.hasVideo
        realmMovie.averageRating = movie.averageRating
        realmMovie.title = movie.title
        realmMovie.popularity = movie.popularity
        realmMovie.posterPath = movie.posterPath
        realmMovie.originalTitle = movie.originalTitle
        realmMovie.originalLanguage = movie.originalLanguage
        realmMovie.isAdult = movie.isAdult
        realmMovie.overview = movie.overview
        realmMovie.releaseDate = movie.releaseDate
        realmMovie.backdropPath = movie.backdropPath

        return realmMovie
    }

    private func fromRealm(_ movie: RealmMovie) -> Movie {
        return Movie(votes: movie.votes,
                     identifier: movie.identifier,
                     hasVideo: movie.hasVideo,
                     averageRating: movie.averageRating,
                     title: movie.title,
                     popularity: movie.popularity,
                     posterPath: movie.posterPath,
                     originalTitle: movie.originalTitle,
                     originalLanguage: movie.originalLanguage,
                     isAdult: movie.isAdult,
                     overview: movie.overview,
                     releaseDate: movie.releaseDate,
                     backdropPath: movie.backdropPath)
    }
}
