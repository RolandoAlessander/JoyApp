//
//  GamesViewController.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import UIKit
import SwiftUI

class GamesViewController: UIHostingController<TetrisGame> {

  public override init(rootView: TetrisGame) {
    super.init(rootView: rootView)
  }

  //Use from Storyboard init
  @objc required dynamic init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder, rootView: TetrisGame())
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

//    rootView.doSomething()
//    print(rootView.text)
  }
}
