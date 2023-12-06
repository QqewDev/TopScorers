//
//
// FootAPI-VIPER
// ApiManager.swift
//
// Created by Alexander Kist on 05.12.2023.
//


import Foundation
import Alamofire


protocol APIManagerProtocol {
    func retrievePlayerData(completion: @escaping (Result<PlayerData, Error>) -> Void)
}

final class APIManager: APIManagerProtocol {
    func retrievePlayerData(completion: @escaping (Result<PlayerData, Error>) -> Void) {
        let endpoint = Endpoints.TopScorers.fetch(withApiKey: "API-KEY", season: "1966")
        AF.request(endpoint.url, method: .get, headers: HTTPHeaders(endpoint.headers))
            .validate()
            .responseDecodable(of: PlayerData.self) { response in
                switch response.result {
                case .success(let playerData):
                    completion(.success(playerData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

