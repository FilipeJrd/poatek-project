//
//  FavoriteMoviesDataStore.swift
//  poatek-project
//
//  Created by Filipe Jordão on 27/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

class FavoriteMoviesDataStore: MoviesDataStore {
    private var moviesObs: Observable<[Movie]>?

    func setup(with pageInput: Observable<Int>) {
        moviesObs = pageInput.map { _ in try FavoriteMoviesDB() }
                             .map { $0.getFavorites() }

    }

    func movies() -> Observable<[Movie]> {
        return moviesObs ?? Observable.just([])
    }
}

extension FavoriteMoviesDataStore {
    func getMovies(in realm: Realm) -> [Movie] {
        return []
    }
}
