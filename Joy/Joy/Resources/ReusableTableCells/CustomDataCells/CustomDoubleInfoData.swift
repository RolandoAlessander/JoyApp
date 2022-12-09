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
  let image: UIImage

  init(title: String, subtitle: String, description: String, image: UIImage) {
    self.identifier = String(describing: CustomPresentationCardCell.self)
    self.title = title
    self.subtitle = subtitle
    self.description = description
    self.image = image
  }
}
