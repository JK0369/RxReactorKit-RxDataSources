//
//  ViewController.swift
//  RxReactorKit+RxDataSources
//
//  Created by Jake.K on 2021/12/09.
//

import UIKit
import Then
import RxCocoa
import SnapKit
import RxSwift

class ViewController: UIViewController {
  
  let disposeBag = DisposeBag()
  
  let startButton = UIButton().then {
    $0.setTitleColor(.systemBlue, for: .normal)
    $0.setTitleColor(.blue, for: .highlighted)
    $0.setTitle("시작", for: .normal)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(startButton)
    self.startButton.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    startButton.rx.tap
      .bind { [weak self] _ in self?.presentMain() }
      .disposed(by: disposeBag)
  }
  
  private func presentMain() {
    let mainViewController = MainViewController()
    let reactor = MainViewReactor(initialState: MainViewReactor.State())
    mainViewController.reactor = reactor
    present(
      mainViewController,
      animated: true,
      completion: nil
    )
  }
}
