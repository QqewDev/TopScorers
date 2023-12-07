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

// MARK: Response
struct Response: Decodable {
    let player: Player
    let statistics: [Statistic]
}

// MARK: Player
struct Player: Decodable {
    let id: Int
    let name: String
    let age: Int
    let birth: Birth
    let height, weight: String
    let photo: String
}

// MARK: Birth
struct Birth: Decodable {
    let date: String

}

// MARK: Statistic
struct Statistic: Decodable {
    let goals: Goals
}

// MARK: Goals
struct Goals: Decodable {
    let total: Int
}

extension Birth {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: date) else {
            return date
        }

        dateFormatter.dateFormat = "dd MMMM yyyy" // Base format

        let day = Calendar.current.component(.day, from: date)
        switch day {
        case 1, 21, 31:
            dateFormatter.dateFormat = "dd'st' 'of' MMMM, yyyy"
        case 2, 22:
            dateFormatter.dateFormat = "dd'nd' 'of' MMMM, yyyy"
        case 3, 23:
            dateFormatter.dateFormat = "dd'rd' 'of' MMMM, yyyy"
        default:
            dateFormatter.dateFormat = "dd'th' 'of' MMMM, yyyy"
        }

        return dateFormatter.string(from: date)
    }
}
