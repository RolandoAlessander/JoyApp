//
//  TetrisGame.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import SwiftUI

struct TetrisGame: View {

  @ObservedObject private var viewModel: TetrisGameViewModel = TetrisGameViewModel()
  
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      VStack {
        VStack {
          HStack(alignment: .top, spacing: nil) {
            Text("Level: \(viewModel.level)")
            Spacer()
            Text("Lines: 0")
            Spacer()
            Text("Score: 0")
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.horizontal, 15)

          HStack {
            Button("Start", action: viewModel.startEvent)
              .frame(maxWidth: .infinity, maxHeight: 30)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(.white, lineWidth: 2)
              )
            Button("Left", action: viewModel.leftEvent)
              .frame(maxWidth: .infinity, maxHeight: 30)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(.white, lineWidth: 2)
              )
            Button("Right", action: viewModel.rightEvent)
              .frame(maxWidth: .infinity, maxHeight: 30)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(.white, lineWidth: 2)
              )
            Button("Down", action: viewModel.downEvent)
              .frame(maxWidth: .infinity, maxHeight: 30)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(.white, lineWidth: 2)
              )

            Button("Rotate Right", action: viewModel.rotateTetrominoRight)
              .frame(maxWidth: .infinity, maxHeight: 30)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(.white, lineWidth: 2)
              )
            Button("Rotate Left", action: viewModel.rotateTetrominoLeft)
              .frame(maxWidth: .infinity, maxHeight: 30)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(.white, lineWidth: 2)
              )
          }
          .font(.caption)
        }
        .padding(.vertical, 20)
        .background(.gray)
        .foregroundColor(.white)
        .font(.title2)
        .cornerRadius(5)

        Spacer()

        StageView(stage: viewModel.stage)
          .aspectRatio(1, contentMode: .fit)
          .cornerRadius(5)
      }
      .padding(.top, 20)
      .padding(.horizontal, 10)
    }
  }
}

struct TetrisGame_Previews: PreviewProvider {
  static var previews: some View {
    TetrisGame()
  }
}
