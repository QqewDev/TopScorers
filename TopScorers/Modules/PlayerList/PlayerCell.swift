//
//
// TopScorers
// PlayerCell.swift
//
// Created by Alexander Kist on 06.12.2023.
//


import UIKit
import AlamofireImage

class PlayerCell: UITableViewCell {

    private let playerPhoto: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()

    private let nameLabel = CustomLabel(textColor: .label)
    private let ageLabel = CustomLabel(textColor: .label)
    private let scoreLabel = CustomLabel(textColor: .label)
    private var stackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupUI(){
        stackView.axis = .vertical

        contentView.addSubview(playerPhoto)
        contentView.addSubview(stackView)

        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(ageLabel)
        stackView.addArrangedSubview(scoreLabel)

        playerPhoto.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
            make.width.equalTo(80).multipliedBy(0.1)
        }

        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalTo(playerPhoto.snp.trailing).offset(20)
            make.trailing.equalToSuperview().inset(10)
        }
    }

    func setData(forData data: Response){
        nameLabel.text = data.player.name
        ageLabel.text = "Age: \(data.player.age)"
        scoreLabel.text = "Score: \(data.statistics[0].goals.total)"
        let url = URL(string: data.player.photo)
        let placeholder = UIImage(systemName: "figure.soccer")
        playerPhoto.af.setImage(withURL: url!, placeholderImage: placeholder)
    }

    override func prepareForReuse() {
        playerPhoto.image = nil
        nameLabel.text = nil
        ageLabel.text = nil
        scoreLabel.text = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerPhoto.layer.cornerRadius = playerPhoto.frame.size.height / 2
    }
}
