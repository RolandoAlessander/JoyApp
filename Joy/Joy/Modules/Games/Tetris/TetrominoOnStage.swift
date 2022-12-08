//
//  TetrominoOnStage.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import Foundation

struct TetrominoOnStage {
  var tetromino: Tetromino
  var shape: [[Tetromino]]
  var pos: Position
  var collided: Bool

  init(tetromino: Tetromino) {
    self.tetromino = tetromino
    self.pos = tetromino.position
    self.shape = tetromino.shape
    collided = false
    self.updateTetromino()
  }

  mutating func updateTetromino() {
    self.tetromino = randomTetromino()
    self.shape = tetromino.shape
    self.pos = tetromino.position
    self.collided = false
  }

  func randomTetromino() -> Tetromino {
    let randomElement: Int = Int.random(in: 1...7)
    return Tetromino(rawValue: randomElement) ?? .iBlock
  }
}

struct Position {
  var x: Int
  var y: Int

  init(x: Int = 0, y: Int = 0) {
    self.x = x
    self.y = y
  }
}
