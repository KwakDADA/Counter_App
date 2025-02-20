//
//  CounterModel.swift
//  CounterApp
//
//  Created by 곽다은 on 2/20/25.
//

import Foundation

struct Counter {
    var value: Int
    private let minValue: Int = -10
    private let maxValue: Int = 10
    
    init(value: Int = 0) {
        self.value = value
    }
    
    mutating func increase() {
        self.value = min(maxValue, value + 1)
    }
    
    mutating func decrease() {
        self.value = max(minValue, value - 1)
    }
    
    mutating func reset() {
        self.value = 0
    }
}

enum CounterButtonTitle {
    static let up = "🔺"
    static let down = "🔻"
    static let reset = "🔄"
}
