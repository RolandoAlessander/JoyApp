//
//  CustomTableViewCell.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

  private var dataSource: [CustomCell]?

  lazy var tableView: UITableView = {
    let table: UITableView = UITableView.build { _ in
      //
    }
    return table
  }()

  override init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: String(describing: CustomTableViewCell.self))
    self.setUpConfiguration()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Private methods
  private func updateDataSource(data: [CustomCell]) {
    DispatchQueue.main.async {
      self.dataSource = data
      self.tableView.reloadData()
    }
  }

  private func setUpConfiguration() {
    configureTableView()
    registerViews()
    registerCells()
    registerConstraints()
  }

  private func configureTableView() {
    tableView.dataSource = self
    tableView.delegate = self
  }

  private func registerViews() {
    contentView.addSubview(tableView)
  }

  private func registerCells() {
    tableView.register(CustomIngredientCell.self, forCellReuseIdentifier: String(describing: CustomIngredientCell.self))
  }

  private func registerConstraints() {
    let constraints: [NSLayoutConstraint] = [
      tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
  }

}

// MARK: - TableViewController implementation
extension CustomTableViewCell: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let currentObject: CustomCell = dataSource?[indexPath.row],
          let cell: UITableViewCell = tableView.dequeueReusableCell(
      withIdentifier: currentObject.identifier
    ) else {
      return UITableViewCell(style: .default, reuseIdentifier: "default")
    }
    (cell as? CustomCellSetUp)?.setUp(with: currentObject)
    return cell
  }
}


