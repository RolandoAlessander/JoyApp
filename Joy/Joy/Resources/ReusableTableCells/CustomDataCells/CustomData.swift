//
//  CustomDoubleInfoData.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import UIKit

struct CustomPresentationCardData: CustomCell {
  let identifier: String
  let title: String
  let subtitle: String
  let description: String
  let image: UIImage?

  init(title: String, subtitle: String, description: String, image: UIImage?) {
    self.identifier = String(describing: CustomPresentationCardCell.self)
    self.title = title
    self.subtitle = subtitle
    self.description = description
    self.image = image
  }
}

struct CustomTitleData: CustomCell {
  let identifier: String
  let title: String

  init(title: String) {
    self.identifier = String(describing: CustomTitleCell.self)
    self.title = title
  }
}

struct CustomIngredientData: CustomCell {
  let identifier: String
  let ingredient: String

  init(ingredient: String) {
    self.identifier = String(describing: CustomIngredientCell.self)
    self.ingredient = ingredient
  }
}

struct CustomPreparationData: CustomCell {
  let identifier: String
  let preparation: String

  init(preparation: String) {
    self.identifier = String(describing: CustomReceiptPreparationCell.self)
    self.preparation = preparation
  }
}

struct CustomOptionDescriptionData: CustomCell {
  let identifier: String
  let title: String
  let description: String
  let image: UIImage?

  init(title: String, description: String, image: UIImage?) {
    self.identifier = String(describing: CustomOptionDescriptionCell.self)
    self.title = title
    self.description = description
    self.image = image
  }
}
