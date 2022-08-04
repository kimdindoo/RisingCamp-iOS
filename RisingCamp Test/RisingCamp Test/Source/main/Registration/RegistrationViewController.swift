//
//  RegistrationViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/16.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var selectOptionButton: UIButton!
    
    @IBOutlet weak var securePaymentButton: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectOptionButton.layer.borderWidth = 0.5
        selectOptionButton.layer.borderColor = UIColor.lightGray.cgColor
        
        securePaymentButton.layer.borderWidth = 0.5
        securePaymentButton.layer.borderColor = UIColor.lightGray.cgColor
        
        textView.text = "여러 장의 상품 사진과 구입 연도, 브랜드, 사용감, 하자 유무 등 구매자에게 필요한 정보를 꼭 포함해주세요. 문의를 줄이고 더 쉽게 판매할 수 있어요. (10자 이상)"
        // placeholder와 같은 회색폰트로 설정
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 15.0)
        // delegate설정
        textView.delegate = self
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
    }
    
}

extension RegistrationViewController: UITextViewDelegate {
    // didBiginEditing: textView에 텍스트 입력이 시작되면 실행되는 함수
    func textViewDidBeginEditing(_ textView: UITextView) {
        // 분기 설정
        guard textView.textColor == .secondaryLabel else { return }

        textView.text = nil
        textView.textColor = .label
    }
}
