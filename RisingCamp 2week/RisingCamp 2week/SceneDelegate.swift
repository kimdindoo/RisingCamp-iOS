//
//  SceneDelegate.swift
//  Starbucks Clone
//
//  Created by 김진수 on 2022/06/15.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    // App Switcher 1. 이미지뷰 생성
    var imageView: UIImageView?
    
    // blur UIVisualEffectView 생성
//    var blurView: UIVisualEffectView?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // App Switcher 3. 앱이 다시 활성화 상태가 되면 이미지뷰를 superview(window)에서 제거한다.
        if let imageView = imageView {
            imageView.removeFromSuperview()
        }
        
        // blur
//        if let blurView = blurView {
//            blurView.removeFromSuperview()
//        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // App Switcher 2. will resign active 상태가 호출되면 imageview를 window 크기로 잡아주고 window에 추가한다
        guard let window = window else {
            return
        }
        imageView = UIImageView(frame:  window.frame)
        imageView?.image = UIImage(named: "starbuckslogo.png")
        window.addSubview(imageView!)

        // blur#imageLiteral(resourceName: "simulator_screenshot_A1AAEDC2-E1E5-42F1-98D7-5B638AA8E4C4.png")
//        let effect = UIBlurEffect(style: .regular)
//        blurView = UIVisualEffectView(effect: effect)
//        blurView?.frame = window.frame
//        window.addSubview(blurView!)

    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

