//
//  ViewController.swift
//  CounterApp
//
//  Created by 곽다은 on 2/20/25.
//

import UIKit

final class CounterViewController: UIViewController {
    
    private var counter: Counter = .init(value: 0)
    
    private let counterView = CounterView()
    
    override func loadView() {
        view = counterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }

    private func setUI() {
        view.backgroundColor = .white
        counterView.countLabel.text = "\(counter.value)"
    }
}

