//
//  PopularMoviesWorker.swift
//  poatek-project
//
//  Created by Filipe Jordão on 24/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import Moya
import RxMoya
import RxSwift

class PopularMoviesWorker {
    private let provider = MoyaProvider<TheMovieDBAPI>()
    func popularMovies(page: Int) -> Observable<MoviesResponse> {
        return
            self.provider.rx
                .request(.mostPopularMovies(page: page))
                .map(MoviesResponse.self)
                .asObservable()
    }
}
