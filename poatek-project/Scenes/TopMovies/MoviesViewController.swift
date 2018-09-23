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

protocol MoviesDisplayLogic {
    func display(movies: Driver<MoviesViewModel>)
}

class MoviesViewController: UIViewController {
    private let disposeBag = DisposeBag()
    var interactor: MoviesBusinessLogic?

    private var moviesView = MoviesView()

    override func loadView() {
        super.loadView()
        self.view = self.moviesView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableViewbindind()

    }
}

extension MoviesViewController: MoviesDisplayLogic {
    func display(movies: Driver<MoviesViewModel>) {
        let tableView = self.moviesView.tableView
        movies.asObservable()
            .map { $0.movies }
            .scan([], accumulator: { $0 + $1 })
            .bind(to: tableView.rx.items(cellIdentifier: MovieViewCell.identifier,
                                         cellType: MovieViewCell.self)
            ) { _, movie, cell in
                cell.textLabel?.text = movie.title
        }.disposed(by: self.disposeBag)
    }

    private func setupTableViewbindind() {
        let tableView = self.moviesView.tableView
        let pageDriver = tableView.rx
            .contentOffset
            .map(self.isNearTableViewBottom)
            .distinctUntilChanged()
            .filter { $0 == true }
            .scan(1, accumulator: { page, _ in page + 1})
            .map { MoviesRequest(page: $0) }
            .asDriver(onErrorJustReturn: MoviesRequest(page: 1))

        self.interactor?.fetchMovies(from: pageDriver)
    }

    private func isNearTableViewBottom(point: CGPoint) -> Bool {
        let tableView = self.moviesView.tableView
        return point.y + tableView.frame.size.height + 20 > tableView.contentSize.height
    }
}

extension MoviesViewController {
    static func setup() -> MoviesViewController {
        let viewController = MoviesViewController()
        let interactor = MoviesInteractor()
        let presenter = MoviesPresenter()

        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController

        return viewController
    }
}