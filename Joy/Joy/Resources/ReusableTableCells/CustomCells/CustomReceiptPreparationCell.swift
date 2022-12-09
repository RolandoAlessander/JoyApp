//
//  CustomReceiptPreparationCell.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import UIKit

class CustomReceiptPreparationCell: UITableViewCell {

  lazy private var option: UILabel = {
    return UILabel.build {
      $0.text = "▾"
    }
  }()

  lazy private var preparation: UILabel = {
    return UILabel.build {
      $0.text = "Bowl"
    }
  }()

  override init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: String(describing: CustomReceiptPreparationCell.self))
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
    contentView.addSubview(preparation)
    contentView.addSubview(option)
  }

  private func setUpConstraints() {
    NSLayoutConstraint.activate([
      option.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      option.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      preparation.topAnchor.constraint(equalTo: option.bottomAnchor, constant: 10),
      preparation.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      preparation.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
    ])
  }
}

extension CustomReceiptPreparationCell: CustomCellSetUp {
  func setUp(with model: CustomCell) {
    guard let model: CustomPreparationData = model as? CustomPreparationData else { return }
    self.preparation.text = model.preparation
  }
}
