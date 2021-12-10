//
//  MainViewReactor.swift
//  RxReactorKit+RxDataSources
//
//  Created by Jake.K on 2021/12/09.
//

import ReactorKit
import RxCocoa

final class MainViewReactor: Reactor {
  enum Action {
    case viewDidLoad
  }
  
  enum Mutation {
    case updateDataSource
  }
  
  struct State {
    var messageSection = [SomeViewSection]()
  }
  
  let initialState: State
  
  init(
    initialState: State
  ) {
    self.initialState = initialState
  }
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .viewDidLoad:
      return Observable<Mutation>.just(.updateDataSource)
    }
  }
  
  func reduce(state: State, mutation: Mutation) -> State {
    var state = state
    switch mutation {
    case .updateDataSource:
      state.messageSection = getMockSections()
    }
    return state
  }
}

func getMockSections() -> [SomeViewSection] {
  let mainItem1 = SomeViewSectionItem.main(MainTableViewCellReactor(main: Main(message: "1")))
  let mainItem2 = SomeViewSectionItem.main(MainTableViewCellReactor(main: Main(message: "2")))
  let mainItem3 = SomeViewSectionItem.main(MainTableViewCellReactor(main: Main(message: "3")))
  let subItem1 = SomeViewSectionItem.sub(SubTableViewCellReactor(sub: Sub(message: "4")))
  let subItem2 = SomeViewSectionItem.sub(SubTableViewCellReactor(sub: Sub(message: "5")))
  
  let itemsInFirstSection = [mainItem1, mainItem2, mainItem3, subItem1, subItem2]
  let firstSection = SomeViewSection(
    original: SomeViewSection(
      original: .first(itemsInFirstSection),
      items: itemsInFirstSection
    ),
    items: itemsInFirstSection
  )
  
  return [firstSection]
}
