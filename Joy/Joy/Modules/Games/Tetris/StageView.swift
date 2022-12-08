//
//  StageView.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import SwiftUI

struct StageView: View {

  let stage: [Cell]

  var body: some View {
    LazyVGrid(
      columns: getGridColumns(),
      alignment: .center,
      spacing: 1
    ) {
      ForEach(0..<stage.count, id: \.self) { index in
        if stage[index].type != .nBlock {
          BlockView(blockColor: stage[index].type.color)
        } else {
          Rectangle().foregroundColor(stage[index].type.color)
            .aspectRatio(1, contentMode: .fit)
        }
      }
    }
  }

  func getGridColumns() -> [GridItem] {
    Array(repeating: GridItem(.flexible(), spacing: 1, alignment: nil), count: 13)
  }
}

struct StageView_Previews: PreviewProvider {
  static var previews: some View {
    StageView(stage: Array(repeating: Cell(), count: 240))
  }
}
