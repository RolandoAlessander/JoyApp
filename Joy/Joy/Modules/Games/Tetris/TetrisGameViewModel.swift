//
//  TetrisGameViewModel.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import SwiftUI

class TetrisGameViewModel: ObservableObject {

  @Published var stage: [Cell] = Array(repeating: Cell(), count: 286)
  @Published var currentTetromino: TetrominoOnStage = TetrominoOnStage(tetromino: .iBlock)
  @Published var level: Int = 0
//  @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//  @State var rangeTimer: Double = 1.0
//  let timer2 = Timer.publish(every: 10, on: .main, in: .common).autoconnect()

  init() {
    // Create Stage by init
  }

  func startEvent() {
    print("down")
  }

  func leftEvent() {
    let pos: Position = Position(x: -1)
    if !checkColision(movePos: pos, shape: currentTetromino.shape) {
      updateSuccesfulEvent(movePos: pos)
    }
  }

  func rightEvent() {
    let pos: Position = Position(x: 1)
    if !checkColision(movePos: pos, shape: currentTetromino.shape) {
      updateSuccesfulEvent(movePos: pos)
    }
  }

  func downEvent() {
    let pos: Position = Position(y: 1)
    if !checkColision(movePos: pos, shape: currentTetromino.shape) {
      updateSuccesfulEvent(movePos: pos)
    } else {
      currentTetromino.collided = true
      updateState()
      sweepStage()
      updateTetromino()
    }
  }

  func sweepStage() {
    for indexY in currentTetromino.pos.y...(currentTetromino.pos.y + currentTetromino.shape.count) {
      if indexY < 22 {
        var allTetrominosSet: Bool = true
        for indexX in 0...12 {
          if stage[ indexY * 13 + indexX].type == .nBlock {
            allTetrominosSet = false
            break
          }
        }
        if allTetrominosSet {
          for i in stride(from: indexY, through: 1, by: -1) {
            for j in 0...12 {
              stage[i*13+j] = stage[(i-1)*13+j]
            }
          }
        }
      } else {
        break
      }
    }
  }

  func updateSuccesfulEvent(movePos: Position = Position()) {
    removeTetromino()
    updatePosCurrentTetromino(movePos: movePos)
    updateState()
  }

  func rotateTetrominoRight() {
    let newTetromino: [[Tetromino]] = rotate(right: true)
    if !checkColision(shape: newTetromino) {
      removeTetromino()
      currentTetromino.shape = newTetromino
      updateState()
    }
  }

  func rotateTetrominoLeft() {
    let newTetromino: [[Tetromino]] = rotate(right: false)
    if !checkColision(shape: newTetromino) {
      removeTetromino()
      currentTetromino.shape = newTetromino
      updateState()
    }
  }

  func rotate(right: Bool) -> [[Tetromino]] {
    let lenght: Int = currentTetromino.shape.count
    var tetrominoCopy: [[Tetromino]] = Array(repeating: Array(repeating: .nBlock, count: lenght), count: lenght)
    for (indexY, row) in currentTetromino.shape.enumerated() {
      for (indexX, value)  in row.enumerated() {
        if right {
          tetrominoCopy[indexX][lenght - 1 - indexY] = value
        } else {
          tetrominoCopy[lenght - 1 - indexX][indexY] = value
        }
      }
    }
    return tetrominoCopy
  }

  func checkColision(movePos: Position = Position(), shape: [[Tetromino]]) -> Bool {
    let movePosX: Int = currentTetromino.pos.x + movePos.x
    let movePosY: Int = currentTetromino.pos.y + movePos.y
    for (indexY, row) in shape.enumerated() {
      for (indexX, value)  in row.enumerated() {
        if value != .nBlock,
           (movePosY + indexY) * 13 + movePosX + indexX >= 286 ||
            movePosX + indexX < 0 || movePosX + indexX > 12 {
          return true
        }
        if value != .nBlock,
           ( indexY + movePosY ) * 13 + movePosX + indexX > 0 &&
            ( indexY + movePosY ) * 13 + movePosX + indexX < 286,
            stage[ ( indexY + movePosY ) * 13 + movePosX + indexX ].tetrominoSet {
          return true
        }
      }
    }
    return false
  }

  func removeTetromino() {
    for (indexY, row) in currentTetromino.shape.enumerated() {
      for (indexX, value)  in row.enumerated() {
        if indexY + currentTetromino.pos.y >= 0, value != .nBlock {
          stage[ ( indexY + currentTetromino.pos.y ) * 13 + currentTetromino.pos.x + indexX ] = Cell()
        }
      }
    }
  }

  func updateState() {
    for (indexY, row) in currentTetromino.shape.enumerated() {
      for (indexX, value)  in row.enumerated() {
        if indexY + currentTetromino.pos.y >= 0, value != .nBlock {
          stage[ ( indexY + currentTetromino.pos.y ) * 13 + currentTetromino.pos.x + indexX ].type = value
          stage[ ( indexY + currentTetromino.pos.y ) * 13 + currentTetromino.pos.x + indexX ].tetrominoSet = currentTetromino.collided
        }
      }
    }
  }

  func updatePosCurrentTetromino(movePos: Position) {
    currentTetromino.pos.y += movePos.y
    currentTetromino.pos.x += movePos.x
  }

  func updateTetromino() {
    currentTetromino.updateTetromino()
  }
}

struct TetrisGameSquare {
  var color: Color
}
