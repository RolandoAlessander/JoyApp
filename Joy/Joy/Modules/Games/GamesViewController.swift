//
//  GamesViewController.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import UIKit
import SwiftUI

class GamesViewController: UIViewController {

  private var dataSource: [CustomCell]?

  // MARK: - UIObjects
  lazy var tableView: UITableView = {
    let table: UITableView = UITableView.build { _ in }
    return table
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .green
    self.dataSource = GameData.getGamesData()
    self.setUpConfiguration()
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
    self.tableView.separatorStyle = .none
    //tableView.rowHeight = 500
  }

  private func registerViews() {
    view.addSubview(tableView)
  }

  private func registerCells() {
    tableView.register(CustomPresentationCardCell.self, forCellReuseIdentifier: String(describing: CustomPresentationCardCell.self))
    tableView.register(CustomOptionDescriptionCell.self, forCellReuseIdentifier: String(describing: CustomOptionDescriptionCell.self))
  }

  private func registerConstraints() {
    let constraints: [NSLayoutConstraint] = [
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
  }

}

// MARK: - TableViewController implementation
extension GamesViewController: UITableViewDataSource, UITableViewDelegate {
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

