//
//  MoviesViewController.swift
//  poatek-project
//
//  Created by Filipe Jordão on 22/09/18.
//  Copyright © 2018 Filipe Jordão. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Nuke

protocol MoviesDisplayLogic {
    func display(movies: Driver<[MovieViewModel]>)
    func display(errorMessage: Driver<String>)
}

class MoviesViewController: UIViewController {
    private let disposeBag = DisposeBag()
    var interactor: MoviesBusinessLogic?
    var router: MoviesRoutingLogic?

    private var moviesView = MoviesView()

    override func loadView() {
        super.loadView()
        self.view = self.moviesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableViewbindind()
    }

    func setupDataDriver() {
        let tableView = self.moviesView.tableView

        let pageDriver = tableView.rx
            .contentOffset
            .map(self.isNearTableViewBottom)
            .distinctUntilChanged()
            .filter { $0 == true }
            .scan(0, accumulator: { page, _ in page + 1})
            .asDriver(onErrorJustReturn: 1)

        self.interactor?.fetchMovies(from: pageDriver)
    }
}

extension MoviesViewController: MoviesDisplayLogic {
    func display(errorMessage: Driver<String>) {
        errorMessage.asObservable().subscribe { event in
            if case let .next(errorMessage) = event {
                let alert = UIAlertController(title: "Oops",
                                              message: errorMessage,
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok",
                                              style: .cancel,
                                              handler: nil))

                self.present(alert, animated: true, completion: nil)
            }
        }.disposed(by: self.disposeBag)
    }

    func display(movies: Driver<[MovieViewModel]>) {
        let tableView = self.moviesView.tableView
        movies.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: MovieViewCell.identifier,
                                         cellType: MovieViewCell.self)
            ) { _, movie, cell in
                cell.info.title.text = movie.title
                cell.info.date.text = movie.releaseDate
                cell.info.rating.value = CGFloat(movie.averageRating)
                cell.img.image = nil
                if let imageUrlString = movie.imageURL, let url = URL(string: imageUrlString) {
                    Nuke.loadImage(with: url, into: cell.img)
                }
        }.disposed(by: self.disposeBag)
    }

    private func setupTableViewbindind() {
        let tableView = self.moviesView.tableView

        self.setupDataDriver()

        self.router?.route(to: tableView.rx.itemSelected.map { $0.row })
    }

    private func isNearTableViewBottom(point: CGPoint) -> Bool {
        let tableView = self.moviesView.tableView
        return point.y + tableView.frame.size.height + 20 > tableView.contentSize.height
    }
}
