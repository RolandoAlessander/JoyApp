//
//  Cell.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import Foundation

struct Cell {
  var type: Tetromino
  var tetrominoSet: Bool

  init(type: Tetromino = .nBlock, tetrominoSet: Bool = false) {
    self.type = type
    self.tetrominoSet = tetrominoSet
  }
}
