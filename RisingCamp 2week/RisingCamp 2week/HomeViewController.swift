//
//  ViewController.swift
//  Starbucks Clone
//
//  Created by 김진수 on 2022/06/15.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var shadowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shadowView.dropShadow()
        // Do any additional setup after loading the view.
    }
    
    
    

}

extension UIView {
    func dropShadow(scale: Bool = true) {
        
        layer.shadowColor = UIColor.black.cgColor
        // 그림자 색 지정
        layer.shadowOpacity = 0.2
        // 투명도 지정 (0~1)
        layer.shadowRadius = 1
        // 그림자 blur 정도 지정 (0일때 선같이 진한 그림자 높을 수록 퍼지는 효과)
        layer.shadowOffset = CGSize(width: 0, height: 4)
        // 그림자의 위치(기본 0,0 -> 부모의 위치를 따라감)
        layer.shadowPath = nil
        // 그림자의 모양을 커스텀 가능(디폴트 nil)
        
        // commit test
    }
}
