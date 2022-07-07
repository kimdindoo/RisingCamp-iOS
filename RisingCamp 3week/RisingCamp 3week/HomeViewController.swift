//
//  HomeViewController.swift
//  RisingCamp 3week
//
//  Created by 김진수 on 2022/06/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addButton: UIButton!
    
    var productModel = [
        ProductList(image: "에어팟.jpeg", name: "에어팟프로", location: "오전동", price: 150000, uploadTime: "1초 전"),
        ProductList(image: "아이폰.jpeg", name: "아이폰12미니", location: "군포시 산본2동", price: 400000, uploadTime: "6초 전"),
        ProductList(image: "맥북.jpeg", name: "맥북 m1 프로", location: "군포시 산본동", price: 800000, uploadTime: "9초 전"),
        ProductList(image: "아이패드.jpeg", name: "아이패드 프로 5세대", location: "안양시 만안구 안양6동", price: 800000, uploadTime: "30초 전"),
        ProductList(image: "나이키반팔.jpeg", name: "나이키 반팔", location: "안양시 동안구 비산동", price: 20000, uploadTime: "1분 전"),
        ProductList(image: "아디다스반바지.jpeg", name: "아디다스 반바지", location: "내손동", price: 30000, uploadTime: "1분 전"),
        ProductList(image: "해피해킹.jpeg", name: "해피해킹 하이브리드 타입s", location: "안양시 동안구 부림동", price: 330000, uploadTime: "3분 전"),
        ProductList(image: "mxkey.jpeg", name: "로지텍 키보드 mx key", location: "용인시 수지구 동천동", price: 100000, uploadTime: "5분 전"),
        ProductList(image: "애플워치.jpeg", name: "애플워치 6세대 스테인리스", location: "오전동", price: 600000, uploadTime: "10분 전"),
        ProductList(image: "에어팟.jpeg", name: "에어팟프로", location: "오전동", price: 150000, uploadTime: "1초 전"),
        ProductList(image: "아이폰.jpeg", name: "아이폰12미니", location: "군포시 산본2동", price: 400000, uploadTime: "6초 전"),
        ProductList(image: "맥북.jpeg", name: "맥북 m1 프로", location: "군포시 산본동", price: 800000, uploadTime: "9초 전"),
        ProductList(image: "아이패드.jpeg", name: "아이패드 프로 5세대", location: "안양시 만안구 안양6동", price: 800000, uploadTime: "30초 전"),
        ProductList(image: "나이키반팔.jpeg", name: "나이키 반팔", location: "안양시 동안구 비산동", price: 20000, uploadTime: "1분 전"),
        ProductList(image: "아디다스반바지.jpeg", name: "아디다스 반바지", location: "내손동", price: 30000, uploadTime: "1분 전"),
        ProductList(image: "해피해킹.jpeg", name: "해피해킹 하이브리드 타입s", location: "안양시 동안구 부림동", price: 330000, uploadTime: "3분 전"),
        ProductList(image: "mxkey.jpeg", name: "로지텍 키보드 mx key", location: "용인시 수지구 동천동", price: 100000, uploadTime: "5분 전"),
        ProductList(image: "애플워치.jpeg", name: "애플워치 6세대 스테인리스", location: "오전동", price: 600000, uploadTime: "10분 전"),
    ]
    
    func remove(at indexPath: IndexPath, to tableView:UITableView) {
        productModel.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func viewDidLoad() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressCalled(gestureRecognizer:)))
            tableView.addGestureRecognizer(longPressGesture)
    }
    
//    func setProductData() {
//        productModel.append(contentsOf: <#T##Sequence#>)
//    }
    
    
//    @IBAction func longPressCalled(_ sender: UILongPressGestureRecognizer) {
//    }
    
    func snapShotOfCall(_ inputView: UIView) -> UIView {
        UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0.0)
        inputView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
            
        let cellSnapshot: UIView = UIImageView(image: image)
        cellSnapshot.layer.masksToBounds = false
        cellSnapshot.layer.cornerRadius = 0.0
        cellSnapshot.layer.shadowOffset = CGSize(width: -5.0, height: 0.0)
        cellSnapshot.layer.shadowRadius = 5.0
        cellSnapshot.layer.shadowOpacity = 0.4
            
        return cellSnapshot
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        
        

        
        
        let alert = UIAlertController(title: "물품 올리기", message: nil, preferredStyle: .alert)
        let registerbutton = UIAlertAction(title: "등록", style: .default, handler: { [weak self]_ in
            guard let name = alert.textFields?[0].text else { return }
            guard let price = Int(alert.textFields?[1].text ?? "") else { return }
            
            func DecimalWon(value: Int) -> String{
                    let numberFormatter = NumberFormatter()
                    numberFormatter.numberStyle = .decimal
                    let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
                    
                    return result
                }

            let productList = ProductList(image: "test", name: name, location: "오전동", price: price, uploadTime: "방금 전")
            self?.productModel.append(productList)
            self?.tableView.reloadData()
        })
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerbutton)
        alert.addTextField(configurationHandler: { textField in textField.placeholder = "제목"})
        alert.addTextField(configurationHandler: { textField in textField.placeholder = "가격"})
        self.present(alert, animated: true, completion: nil)
    }
    
}




extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell else {
            return UITableViewCell()
        }
    
        cell.productImage.image = UIImage(named: productModel[indexPath.row].image)
        cell.setCell(product: productModel[indexPath.row])
        
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            // cell 데이터르르 담은 배열 이름을 적고 .remove() 합니다.
            productModel.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
  
    
    
}



extension HomeViewController {
    @objc func longPressCalled(gestureRecognizer: UIGestureRecognizer) {
        guard let longPress = gestureRecognizer as? UILongPressGestureRecognizer else { return }
        let state = longPress.state
        let locationInView = longPress.location(in: tableView)
        let indexPath = tableView.indexPathForRow(at: locationInView)
        
        // 최초 indexPath 변수
        struct Initial {
            static var initialIndexPath: IndexPath?
        }
        
        // 스냅샷
        struct MyCell {
            static var cellSnapshot: UIView?
            static var cellIsAnimating: Bool = false
            static var cellNeedToShow: Bool = false
        }
        
        // UIGestureRecognizer 상태에 따른 case 분기처리
        switch state {
            
        // longPress 제스처가 시작할 때 case
        case UIGestureRecognizer.State.began:
            if indexPath != nil {
                Initial.initialIndexPath = indexPath
                var cell: UITableViewCell? = UITableViewCell()
                cell = tableView.cellForRow(at: indexPath!)
                
                MyCell.cellSnapshot = snapShotOfCall(cell!)
                
                var center = cell?.center
                MyCell.cellSnapshot!.center = center!
                // 원래 처음 꾹 누른 부분의 기존 row는 가려준다.
                MyCell.cellSnapshot!.alpha = 0.0
                tableView.addSubview(MyCell.cellSnapshot!)
                
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    center?.y = locationInView.y
                    MyCell.cellIsAnimating = true
                    MyCell.cellSnapshot!.center = center!
                    MyCell.cellSnapshot!.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                    MyCell.cellSnapshot!.alpha = 0.98
                    cell?.alpha = 0.0
                }, completion: { (finished) -> Void in
                    if finished {
                        MyCell.cellIsAnimating = false
                        if MyCell.cellNeedToShow {
                            MyCell.cellNeedToShow = false
                            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                                cell?.alpha = 1
                            })
                        } else {
                            cell?.isHidden = true
                        }
                    }
                })
            }
        // longPress 제스처가 변경될 때 case
        case UIGestureRecognizer.State.changed:
            if MyCell.cellSnapshot != nil {
                var center = MyCell.cellSnapshot!.center
                center.y = locationInView.y
                MyCell.cellSnapshot!.center = center
                
                if ((indexPath != nil) && (indexPath != Initial.initialIndexPath)) && Initial.initialIndexPath != nil {
                    // 메모리 관련 이슈때문에 바꿔준 부분
                    self.productModel.insert(self.productModel.remove(at: Initial.initialIndexPath!.row), at: indexPath!.row)
                    tableView.moveRow(at: Initial.initialIndexPath!, to: indexPath!)
                    Initial.initialIndexPath = indexPath
                }
            }
        // longPress 제스처가 끝났을 때 case
        default:
            if Initial.initialIndexPath != nil {
                let cell = tableView.cellForRow(at: Initial.initialIndexPath!)
                if MyCell.cellIsAnimating {
                    MyCell.cellNeedToShow = true
                } else {
                    cell?.isHidden = false
                    cell?.alpha = 0.0
                }
                
                UIView.animate(withDuration: 0.2, animations: { () -> Void in
                    MyCell.cellSnapshot!.center = (cell?.center)!
                    MyCell.cellSnapshot!.transform = CGAffineTransform.identity
                    MyCell.cellSnapshot!.alpha = 0.0
                    cell?.alpha = 1.0
                    
                }, completion: { (finished) -> Void in
                    if finished {
                        Initial.initialIndexPath = nil
                        MyCell.cellSnapshot!.removeFromSuperview()
                        MyCell.cellSnapshot = nil
                    }
                })
            }
        }
    }
}
