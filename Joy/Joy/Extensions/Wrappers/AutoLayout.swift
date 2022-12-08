//
//  AutoLayout.swift
//  Joy
//
//  Created by Rolando Alessander on 08/12/22.
//

import UIKit

public protocol Buildable {
  typealias BuilderParameter = (inout Self) -> Void
  init()
}

public extension Buildable {
  static func build(_ with: BuilderParameter) -> Self {
    @UsesAutoLayout var this: Self
    this = self.init()
    with(&this)
    return this
  }
}

extension NSObject: Buildable {}

@propertyWrapper
public struct UsesAutoLayout<T: Buildable> {

  public var wrappedValue: T {
    didSet {
      guard let view = wrappedValue as? UIView else {
        return
      }
      view.translatesAutoresizingMaskIntoConstraints = false
    }
  }

  public init(wrappedValue: T) {
    self.wrappedValue = wrappedValue
  }
}
