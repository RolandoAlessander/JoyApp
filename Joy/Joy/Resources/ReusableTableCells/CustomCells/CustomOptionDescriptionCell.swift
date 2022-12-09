//
//  CustomOptionDescriptionCell.swift
//  Joy
//
//  Created by Rolando Alessander on 09/12/22.
//

import UIKit

class CustomOptionDescriptionCell: UITableViewCell {

  lazy private var option: UIImageView = {
    return UIImageView.build { _ in }
  }()

  lazy private var optionView: UIView = {
    return UIView.build {
      $0.backgroundColor = UIColor(white: 0.2, alpha: 0.4)
      $0.layer.cornerRadius = 10
    }
  }()

  lazy private var labelView: UIView = {
    return UIView.build {
      $0.backgroundColor = .white
    }
  }()

  lazy private var title: UILabel = {
    return UILabel.build {
      $0.text = "Bowl"
      $0.font = UIFont.boldSystemFont(ofSize: 30)
      $0.textColor = .white
    }
  }()

  lazy private var optionDescription: UILabel = {
    return UILabel.build {
      $0.text = "Bowl"
      $0.textColor = .white
    }
  }()

  override init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: String(describing: CustomOptionDescriptionCell.self))
    self.setUpConfiguration()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setUpConfiguration() {
    self.setUpViews()
    self.setUpConstraints()
  }

  private func setUpViews() {
    contentView.addSubview(option)
    contentView.addSubview(optionView)
    optionView.addSubview(labelView)
    optionView.addSubview(title)
    optionView.addSubview(optionDescription)
  }

  private func setUpConstraints() {
    NSLayoutConstraint.activate([
      option.heightAnchor.constraint(lessThanOrEqualToConstant: 300),
      option.topAnchor.constraint(equalTo: contentView.topAnchor),
      option.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      option.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      option.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      optionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
      optionView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),
      optionView.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -20),
      labelView.widthAnchor.constraint(equalToConstant: 3),
      labelView.topAnchor.constraint(equalTo: optionView.topAnchor),
      labelView.leadingAnchor.constraint(equalTo: optionView.leadingAnchor),
      labelView.bottomAnchor.constraint(equalTo: optionView.bottomAnchor),
      title.topAnchor.constraint(equalTo: optionView.topAnchor, constant: 10),
      title.leadingAnchor.constraint(equalTo: labelView.trailingAnchor, constant: 10),
      optionDescription.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
      optionDescription.leadingAnchor.constraint(equalTo: labelView.trailingAnchor, constant: 10),
      optionDescription.bottomAnchor.constraint(equalTo: optionView.bottomAnchor, constant: -10)
    ])
  }
}

extension CustomOptionDescriptionCell: CustomCellSetUp {
  func setUp(with model: CustomCell) {
    guard let model: CustomOptionDescriptionData = model as? CustomOptionDescriptionData else { return }
    self.option.image = model.image
    self.title.text = model.title
    self.optionDescription.text = model.description
  }
}
