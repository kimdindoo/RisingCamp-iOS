//
//  ChattingViewController.swift
//  RisingCamp 3week
//
//  Created by 김진수 on 2022/06/26.
//

import UIKit

class ChattingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var chattingModel = [
        ChattingList(nickName: "철수", messeage: "감사합니다.", location: "오전동", time: "1일 전", productImage: "에어팟.jpeg"),
        ChattingList(nickName: "영희", messeage: "구매 가능한가요?", location: "산본2동", time: "3일 전", productImage: "맥북.jpeg"),
        ChattingList(nickName: "룰루", messeage: "상태 어떠한가요?", location: "부림동", time: "4일 전", productImage: "나이키반팔.jpeg"),
        ChattingList(nickName: "랄라", messeage: "좋은 하루 되세요.", location: "오전동", time: "5일 전", productImage: "아디다스반바지.jpeg"),
        ChattingList(nickName: "훈이", messeage: "감사합니다.", location: "오전동", time: "1주 전", productImage: "애플워치.jpeg"),
        ChattingList(nickName: "민이", messeage: "감사합니다.", location: "오전동", time: "1주 전", productImage: "해피해킹.jpeg"),
        ChattingList(nickName: "정이", messeage: "감사합니다.", location: "오전동", time: "1주 전", productImage: "아이폰.jpeg"),
        ChattingList(nickName: "음음", messeage: "감사합니다.", location: "오전동", time: "1주 전", productImage: "아이패드.jpeg"),
        ChattingList(nickName: "철수", messeage: "감사합니다.", location: "오전동", time: "1일 전", productImage: "에어팟.jpeg"),
        ChattingList(nickName: "영희", messeage: "구매 가능한가요?", location: "산본2동", time: "3일 전", productImage: "맥북.jpeg"),
        ChattingList(nickName: "룰루", messeage: "상태 어떠한가요?", location: "부림동", time: "4일 전", productImage: "나이키반팔.jpeg"),
        ChattingList(nickName: "랄라", messeage: "좋은 하루 되세요.", location: "오전동", time: "5일 전", productImage: "아디다스반바지.jpeg"),
        ChattingList(nickName: "훈이", messeage: "감사합니다.", location: "오전동", time: "1주 전", productImage: "애플워치.jpeg"),
        ChattingList(nickName: "민이", messeage: "감사합니다.", location: "오전동", time: "1주 전", productImage: "해피해킹.jpeg"),
        ChattingList(nickName: "정이", messeage: "감사합니다.", location: "오전동", time: "1주 전", productImage: "아이폰.jpeg"),
        ChattingList(nickName: "음음", messeage: "감사합니다.", location: "오전동", time: "1주 전", productImage: "아이패드.jpeg"),
    
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView?.rowHeight = UITableView.automaticDimension
        self.tableView?.estimatedRowHeight = UITableView.automaticDimension
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

    extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return chattingModel.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChattingCell") as? ChattingCell else {
                return UITableViewCell()
            }
            
            cell.locationLabel.text = chattingModel[indexPath.row].location
            cell.timeLabel.text = chattingModel[indexPath.row].time
            cell.messeageLabel.text = chattingModel[indexPath.row].messeage
            cell.nickNameLabel.text = chattingModel[indexPath.row].nickName
            
            cell.productImage.image = UIImage(named: chattingModel[indexPath.row].productImage)
            
            
            cell.selectionStyle = .none

            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
               if indexPath.section == 0 {
                   return 80
               }
              
               return UITableView.automaticDimension
           }

 
        
    }
