//
//  Sub.swift
//  RxReactorKit+RxDataSources
//
//  Created by Jake.K on 2021/12/10.
//

import UIKit

struct Sub: ModelType {
  var message: String
  var isDone = false
}

extension Sub: Equatable {
  
  static func == (lhs: Sub, rhs: Sub) -> Bool {
    lhs.message == rhs.message
  }
}
