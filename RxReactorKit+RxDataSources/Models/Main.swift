//
//  Main.swift
//  RxReactorKit+RxDataSources
//
//  Created by Jake.K on 2021/12/09.
//

import RxDataSources

struct Main: ModelType {
  var message: String
  var isDone = false
}

extension Main: Equatable {
  
  static func == (lhs: Main, rhs: Main) -> Bool {
    lhs.message == rhs.message
  }
}
