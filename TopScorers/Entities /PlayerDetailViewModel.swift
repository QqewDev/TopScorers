//
//
// TopScorers
// PlayerDetailViewModel.swift
// 
// Created by Alexander Kist on 09.12.2023.
//


import Foundation

struct PlayerDetailViewModel {
    let photoURL: URL?
    let name: String
    let age: String
    let birthDate: String
    let height: String
    let weight: String
    let totalScore: String

    init(player: Player, statistics: [Statistic]) {
        photoURL = URL(string: player.photo)
        name = "Name: \(player.name)"
        age = "Age: \(player.age) y.o."
        birthDate = "Birth date: \(player.birth.formattedDate())"
        height = "Player height: \(player.height)"
        weight = "Player weight: \(player.weight)"
        if let totalGoals = statistics.first?.goals.total {
            totalScore = "Score: \(totalGoals) goals"
        } else {
            totalScore = "Score: N/A"
        }
    }
}
