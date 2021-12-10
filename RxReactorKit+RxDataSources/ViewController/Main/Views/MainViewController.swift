//
//  MainViewController.swift
//  RxReactorKit+RxDataSources
//
//  Created by Jake.K on 2021/12/09.
//

import ReactorKit
import RxSwift
import RxCocoa
import RxDataSources
import Then
import SnapKit
import Reusable

final class MainViewController: UIViewController, View {
  
  var disposeBag = DisposeBag()
  
  typealias Reactor = MainViewReactor
  
  var dataSource = RxTableViewSectionedReloadDataSource<SomeViewSection> { dataSource, tableView, indexPath, sectionItem in
    switch sectionItem {
    case .main(let reactor):
      let cell = tableView.dequeueReusableCell(for: indexPath) as MainTableViewCell
      cell.reactor = reactor
      return cell
    case .sub(let reactor):
      let cell = tableView.dequeueReusableCell(for: indexPath) as SubTableViewCell
      cell.reactor = reactor
      return cell
    }
  }
  
  private let tableView = UITableView().then {
    $0.register(cellType: MainTableViewCell.self)
    $0.register(cellType: SubTableViewCell.self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.setupLayout()
    self.setupView()
  }
  
  private func setupLayout() {
    self.view.addSubview(tableView)
    self.tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  private func setupView() {
    self.tableView.rx.setDelegate(self)
      .disposed(by: disposeBag)
  }
  
  func bind(reactor: MainViewReactor) {
    //Action
    self.rx.viewDidLoad
      .mapVoid()
      .map(Reactor.Action.viewDidLoad)
      .bind(to: reactor.action)
      .disposed(by: self.disposeBag)
      
    //State
    reactor.state
      .map { $0.messageSection }
      .bind(to: self.tableView.rx.items(dataSource: dataSource))
      .disposed(by: self.disposeBag)
  }
}

extension MainViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 65
  }
}
