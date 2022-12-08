//
//  FactoryTabBarController.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import UIKit

final class FactoryTabBarController {
  static func createTabBarController() -> HomeTabBarController {
    let homeController: HomeTabBarController = HomeTabBarController()
    let breathController: BreatheViewController = BreatheViewController()
    let sleep: SleepViewController = SleepViewController()
    let gamesController: GamesViewController = GamesViewController()
    let foodController: FoodViewController = FoodViewController()
    homeController.setViewControllers([breathController, sleep, gamesController, foodController], animated: true)
    return homeController
  }

  static func createTabBarControllers(view: UIViewController, title: String, image: UIImage) -> UIViewController {
    view.title = title
    return
  }
}
//