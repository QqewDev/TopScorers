//
//
// FootAPI-VIPER
// Player.swift
// 
// Created by Alexander Kist on 05.12.2023.
//


import Foundation


struct PlayerData: Decodable {
    let response: [Response]
}

// MARK: - Response
struct Response: Decodable {
    let player: Player
    let statistics: [Statistic]
}

// MARK: - Player
struct Player: Decodable {
    let id: Int
    let name: String
    let age: Int
    let birth: Birth
    let height, weight: String
    let photo: String
}

// MARK: - Birth
struct Birth: Decodable {
    let date: String
}

// MARK: - Statistic
struct Statistic: Decodable {
    let goals: Goals
}

// MARK: - Goals
struct Goals: Decodable {
    let total: Int
}
