//
//  CounterView.swift
//  CounterApp
//
//  Created by 곽다은 on 2/20/25.
//

import UIKit

final class CounterView: UIView {
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let upButton: UIButton = .makeCounterButton(title: CounterButtonTitle.up)
    
    let downButton: UIButton = .makeCounterButton(title: CounterButtonTitle.down)
    
    let resetButton: UIButton = .makeCounterButton(title: CounterButtonTitle.reset)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setAddView()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAddView() {
        [
            countLabel,
            buttonStackView
        ].forEach { addSubview($0) }
        
        [
            upButton,
            resetButton,
            downButton
        ].forEach { buttonStackView.addArrangedSubview($0) }
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            buttonStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonStackView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func updateCountLabel(with value: Int) {
        countLabel.text = "\(value)"
    }
    
    func validateButton(button: UIButton, _ valid: Bool) {
        button.isEnabled = valid
    }
}
