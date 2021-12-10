//
//  Rx+Map.swift
//  RxReactorKit+RxDataSources
//
//  Created by Jake.K on 2021/12/10.
//

import RxSwift

extension ObservableType {
  func map<T>(_ element: T) -> Observable<T> {
    self.map({ _ in element })
  }
}

extension ObservableType {
  func mapVoid() -> Observable<Void> {
    self.map(Void())
  }
}
