//
//  FactoryTabBarController.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import UIKit
import SwiftUI

final class FactoryTabBarController {
  static func createTabBarController() -> HomeTabBarController {
    let homeController: HomeTabBarController = HomeTabBarController()
    let breathController: UIViewController = createTabBarControllers(view: BreatheViewController(), title: "Breathe", image: "house")
    let sleep: UIViewController = createTabBarControllers(view: SleepViewController(), title: "Sleep", image: "house")
    let gamesController: UIViewController = createTabBarControllers(view: GamesViewController(), title: "Games", image: "house")
    let foodController: UIViewController = createTabBarControllers(view: FoodViewController(), title: "Food", image: "house")
    homeController.setViewControllers([breathController, sleep, gamesController, foodController], animated: true)
    return homeController
  }

  static func createTabBarControllers(view: UIViewController, title: String, image: String) -> UIViewController {
    let navigation: UINavigationController = UINavigationController(rootViewController: view)
    navigation.title = title
    navigation.tabBarItem.title = title
    navigation.tabBarItem.image = UIImage(systemName: image)
    return navigation
  }
}
