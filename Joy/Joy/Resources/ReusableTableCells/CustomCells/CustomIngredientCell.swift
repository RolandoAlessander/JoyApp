//
//  CustomIngredientCell.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import UIKit

class CustomIngredientCell: UITableViewCell {

  lazy private var option: UILabel = {
    return UILabel.build {
      $0.text = "🍽"
    }
  }()

  lazy private var ingredient: UILabel = {
    return UILabel.build {
      $0.text = "Bowl"
    }
  }()

  override init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: String(describing: CustomIngredientCell.self))
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
    contentView.addSubview(ingredient)
    contentView.addSubview(option)
  }

  private func setUpConstraints() {
    NSLayoutConstraint.activate([
      option.topAnchor.constraint(equalTo: contentView.topAnchor),
      option.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      option.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      ingredient.firstBaselineAnchor.constraint(equalTo: option.firstBaselineAnchor),
      ingredient.leadingAnchor.constraint(equalTo: option.trailingAnchor, constant: 20)
    ])
  }
}

extension CustomIngredientCell: CustomCellSetUp {
  func setUp(with model: CustomCell) {
    guard let model: CustomIngredientData = model as? CustomIngredientData else { return }
    self.ingredient.text = model.ingredient
  }
}
