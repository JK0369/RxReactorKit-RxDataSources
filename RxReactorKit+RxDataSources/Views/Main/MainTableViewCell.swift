//
//  MainTableViewCell.swift
//  RxReactorKit+RxDataSources
//
//  Created by Jake.K on 2021/12/09.
//

import UIKit
import Reusable
import SnapKit
import ReactorKit

class MainTableViewCell: UITableViewCell, View, Reusable {
  
  var disposeBag = DisposeBag()

  // MARK: Constants
  struct Label {
    static let font = UIFont.systemFont(ofSize: 16, weight: .bold)
    static let color = UIColor.black
  }
  
  // MARK: UI
  let titleLabel = UILabel().then {
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 15)
    $0.textColor = Label.color
    $0.textAlignment = .center
  }
  
  // MARK: Constants
  override init(
    style: UITableViewCell.CellStyle,
    reuseIdentifier: String?
  ) {
    super.init(
      style: style,
      reuseIdentifier: reuseIdentifier
    )
    
    contentView.addSubview(titleLabel)
    makeConstraints()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func makeConstraints() {
    titleLabel.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  // MARK: Binding
  func bind(reactor: MainTableViewCellReactor) {
    titleLabel.text = "(메인) " + reactor.currentState.message
  }
}
