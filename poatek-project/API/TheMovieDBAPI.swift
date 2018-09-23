//
//  TheMovieDBAPI.swift
//  poatek-project
//
//  Created by Filipe Jordão on 23/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import Moya

enum TheMovieDBAPI {
    case topRatedMovies(page: Int)
}

extension TheMovieDBAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }

    var path: String {
        switch self {
        case .topRatedMovies:
            return "/movie/top_rated"
        }
    }

    var method: Moya.Method {
        switch self {
        case .topRatedMovies:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case let .topRatedMovies(page: page):
            let parameters = [
                "api_key": "1dbb7d290ce2cb88ef8c311f67afd994",
                "page": page
            ] as [String: Any]

            return Task.requestParameters(parameters: parameters,
                                          encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return nil
    }
}
