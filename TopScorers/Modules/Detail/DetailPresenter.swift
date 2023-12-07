//
// TopScorers
// DetailPresenter.swift
//
// Created by Alexander Kist on 05.12.2023.
//

protocol DetailPresenterProtocol: AnyObject {
    func setPlayer(_ player: Response)
}

class DetailPresenter {
    weak var view: DetailViewProtocol?
    var router: DetailRouterProtocol
    var interactor: DetailInteractorProtocol

    init(interactor: DetailInteractorProtocol, router: DetailRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    func setPlayer(_ player: Response) {
      view?.showPlayerDetail(for: player)
    }
}
