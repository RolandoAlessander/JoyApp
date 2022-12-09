//
//  HomeTabBarController.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import UIKit

class HomeTabBarController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .systemBackground
    UITabBar.appearance().barTintColor = .yellow
    let tabBarAppearance = UITabBarAppearance()
    tabBarAppearance.configureWithOpaqueBackground()
    self.tabBar.scrollEdgeAppearance = tabBarAppearance
    tabBar.tintColor = .label
  }
}
