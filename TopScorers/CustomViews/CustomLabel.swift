//
//
// WeatherViper
// CustomLabel.swift
// 
// Created by Alexander Kist on 06.12.2023.
//


import UIKit

final class CustomLabel: UILabel {

    init(textColor: UIColor, fontName: UIFont) {
        super.init(frame: .zero)
        self.textColor = textColor
        numberOfLines = 0
        font = fontName
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
