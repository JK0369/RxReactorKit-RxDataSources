//
//  MainTableViewCellReactor.swift
//  RxReactorKit+RxDataSources
//
//  Created by Jake.K on 2021/12/10.
//

import ReactorKit

class MainTableViewCellReactor: Reactor {
  typealias Action = NoAction
  
  let initialState: Main
  
  init(main: Main) {
    self.initialState = main
  }
}
