//
//  MovieDetailViewController.swift
//  poatek-project
//
//  Created by Filipe Jordão on 25/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    let movieDetailView = MovieDetailView()

    override func loadView() {
        super.loadView()
        self.view = self.movieDetailView
        self.movieDetailView.closeAction = {
            self.dismiss(animated: true)
        }
    }
}
