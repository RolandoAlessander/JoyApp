//
//  CustomDoubleInfo.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import UIKit

final class CustomPresentationCardCell: UITableViewCell {

  lazy private var imagePresentation: UIImageView = {
    return UIImageView.build {
      $0.image = UIImage(systemName: "house")
    }
  }()

  lazy private var titlePresentation: UILabel = {
    return UILabel.build {
      $0.text = "Bowl"
    }
  }()

  lazy private var averagePresentation: UILabel = {
    return UILabel.build { _ in }
  }()

  lazy private var subtitlePresentation: UILabel = {
    return UILabel.build {
      $0.text = "Blend and enjoy avocado"
    }
  }()

  lazy private var descriptionPresentation: UILabel = {
    return UILabel.build {
      $0.text = "Servers: 1 Prep: 15 Cooking 10"
    }
  }()

  override init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: String(describing: CustomPresentationCardCell.self))
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
    contentView.addSubview(imagePresentation)
    contentView.addSubview(titlePresentation)
    contentView.addSubview(subtitlePresentation)
    contentView.addSubview(descriptionPresentation)
  }

  private func setUpConstraints() {
    NSLayoutConstraint.activate([
      imagePresentation.topAnchor.constraint(equalTo: contentView.topAnchor),
      imagePresentation.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      imagePresentation.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      titlePresentation.topAnchor.constraint(equalTo: imagePresentation.bottomAnchor, constant: 40),
      titlePresentation.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      subtitlePresentation.topAnchor.constraint(equalTo: titlePresentation.bottomAnchor, constant: 40),
      subtitlePresentation.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      descriptionPresentation.topAnchor.constraint(equalTo: subtitlePresentation.bottomAnchor, constant: 40),
      descriptionPresentation.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      descriptionPresentation.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
    ])
  }
}

extension CustomPresentationCardCell: CustomCellSetUp {
  func setUp(with model: CustomCell) {
    guard let model: CustomPresentationCardData = model as? CustomPresentationCardData else { return }
    self.titlePresentation.text = model.title
    self.subtitlePresentation.text = model.subtitle
    self.descriptionPresentation.text = model.description
    self.imagePresentation.image = model.image
  }
}

