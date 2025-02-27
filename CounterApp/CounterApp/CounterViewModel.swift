//
//  CounterViewModel.swift
//  CounterApp
//
//  Created by 곽다은 on 2/20/25.
//

import RxSwift
import RxCocoa

final class CounterViewModel {
    let counter: BehaviorRelay<Int>
    let maxValue: Int
    let minValue: Int
    
    init(initValue: Int = 0, maxValue: Int = 10, minValue: Int = -10) {
        self.counter = BehaviorRelay(value: initValue)
        self.maxValue = maxValue
        self.minValue = minValue
    }
    
    var canIncrease: Bool {
        return counter.value < maxValue
    }
    
    var canDecrease: Bool {
        return counter.value > minValue
    }
    
    func increase() {
        let newValue = counter.value + 1
        if canIncrease {
            counter.accept(newValue)
        }
    }
    
    func decrease() {
        let newValue = counter.value - 1
        if canDecrease {
            counter.accept(newValue)
        }
    }
    
    func reset() {
        counter.accept(0)
    }
}
