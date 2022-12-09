//
//  TetrisGame.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import SwiftUI

struct TetrisGame: View {

  @Environment(\.dismiss) var dismiss

  @ObservedObject private var viewModel: TetrisGameViewModel = TetrisGameViewModel()
  
  var body: some View {
    ZStack {
      Color.black
        .edgesIgnoringSafeArea(.all)
      VStack {
        VStack {
          HStack {
            Button("X") {
              dismiss()
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))

            Text("Score: \(viewModel.score)")
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal, 15)

            Button("Start") {
              //
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
          }
        }.padding(.vertical, 12)
          .background(.black)
          .foregroundColor(.white)
          .font(.title2)
          .cornerRadius(5)

        StageView(stage: viewModel.stage)
          .cornerRadius(5)

        VStack {

          HStack {
            Spacer()

            Button {
              viewModel.rotateTetrominoLeft()
            } label: {
              Image(systemName: "arrow.counterclockwise")
                .font(.system(size: 30))
            }
            .frame(width: 30, height: 30, alignment: .center)

            Spacer()

            Button {
              viewModel.leftEvent()
            } label: {
              Image(systemName: "arrowtriangle.backward")
                .font(.system(size: 30))
            }
            .frame(width: 30, height: 30, alignment: .center)

            Button {
              viewModel.rightEvent()
            } label: {
              Image(systemName: "arrowtriangle.forward")
                .font(.system(size: 30))
            }
            .frame(width: 30, height: 30, alignment: .center)
            .padding(.leading, 20)

            Spacer()

            Button {
              viewModel.rotateTetrominoRight()
            } label: {
              Image(systemName: "arrow.clockwise")
                .font(.system(size: 30))
            }
            .frame(width: 30, height: 0, alignment: .center)

            Spacer()
          }
          Button {
            viewModel.downEvent()
          } label: {
            Image(systemName: "arrowtriangle.down")
              .font(.system(size: 30))
          }
          .frame(width: 30, height: 30, alignment: .center)

        }
        .font(.caption)
        .padding(.vertical, 0)
        .background(.black)
        .foregroundColor(.white)
        .font(.title2)
        .cornerRadius(5)

        Spacer()
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
