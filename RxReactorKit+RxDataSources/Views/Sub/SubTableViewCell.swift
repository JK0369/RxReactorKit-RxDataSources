//
//  SubTableViewCell.swift
//  RxReactorKit+RxDataSources
//
//  Created by Jake.K on 2021/12/10.
//

import UIKit
import Reusable
import SnapKit
import ReactorKit

class SubTableViewCell: UITableViewCell, View, Reusable {
  
  var disposeBag = DisposeBag()

  // MARK: Constants
  struct Label {
    static let font = UIFont.systemFont(ofSize: 16, weight: .bold)
    static let color = UIColor.blue
    static let textAlignment = NSTextAlignment.center
  }
  
  // MARK: UI
  let titleLabel = UILabel().then {
    $0.font = Label.font
    $0.textColor = Label.color
    $0.textAlignment = Label.textAlignment
  }
  
  let messageLabel = UILabel().then {
    $0.textColor = .systemBlue
    $0.font = Label.font
    $0.textAlignment = Label.textAlignment
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
    contentView.addSubview(messageLabel)
    makeConstraints()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func makeConstraints() {
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().inset(12)
      $0.centerX.equalToSuperview()
    }
    messageLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(10)
      $0.centerX.equalToSuperview()
    }
  }
  
  // MARK: Binding
  func bind(reactor: SubTableViewCellReactor) {
    titleLabel.text = "(서브) " + reactor.currentState.message
    messageLabel.text = "(서브 cell message) \(reactor.currentState.message)"
  }
}

