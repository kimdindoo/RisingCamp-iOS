//
//  ViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/16.
//

import UIKit
import ImageSlideshow


class HomeViewController: UIViewController {

    @IBOutlet weak var VerticalScrollView: UIScrollView!
    
    @IBOutlet var myImageSlide: ImageSlideshow!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var viewTopHeight: NSLayoutConstraint!
    
//    let MaxTopHeight: CGFloat = 250
//    let MinTopHeight: CGFloat = 50 + 200
    
    let imageResources = [
        ImageSource(image: UIImage(named: "홈화면배너1")!),
        ImageSource(image: UIImage(named: "홈화면배너2")!),
        ImageSource(image: UIImage(named: "홈화면배너3")!),
        ImageSource(image: UIImage(named: "홈화면배너4")!),
        ImageSource(image: UIImage(named: "홈화면배너5")!),
        ImageSource(image: UIImage(named: "홈화면배너6")!),
        ImageSource(image: UIImage(named: "홈화면배너7")!),
        ImageSource(image: UIImage(named: "홈화면배너8")!),


    ]
    
//     네비게이션 바 back 버튼 없애기
    override func viewWillAppear(_ animated: Bool) {
//         super.viewWillAppear(animated)
//         self.navigationItem.hidesBackButton = true


    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 이미지 슬라이드
        updateImageSlide()
 
        // 스크롤뷰 바운스 제거
        scrollView.bounces = false
        
        // 검색 컨트롤러에서 탭바를 숨겨놔서 다시 홈으로 올땐 탭바 보이게
//        self.tabBarController?.tabBar.isHidden = false

        VerticalScrollView.contentInsetAdjustmentBehavior = .never

    }
    
    
    
    private func updateImageSlide() {
//        myImageSlide.setImageInputs(imageResources) - 순서를 마지막으로 해야 labelPage가 보인다.
        myImageSlide.contentScaleMode = .scaleAspectFill
        // 배너 자동 넘김
        myImageSlide.slideshowInterval = 3
        // 1/8 숫자 형식으로 페이지
        let labelPageIndicator = LabelPageIndicator() // 2/10
        labelPageIndicator.textColor = .white
        myImageSlide.pageIndicatorPosition = PageIndicatorPosition(horizontal: .right(padding: 20), vertical: .customBottom(padding: 30))
        myImageSlide.pageIndicator = labelPageIndicator
        myImageSlide.setImageInputs(imageResources)

    }
    



}
