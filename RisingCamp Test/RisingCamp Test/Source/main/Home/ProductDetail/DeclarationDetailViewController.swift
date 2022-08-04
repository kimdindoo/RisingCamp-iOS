//
//  DeclarationDetailViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/28.
//

import UIKit

class DeclarationDetailViewController: UIViewController {

    @IBOutlet weak var declarationTextView: UITextView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        declarationTextView.text = "신고 내용을 직접 작성해주세요. 자세하게 적어주시면 신고처리에 큰 도움이 됩니다."
        // placeholder와 같은 회색폰트로 설정
        declarationTextView.textColor = .secondaryLabel
        declarationTextView.font = .systemFont(ofSize: 16.0)
        
        declarationTextView.delegate = self
        // Do any additional setup after loading the view.
        

        
    }
    
    @IBAction func declarationButtonTapped(_ sender: Any) {
        
        DeclarationManager.shared.detailReason = declarationTextView.text
        print(DeclarationManager.shared.reportType)
        print(DeclarationManager.shared.detailReason)
        
        DeclarationManager.shared.postDeclaration(reportType: DeclarationManager.shared.reportType, detailReason: DeclarationManager.shared.detailReason)
        
        
        let alert = UIAlertController(title: "알림", message: "신고가 완료됐습니다.", preferredStyle: UIAlertController.Style.alert)
        let defaultAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.cancel, handler: nil)
        
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: false)

    }
    


}

extension DeclarationDetailViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
            // 분기 설정
            guard declarationTextView.textColor == .secondaryLabel else { return }

            declarationTextView.text = nil
            declarationTextView.textColor = .label
        }
    
   }
