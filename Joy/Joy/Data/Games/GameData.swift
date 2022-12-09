//
//  GameType.swift
//  Joy
//
//  Created by Rolando Alessander on 09/12/22.
//

import UIKit

class GameData {
  static func getGamesData() -> [CustomCell] {
    return [
      CustomOptionDescriptionData(title: "Games", description: "Games are fun", image: UIImage(named: "letsplay")),
      CustomPresentationCardData(
        title: "Tetris",
        subtitle: "tetris is fun",
        description: "play tetris because is fun",
        image: UIImage(named: "tetris")
      ),
      CustomPresentationCardData(
        title: "CandyCrush",
        subtitle: "candy crush subtitle",
        description: "candy crush description",
        image: UIImage(named: "candycrush")
      ),
      CustomPresentationCardData(
        title: "Monument Valley",
        subtitle: "Monument Valley subtitle",
        description: "Monument Valley description",
        image: UIImage(named: "monumentum")
      ),
      CustomPresentationCardData(
        title: "Zenge",
        subtitle: "Monument Valley subtitle",
        description: "Monument Valley description",
        image: UIImage(named: "zenge")
      )
    ]
  }
}

