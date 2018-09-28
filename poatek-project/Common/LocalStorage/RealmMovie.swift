//
//  RealmMovie.swift
//  poatek-project
//
//  Created by Filipe Jordão on 27/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import Foundation
import RealmSwift

class RealmMovie: Object {
    @objc dynamic var votes: Int = 0
    @objc dynamic var identifier: Int = 0
    @objc dynamic var hasVideo: Bool = false
    @objc dynamic var averageRating: Float = 0.0
    @objc dynamic var title: String = ""
    @objc dynamic var popularity: Float = 0.0
    @objc dynamic var posterPath: String?
    @objc dynamic var originalTitle: String = ""
    @objc dynamic var originalLanguage: String = ""
    @objc dynamic var isAdult: Bool = false
    @objc dynamic var overview: String = ""
    @objc dynamic var releaseDate: String = ""
    @objc dynamic var backdropPath: String?

    override static func primaryKey() -> String? {
        return "identifier"
    }
}
