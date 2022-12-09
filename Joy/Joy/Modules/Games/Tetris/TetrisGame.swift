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
          Text("Score: 0")
          .frame(maxWidth: .infinity, alignment: .center)
          .padding(.horizontal, 15)
        }.padding(.vertical, 12)
          .background(.gray)
          .foregroundColor(.white)
          .font(.title2)
          .cornerRadius(5)

        StageView(stage: viewModel.stage)
          .aspectRatio(1, contentMode: .fit)
          .cornerRadius(5)

        VStack {
//          Button("Start", action: viewModel.startEvent)
//            .frame(maxWidth: .infinity, maxHeight: 30)
//            .overlay(
//              RoundedRectangle(cornerRadius: 10)
//                .stroke(.white, lineWidth: 2)
//            )
          HStack {
            Spacer()
            Button("R L", action: viewModel.rotateTetrominoLeft)
              .frame(width: 50, height: 50, alignment: .center)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(.white, lineWidth: 2)
              )

            Spacer()

            Button("L", action: viewModel.leftEvent)
              .frame(width: 50, height: 50, alignment: .center)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(.white, lineWidth: 2)
              )
            Button("R", action: viewModel.rightEvent)
              .frame(width: 50, height: 50, alignment: .center)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(.white, lineWidth: 2)
              )

            Spacer()

            Button("R R", action: viewModel.rotateTetrominoRight)
              .frame(width: 50, height: 50, alignment: .center)
              .overlay(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(.white, lineWidth: 2)
              )

            Spacer()
          }
          Button("Down", action: viewModel.downEvent)
            .frame(width: 50, height: 50, alignment: .center)
            .overlay(
              RoundedRectangle(cornerRadius: 10)
                .stroke(.white, lineWidth: 2)
            )
            .frame(width: 50, height: 50, alignment: .leading)

        }
        .font(.caption)
        .padding(.vertical, 0)
        .background(.gray)
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
