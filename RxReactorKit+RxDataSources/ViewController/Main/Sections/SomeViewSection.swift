//
//  SomeViewSection.swift
//  RxReactorKit+RxDataSources
//
//  Created by Jake.K on 2021/12/10.
//

import RxDataSources

enum SomeViewSection {
  case first([SomeViewSectionItem])
}

enum SomeViewSectionItem {
  case main(MainTableViewCellReactor)
  case sub(SubTableViewCellReactor)
}

extension SomeViewSection: SectionModelType {
  var items: [SomeViewSectionItem] {
    switch self {
    case .first(let items): return items
    }
  }
  
  init(original: SomeViewSection, items: [SomeViewSectionItem]) {
    switch original {
    case .first: self = .first(items)
    }
  }
}
