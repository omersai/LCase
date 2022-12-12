//
//  MainPresenter.swift
//  MoviesUI
//
//  Created by OMER on 8.12.2022.
//

import Foundation

final class MainPresenter: MainPresenterProtocol{
    unowned private let view: MainViewProtocol
    private let interactor: MainInteractorProtocol
    private let router: MainRouterProtocol
    
    init(view: MainViewProtocol, interactor: MainInteractorProtocol, router: MainRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
    
    func load(paramaters: String) {
        interactor.load(paramaters: paramaters)
    }
    
    func selectMovie(at index: Int) {
        interactor.selectMovie(at: index)
    }
}

extension MainPresenter: MainInteractorDelegate{
    func handleOutput(_ output: MainInteractorOutput) {
        switch output{
        case .setLoading(let loading):
            view.handleOutput(.setLoading(loading))
        case .showMovie(let movies):
            let moviePresentation = movies.map(MoviePresentation.init)
            view.handleOutput(.showMovie(moviePresentation))
        case .showDetail(let movie):
            router.navigate(to: .detail(movie))
        }
    }
}
