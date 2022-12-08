//
//  CustomDoubleInfoData.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import Foundation

struct CustomDoubleInfoData: CustomCell {
  let identifier: String
  let rightInfoData: String
  let leftInfoData: String

  init(rightInfoData: String, leftInfoData: String) {
    self.identifier = String(describing: CustomDoubleInfoCell.self)
    self.rightInfoData = rightInfoData
    self.leftInfoData = leftInfoData
  }
}
