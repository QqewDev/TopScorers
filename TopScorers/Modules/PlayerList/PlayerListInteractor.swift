//
//  PlayerListInteractor.swift
//  Super easy dev
//
//  Created by Александр Кисть on 05.12.2023
//

import Foundation

protocol PlayerListInteractorProtocol: AnyObject {
    func fetchData(completion: @escaping (Result<[Response], Error>) -> Void)
}

class PlayerListInteractor {
    weak var presenter: PlayerListPresenterProtocol?

    let apiManager: APIManager


    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
}

extension PlayerListInteractor: PlayerListInteractorProtocol {
    func fetchData(completion: @escaping (Result<[Response], Error>) -> Void) {
        self.apiManager.retrievePlayerData { result in
            switch result {
            case .success(let data):
                completion(.success(data.response))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
