
# Counter
간단한 예제 앱으로, 버튼을 눌러 숫자를 증가시키거나 감소시키고, 초기값으로 돌아가기도 합니다.

![Simulator Screen Recording - iPhone 16 Pro - 2025-02-20 at 17 37 46](https://github.com/user-attachments/assets/fed9b9ab-4553-423f-9178-c9f9fa44e24c)

## 주요 기능
- 카운팅: 양쪽의 버튼을 통해 카운터의 값을 변경합니다. (단위: 1)
- 초기화: 카운터를 초기값으로 되돌립니다.

## 프로젝트 구조

### Model
- **CounterModel.swift:**  
  - `Counter` 구조체는 카운터의 현재 값, 최소값, 최대값을 관리하며, `increase()`, `decrease()`, `reset()` 메서드를 통해 값 변경 및 범위 제한을 수행합니다.

### View
- **CounterView.swift:**  
  - 사용자 인터페이스를 구성하는 커스텀 뷰로,  
    - 중앙의 `UILabel`은 현재 카운터 값을 표시합니다.
    - 하단의 수평 스택뷰에는 **🔺**, **🔻**, **🔄** 버튼이 포함되어 있습니다.
  - `updateCountLabel(with:)` 메서드를 통해 레이블을 업데이트하고,  
  - `validateButton(button:_:)` 메서드를 통해 버튼의 활성화 상태를 설정합니다.

### Controller
- **CounterViewController.swift:**  
  - 카운터 모델과 뷰 사이의 중재자 역할을 수행합니다.
  - 버튼 액션에서 모델(`Counter`)의 값을 변경한 후,  
    - `updateUI()` 메서드를 호출하여 모델의 변경 사항을 UI에 반영합니다.
  - 이 방식은 모델 업데이트와 UI 업데이트를 한 곳에 모아두어 코드 중복을 줄이고, 업데이트 누락 위험을 최소화합니다.

## UI 업데이트 메커니즘
모델의 값이 변경될 때마다, **CounterViewController**의 `updateUI()` 메서드가 호출되어 아래와 같은 작업을 수행합니다:

- **카운터 값 표시:**  
  - `CounterView`의 `updateCountLabel(with:)`를 호출하여 현재 카운터 값을 레이블에 반영합니다.
- **버튼 상태 검증:**  
  - `validateButton(button:_:)` 메서드를 통해 증가 버튼은 `counter.value < counter.maxValue`,  
    감소 버튼은 `counter.value > counter.minValue` 조건에 따라 활성화/비활성화 상태로 설정합니다.
