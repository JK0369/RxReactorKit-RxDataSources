//
//  SubTableViewCellReactor.swift
//  RxReactorKit+RxDataSources
//
//  Created by Jake.K on 2021/12/10.
//

import ReactorKit
import RxCocoa

class SubTableViewCellReactor: Reactor {
  typealias Action = NoAction
  
  let initialState: Sub
  
  init(sub: Sub) {
    self.initialState = sub
  }
}

