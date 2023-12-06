//
//
// TopScorers
// Endpoints.swift
// 
// Created by Alexander Kist on 05.12.2023.
//


import Foundation

struct Api {
    static let baseUrl = "https://api-football-v1.p.rapidapi.com"
    static let defaultHeaders: [String: String] = ["x-rapidapi-host": "api-football-v1.p.rapidapi.com"]
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
    var headers: [String: String] { get }
}

enum Endpoints {
    enum TopScorers: Endpoint {
        case fetch(withApiKey: String, season: String)

        public var path: String {
            switch self {
            case .fetch(_, let season): return "/v3/players/topscorers?league=39&season=\(season)"
            }
        }

        public var url: String {
            switch self {
            case .fetch: return "\(Api.baseUrl)\(path)"
            }
        }

        public var headers: [String: String] {
            switch self {
            case .fetch(let key, _):
                var headers = Api.defaultHeaders
                headers["x-rapidapi-key"] = key
                return headers
            }
        }
    }
}

