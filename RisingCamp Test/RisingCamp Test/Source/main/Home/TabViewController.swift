//
//  TabViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/18.
//

import UIKit
import Tabman
import Pageboy

class TabViewController: TabmanViewController {


    private var viewControllers: Array<UIViewController> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // tab에 보여질 VC 추가
        let vc2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabManFirstViewController") as! TabManFirstViewController
        let vc3 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabManSecondController") as! TabManSecondViewController
                
            viewControllers.append(vc2)
            viewControllers.append(vc3)
        
        self.dataSource = self
        // 스와이프 disable
        // self.isScrollEnabled = false

        // 바 생성 + tabbar 에 관한 디자인처리를 여기서 하면 된다.
        let bar = TMBar.ButtonBar()
        // 탭바 배경색
//        let systemBar = bar.systemBar()
//        systemBar.backgroundStyle = .blur(style: .light)
        
        
        bar.layout.transitionStyle = .snap
        // tab 밑 bar 색깔 & 크기
        bar.indicator.weight = .custom(value: 1)
        bar.indicator.tintColor = .black
        // tap center
        bar.layout.alignment = .leading
        // tap 사이 간격
        bar.layout.interButtonSpacing = 15
        
        // tap 왼쪽 띄우기
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 0.0)
        
        // tap 선택 / 미선택
        bar.buttons.customize { (button) in
            button.tintColor = .gray
            button.selectedTintColor = .black
            button.selectedFont = UIFont.systemFont(ofSize: 16, weight: .medium)
        }

        // bar를 안보이게 하고 싶으면 addBar를 지우면 된다. at -> bar 위치
        addBar(bar, dataSource: self, at: .top)
    }
}

extension TabViewController: PageboyViewControllerDataSource, TMBarDataSource {

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
        // return .at(index: 0) -> index를 통해 처음에 보이는 탭을 설정할 수 있다.
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
        let title: String = index == 0 ? "추천상품" : "브랜드"
        item.title = title
        return item
    }
}
