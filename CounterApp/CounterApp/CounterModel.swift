//
//  CounterModel.swift
//  CounterApp
//
//  Created by 곽다은 on 2/20/25.
//

import Foundation

final class Counter {
    var value: Int
    
    init(value: Int = 0) {
        self.value = value
    }
}

enum CounterButtonTitle {
    static let up = "🔺"
    static let down = "🔻"
    static let reset = "🔄"
}
