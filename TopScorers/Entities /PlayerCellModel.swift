//
//
// TopScorers
// PlayerCellModel.swift
// 
// Created by Alexander Kist on 08.12.2023.
//


import Foundation

struct PlayerViewModel {
    let name: String
    let age: String
    let score: String
    let photoURL: URL?

    init(player: Player, statistic: Statistic?) {
        name = player.name
        age = "Age: \(player.age)"

        if let goalsTotal = statistic?.goals.total {
            score = "Score: \(goalsTotal)"
        } else {
            score = "Score: N/A"
        }

        photoURL = URL(string: player.photo)
    }
}
