//
//
// TopScorers
// CustomTextField.swift
//
// Created by Alexander Kist on 08.12.2023.
//


import UIKit

final class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .secondarySystemBackground

        autocorrectionType = .no
        autocapitalizationType = .none

        leftViewMode = .always
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: frame.size.height))

        placeholder = "Specify the season, e.g., 2021"
        returnKeyType = .search

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height / 8
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


