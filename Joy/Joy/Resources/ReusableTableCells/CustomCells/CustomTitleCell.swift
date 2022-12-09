//
//  CustomTitleCell.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import UIKit

class CustomTitleCell: UITableViewCell {

  lazy private var title: UILabel = {
    return UILabel.build {
      $0.text = "Bowl"
    }
  }()

  override init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: String(describing: CustomTitleCell.self))
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
    contentView.addSubview(title)
  }

  private func setUpConstraints() {
    NSLayoutConstraint.activate([
      title.topAnchor.constraint(equalTo: contentView.topAnchor),
      title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
    ])
  }
}

extension CustomTitleCell: CustomCellSetUp {
  func setUp(with model: CustomCell) {
    guard let model: CustomTitleData = model as? CustomTitleData else { return }
    self.title.text = model.title
  }
}
