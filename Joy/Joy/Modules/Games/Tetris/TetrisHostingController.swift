//
//  TetrisHostingController.swift
//  Joy
//
//  Created by Rolando Alessander on 09/12/22.
//

import UIKit
import SwiftUI

class TetrisHostingController: UIHostingController<TetrisGame> {

  public override init(rootView: TetrisGame) {
    super.init(rootView: rootView)
  }

  @objc required dynamic init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder, rootView: TetrisGame())
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
}

