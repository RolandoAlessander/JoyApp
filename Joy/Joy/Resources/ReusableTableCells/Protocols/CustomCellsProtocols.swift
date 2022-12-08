//
//  CustomCellsProtocols.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import Foundation

protocol CustomCell {
  var identifier: String { get }
}

protocol CustomCellSetUp {
  func setUp(with model: CustomCell)
}
