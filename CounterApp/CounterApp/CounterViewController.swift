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
    }
    
    @objc func increaseCounter() {
        counter.value += 1
        counterView.updateCountLabel(with: counter.value)
    }
}

