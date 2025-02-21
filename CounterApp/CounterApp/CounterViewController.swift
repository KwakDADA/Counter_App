//
//  ViewController.swift
//  CounterApp
//
//  Created by 곽다은 on 2/20/25.
//

import UIKit

final class CounterViewController: UIViewController {
    
    var counter: Counter = .init()
    
    private let counterView = CounterView()
    
    override func loadView() {
        view = counterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAction()
    }

    private func setUI() {
        view.backgroundColor = .white
        updateUI()
    }
    
    private func setAction() {
        counterView.upButton.addTarget(self, action: #selector(didTapUpButton), for: .touchUpInside)
        counterView.downButton.addTarget(self, action: #selector(didTapDownButton), for: .touchUpInside)
        counterView.resetButton.addTarget(self, action: #selector(didTapResetButton), for: .touchUpInside)
    }
    
    private func updateUI() {
        counterView.updateCountLabel(with: counter.value)
        counterView.validateButton(button: counterView.upButton, counter.value < counter.maxValue)
        counterView.validateButton(button: counterView.downButton, counter.value > counter.minValue)
    }
    
    @objc func didTapUpButton() {
        counter.increase()
        updateUI()
    }
    
    @objc func didTapDownButton() {
        counter.decrease()
        updateUI()
    }
    
    @objc func didTapResetButton() {
        counter.reset()
        updateUI()
    }
}

