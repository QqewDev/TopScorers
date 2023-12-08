//
//
// WeatherViper
// Extension+UIFont.swift
//
// Created by Alexander Kist on 06.12.2023.
//


import UIKit

extension UIFont {
    
    static func headline() -> UIFont {
        return UIFont.preferredFont(forTextStyle: .headline)
    }

    static func body() -> UIFont {
        return UIFont.preferredFont(forTextStyle: .body)
    }

    static func boldHeaderTitile() -> UIFont {
        return UIFont.systemFont(ofSize: 26, weight: .bold)
    }

    static func regularHeaderSubTitile() -> UIFont {
        return UIFont.systemFont(ofSize: 18, weight: .regular)
    }
}
