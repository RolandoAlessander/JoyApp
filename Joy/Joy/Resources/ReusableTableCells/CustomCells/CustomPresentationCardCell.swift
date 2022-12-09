//
//  CustomDoubleInfo.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import UIKit

final class CustomPresentationCardCell: UITableViewCell {

  lazy private var viewPresentation: UIView = {
    return UIView.build {
      $0.backgroundColor = UIColor.white
      $0.layer.cornerRadius = 10
      $0.layer.shadowColor = UIColor.gray.cgColor
      $0.layer.shadowOpacity = 0.7
      $0.layer.shadowOffset = CGSize(width: 3, height: 3)
      $0.layer.shadowRadius = 3
      $0.layer.borderWidth = 0.1
      $0.layer.borderColor = UIColor.gray.cgColor
    }
  }()

  lazy private var imagePresentation: UIImageView = {
    return UIImageView.build {
      $0.layer.cornerRadius = 10
      $0.clipsToBounds = true
    }
  }()

  lazy private var titlePresentation: UILabel = {
    return UILabel.build {
      $0.text = "Bowl"
      $0.font = UIFont.boldSystemFont(ofSize: 30)
      $0.textColor = .blue
      $0.layer.shadowRadius = 0
    }
  }()

  lazy private var averagePresentation: UILabel = {
    return UILabel.build { _ in }
  }()

  lazy private var subtitlePresentation: UILabel = {
    return UILabel.build {
      $0.text = "Blend and enjoy avocado"
      $0.layer.shadowRadius = 0
    }
  }()

  lazy private var descriptionPresentation: UILabel = {
    return UILabel.build {
      $0.text = "Servers: 1 Prep: 15 Cooking 10"
      $0.layer.shadowRadius = 0
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
    contentView.addSubview(viewPresentation)
    viewPresentation.addSubview(imagePresentation)
    viewPresentation.addSubview(titlePresentation)
    viewPresentation.addSubview(subtitlePresentation)
    viewPresentation.addSubview(descriptionPresentation)
  }

  private func setUpConstraints() {
    NSLayoutConstraint.activate([
      viewPresentation.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      viewPresentation.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      viewPresentation.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
      viewPresentation.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
      imagePresentation.heightAnchor.constraint(lessThanOrEqualToConstant: 200),
      imagePresentation.topAnchor.constraint(equalTo: viewPresentation.topAnchor),
      imagePresentation.leadingAnchor.constraint(equalTo: viewPresentation.leadingAnchor),
      imagePresentation.trailingAnchor.constraint(equalTo: viewPresentation.trailingAnchor),
      titlePresentation.topAnchor.constraint(equalTo: imagePresentation.bottomAnchor, constant: 20),
      titlePresentation.leadingAnchor.constraint(equalTo: viewPresentation.leadingAnchor, constant: 20),
      subtitlePresentation.topAnchor.constraint(equalTo: titlePresentation.bottomAnchor, constant: 20),
      subtitlePresentation.leadingAnchor.constraint(equalTo: viewPresentation.leadingAnchor, constant: 20),
      descriptionPresentation.topAnchor.constraint(equalTo: subtitlePresentation.bottomAnchor, constant: 20),
      descriptionPresentation.leadingAnchor.constraint(equalTo: viewPresentation.leadingAnchor, constant: 20),
      descriptionPresentation.bottomAnchor.constraint(equalTo: viewPresentation.bottomAnchor)
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

