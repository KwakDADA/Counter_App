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
        updateUI()
    }
    
    private func setAction() {
        counterView.upButton.addTarget(self, action: #selector(increaseCounter), for: .touchUpInside)
        counterView.downButton.addTarget(self, action: #selector(decreaseCounter), for: .touchUpInside)
        counterView.resetButton.addTarget(self, action: #selector(resetCounter), for: .touchUpInside)
    }
    
    private func updateUI() {
        counterView.updateCountLabel(with: counter.value)
        counterView.validateButton(button: counterView.upButton, counter.value < counter.maxValue)
        counterView.validateButton(button: counterView.downButton, counter.value > counter.minValue)
    }
    
    @objc func increaseCounter() {
        counter.increase()
        updateUI()
    }
    
    @objc func decreaseCounter() {
        counter.decrease()
        updateUI()
    }
    
    @objc func resetCounter() {
        counter.reset()
        updateUI()
    }
}

