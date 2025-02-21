//
//  CounterAppTests.swift
//  CounterAppTests
//
//  Created by 곽다은 on 2/20/25.
//

import XCTest
@testable import CounterApp

final class CounterViewControllerTests: XCTestCase {

        var counter: Counter!
    
    override func setUp() {
        super.setUp()
        // 각 테스트가 실행되기 전에 새 인스턴스 생성
        counter = Counter()
    }
    
    override func tearDown() {
        // 테스트가 끝난 후 인스턴스 해제
        counter = nil
        super.tearDown()
    }
    
    func testInitialValue() {
        XCTAssertEqual(counter.value, 0, "Counter의 초기 값은 0이어야 합니다.")
    }
    
    func testIncreaseDoesNotExceedMax() {
        counter.increase()
        XCTAssertEqual(counter.value, 1, "increase() 호출 후, value는 1이어야 합니다.")
        
        for _ in 1...20 {
            counter.increase()
        }
        XCTAssertEqual(counter.value, 10, "Counter는 최대값 10을 넘지 않아야 합니다.")
    }
    
    func testDecreaseDoesNotGoBelowMin() {
        counter.increase()  // 값을 1로 설정
        counter.decrease()
        XCTAssertEqual(counter.value, 0, "decrease() 호출 후, value는 0이어야 합니다.")
        
        for _ in 1...20 {
            counter.decrease()
        }
        XCTAssertEqual(counter.value, -10, "Counter는 최소값 -10보다 낮아지면 안됩니다.")
    }
    
    func testResetSetsValueToZero() {
        counter.increase()
        counter.increase()
        XCTAssertNotEqual(counter.value, 0, "증가 후 value는 0이 아니어야 합니다.")
        
        counter.reset()
        XCTAssertEqual(counter.value, 0, "reset() 호출 후, value는 0이어야 합니다.")
    }
}
