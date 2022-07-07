//
//  OrderDetailViewController.swift
//  Starbucks Clone
//
//  Created by 김진수 on 2022/06/21.
//

import UIKit

class OrderDetailViewController: UIViewController {

    
    @IBOutlet weak var tallBtn: UIButton!
    
    @IBOutlet weak var grandeBtn: UIButton!
    
    @IBOutlet weak var ventiBtn: UIButton!
    
    @IBOutlet weak var coffeName: UILabel!
    
    @IBOutlet weak var chooseCupSize: UISegmentedControl!
    
    @IBOutlet weak var cupSize: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let alret = UIAlertController(title: "개인컵 가져오셨나요?", message: "개인컵 사용하시면 400원 할인됩니다.", preferredStyle: .alert)
        let yes = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alret.addAction(yes)
        
        present(alret, animated: true, completion: nil)
    }


    
    @IBAction func tallBtnClick(_ sender: UIButton) {
        tallBtn.layer.borderWidth = 2
        tallBtn.layer.borderColor = UIColor.green.cgColor
    }
    
    @IBAction func grandeBtnClick(_ sender: UIButton) {
        grandeBtn.layer.borderWidth = 2
        grandeBtn.layer.borderColor = UIColor.green.cgColor
    }
    
    @IBAction func ventiBtnClick(_ sender: UIButton) {
        ventiBtn.layer.borderWidth = 2
        ventiBtn.layer.borderColor = UIColor.green.cgColor
    }
    
    @IBAction func orderPressed(_ sender: UIButton) {
        let alret = UIAlertController(title: "주문완료", message: "딘두님 주문이 완료됐습니다.", preferredStyle: .alert)
        let yes = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        alret.addAction(yes)
        
        present(alret, animated: true, completion: nil)
    }

    @IBAction func cartPressed(_ sender: Any) {
        
//        let data1: String = coffeName.text!
//        let data2: String = cupSize.text!
//
//        let shoppingCartViewController = self.storyboard?.instantiateViewController(withIdentifier: "ShoppingCartViewController") as! ShoppingCartViewController
//
//        shoppingCartViewController.result1 = data1
//        shoppingCartViewController.result2 = data2
//
//        self.present(shoppingCartViewController, animated: true, completion: nil)
        
        // 2. segue 이용한 화면 전달
        performSegue(withIdentifier: "goToSecond", sender: sender)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let data1: String = coffeName.text!
        let data2: String = cupSize.text!
        
        if segue.identifier == "goToSecond" {
            let vc = segue.destination as! ShoppingCartViewController
            vc.result1 = data1
            vc.result2 = data2
        }
    }
    
    
    @IBAction func indexChanged(_ sender: Any) {
        switch chooseCupSize.selectedSegmentIndex {
        case 0:
            cupSize.text = "매장컵"
        case 1:
            cupSize.text = "개인컵"
        case 2:
            cupSize.text = "일회용컵"

        default:
            break
        }
    }
    
}
