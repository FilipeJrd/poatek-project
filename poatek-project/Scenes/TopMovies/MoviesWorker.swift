//
//  MoviesWorker.swift
//  poatek-project
//
//  Created by Filipe Jordão on 23/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import Moya
import RxMoya
import RxSwift

class MoviesWorker {
    private let provider = MoyaProvider<TheMovieDBAPI>()
    func topRatedMovies(page: Int) -> Observable<MoviesResponse> {
        return
            self.provider.rx
            .request(.topRatedMovies(page: page))
            .map(MoviesResponse.self)
            .asObservable()
    }
}
