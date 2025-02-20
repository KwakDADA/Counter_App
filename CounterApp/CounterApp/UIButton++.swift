//
//  UIButton++.swift
//  CounterApp
//
//  Created by 곽다은 on 2/20/25.
//

import UIKit

extension UIButton {
    static func makeCounterButton(title: String) -> UIButton {
        let button = UIButton()
        button.configuration = .gray()
        button.setTitle(title, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
