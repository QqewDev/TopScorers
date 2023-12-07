//
//  PlayerListPresenter.swift
//  Super easy dev
//
//  Created by Александр Кисть on 05.12.2023
//

protocol PlayerListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func showPlayerDetail(for player: Response)
}

class PlayerListPresenter {
    weak var view: PlayerListViewProtocol?
    var router: PlayerListRouterProtocol
    var interactor: PlayerListInteractorProtocol

    init(interactor: PlayerListInteractorProtocol, router: PlayerListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension PlayerListPresenter: PlayerListPresenterProtocol {
    func showPlayerDetail(for player: Response) {
        router.openDetailView(for: player)
    }
    
    func viewDidLoad() {
        interactor.fetchData { [weak self] result in
            switch result {
            case .success(let data):
                self?.view?.showPlayerData(with: data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
