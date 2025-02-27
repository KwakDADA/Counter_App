//
//  ViewController.swift
//  CounterApp
//
//  Created by 곽다은 on 2/20/25.
//

import RxSwift
import RxCocoa

final class CounterViewController: UIViewController {
    
    private let disposeBag: DisposeBag = .init()
    private let viewModel: CounterViewModel = .init()
    private let counterView = CounterView()
    
    override func loadView() {
        view = counterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        bindActions()
        bindViewModelStates()
    }

    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func bindActions() {
        counterView.upButton.rx.tap
            .asDriver()
            .drive(with: self) { owner, _ in owner.viewModel.increase()}
            .disposed(by: disposeBag)
        
        counterView.downButton.rx.tap
            .asDriver()
            .drive(with: self) { owner, _ in owner.viewModel.decrease() }
            .disposed(by: disposeBag)
        
        counterView.resetButton.rx.tap
            .asDriver()
            .drive(with: self) { owner, _ in owner.viewModel.reset() }
            .disposed(by: disposeBag)
    }
    
    private func bindViewModelStates() {
        viewModel.counter
            .asDriver()
            .drive(with: self) { owner, value in
                let view = owner.counterView
                view.updateCountLabel(with: value)
                view.validateButton(button: view.upButton, owner.viewModel.canIncrease)
                view.validateButton(button: view.downButton, owner.viewModel.canDecrease)
            }
            .disposed(by: disposeBag)
    }
}

