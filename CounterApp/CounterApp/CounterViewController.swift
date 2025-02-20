//
//  ViewController.swift
//  CounterApp
//
//  Created by 곽다은 on 2/20/25.
//

import UIKit

final class CounterViewController: UIViewController {
    
    private var counter: Counter = .init()
    
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
        counterView.updateCountLabel(with: counter.value)
    }
    
    private func setAction() {
        counterView.upButton.addTarget(self, action: #selector(increaseCounter), for: .touchUpInside)
        counterView.downButton.addTarget(self, action: #selector(decreaseCounter), for: .touchUpInside)
        counterView.resetButton.addTarget(self, action: #selector(resetCounter), for: .touchUpInside)
    }
    
    @objc func increaseCounter() {
        counter.increase()
        counterView.updateCountLabel(with: counter.value)
        counterView.validateButton(button: counterView.upButton, counter.value < counter.maxValue)
    }
    
    @objc func decreaseCounter() {
        counter.decrease()
        counterView.updateCountLabel(with: counter.value)
        counterView.validateButton(button: counterView.downButton, counter.value > counter.minValue)
    }
    
    @objc func resetCounter() {
        counter.reset()
        counterView.updateCountLabel(with: counter.value)
        counterView.validateButton(button: counterView.upButton, true)
        counterView.validateButton(button: counterView.downButton, true)
    }
}

