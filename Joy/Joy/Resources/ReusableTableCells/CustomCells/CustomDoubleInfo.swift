//
//  CustomDoubleInfo.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import UIKit

final class CustomDoubleInfoCell: UITableViewCell {

  lazy private var student: UILabel = {
    return UILabel.build { _ in }
  }()

  lazy private var lesson: UILabel = {
    return UILabel.build { _ in }
  }()

  override init(style: UITableViewCell.CellStyle = .value1, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: String(describing: CustomDoubleInfoCell.self))
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
    contentView.addSubview(student)
    contentView.addSubview(lesson)
  }

  private func setUpConstraints() {
    NSLayoutConstraint.activate([
      student.firstBaselineAnchor.constraint(equalTo: lesson.firstBaselineAnchor),
      student.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
      student.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
      student.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
      lesson.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40)
    ])
  }
}

extension CustomDoubleInfoCell: CustomCellSetUp {
  func setUp(with model: CustomCell) {
    guard let model: CustomDoubleInfoData = model as? CustomDoubleInfoData else { return }
    self.student.text = model.rightInfoData
    self.lesson.text = model.leftInfoData
  }
}

