//
//  BlockView.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import SwiftUI

struct BlockView: View {
  let blockColor: Color

  var body: some View {
    Rectangle().foregroundColor(blockColor.opacity(0.8))
      .aspectRatio(1, contentMode: .fit)
      .overlay(Rectangle().frame(width: nil, height: 4, alignment: .top).foregroundColor(blockColor), alignment: .top)
      .overlay(Rectangle().frame(width: 4, height: nil, alignment: .leading).foregroundColor(blockColor.opacity(0.3)), alignment: .leading)
      .overlay(Rectangle().frame(width: nil, height: 4, alignment: .bottom).foregroundColor(blockColor.opacity(0.2)), alignment: .bottom)
      .overlay(Rectangle().frame(width: 4, height: nil, alignment: .trailing).foregroundColor(blockColor), alignment: .trailing)
  }
}

struct BlockView_Previews: PreviewProvider {
  static var previews: some View {
    BlockView(blockColor: .red)
  }
}
