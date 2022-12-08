//
//  Tetromino.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import SwiftUI

enum Tetromino: Int, CaseIterable {
  case sBlock = 1
  case tBlock
  case zBlock
  case jBlock
  case lBlock
  case oBlock
  case iBlock
  case nBlock

  var shape: [[Tetromino]] {
    switch self {
    case .sBlock:
      return [
        [.nBlock, .sBlock, .sBlock],
        [.sBlock, .sBlock, .nBlock],
        [.nBlock, .nBlock, .nBlock]
      ]
    case .tBlock:
      return [
        [.nBlock, .nBlock, .nBlock],
        [.tBlock, .tBlock, .tBlock],
        [.nBlock, .tBlock, .nBlock]
      ]
    case .zBlock:
      return [
        [.zBlock, .zBlock, .nBlock],
        [.nBlock, .zBlock, .zBlock],
        [.nBlock, .nBlock, .nBlock]
      ]
    case .jBlock:
      return [
        [.nBlock, .jBlock, .nBlock],
        [.nBlock, .jBlock, .nBlock],
        [.jBlock, .jBlock, .nBlock]
      ]
    case .lBlock:
      return [
        [.nBlock, .lBlock, .nBlock],
        [.nBlock, .lBlock, .nBlock],
        [.nBlock, .lBlock, .lBlock]
      ]
    case .oBlock:
      return [
        [.oBlock, .oBlock],
        [.oBlock, .oBlock]
      ]
    case .iBlock:
      return [
        [.nBlock, .iBlock, .nBlock, .nBlock],
        [.nBlock, .iBlock, .nBlock, .nBlock],
        [.nBlock, .iBlock, .nBlock, .nBlock],
        [.nBlock, .iBlock, .nBlock, .nBlock]
      ]
    case .nBlock:
      return []
    }
  }

  var color: Color {
    switch self {
    case .sBlock:
      return .red
    case .tBlock:
      return .yellow
    case .zBlock:
      return .purple
    case .jBlock:
      return .green
    case .lBlock:
      return .cyan
    case .oBlock:
      return .brown
    case .iBlock:
      return .orange
    case .nBlock:
      return .gray
    }
  }

  var position: Position {
    switch self {
    case .sBlock, .tBlock, .lBlock, .jBlock, .zBlock, .nBlock:
      return Position(x: 5, y: -3)
    case .oBlock:
      return Position(x: 5, y: -2)
    case .iBlock:
      return Position(x: 5, y: -4)
    }
  }
}
