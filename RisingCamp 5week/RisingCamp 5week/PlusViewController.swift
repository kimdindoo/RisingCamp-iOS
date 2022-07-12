//
//  PlusViewController.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/10.
//

import UIKit

class PlusViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func closeButtonTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "FindGRViewController", bundle: nil)
        let myModalViewController = storyboard.instantiateViewController(withIdentifier: "FindGRViewController")
        myModalViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        myModalViewController.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(myModalViewController, animated: true, completion: nil)    }
    
}
