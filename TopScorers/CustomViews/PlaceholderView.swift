//
//
// TopScorers
// PlaceholderView.swift
// 
// Created by Alexander Kist on 08.12.2023.
//


import UIKit

final class PlaceholderView: UIView {

    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "shoot")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldHeaderTitile()
        return label
    }()

    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.regularHeaderSubTitile()
        return label
    }()

    init(title: String, subtitle: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.subTitleLabel.text = subtitle

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(image)
        addSubview(titleLabel)
        addSubview(subTitleLabel)

        image.snp.makeConstraints { make in
            make.top.equalTo(layoutMarginsGuide.snp.top).offset(25)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(80)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
        }

        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
    }
}
