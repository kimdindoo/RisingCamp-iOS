//
//  NeighborhoodLifeViewController.swift
//  RisingCamp 3week
//
//  Created by 김진수 on 2022/06/26.
//

import UIKit

class NeighborhoodLifeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var lifeModel = [
        LifeList(category: "동네질문", context: "Q. 근처에 교통사고 한의원 좋은데 있나요? 통원치료 할건데 최대한 빨리 낫고 싶어서 정말 잘하는 곳으로 추천해주시면 감사하겠습니다.", nickName: "룰루", location: "당정동", feel: "궁금해요", repley: "답변하기", time: "32분 전"),
        LifeList(category: "동네질문", context: "Q. 당정역 앞 미림정 아기의자 있을까요?", nickName: "밍밍", location: "당정동", feel: "궁금해요", repley: "답변하기", time: "34분 전"),
        LifeList(category: "같이해요", context: "모집중! 노인복지관 배식봉사 함꼐해요^^", nickName: "봉사자", location: "호계동", feel: "궁금해요", repley: "참여하기", time: "40분 전"),
        LifeList(category: "분실/실종", context: "찾아요! 오늘 근로자복지회관 버스 정류장에서 에어팟 프로를 잃어버렸습니다.", nickName: "빠나나", location: "오전동", feel: "공감하기", repley: "댓글쓰기", time: "1시간 전"),
        LifeList(category: "강아지", context: "의왕에 애견미용샵에서 픽업도 가능하고 저렴하다고 한 곳이 있다고 들었는데 거기가 어디인지 아시는 분 계시면 알려주세요ㅠ", nickName: "율리", location: "오전동", feel: "공감하기", repley: "댓글쓰기", time: "1시간 전"),
        LifeList(category: "취미생활", context: "같이 배드민턴 하실 분 구해요.", nickName: "체대남", location: "호게동", feel: "공감하기", repley: "댓글쓰기", time: "1시간 전"),

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView?.rowHeight = UITableView.automaticDimension
        self.tableView?.estimatedRowHeight = UITableView.automaticDimension
    }
    


}

extension NeighborhoodLifeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lifeModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LifeCell") as? LIfeCell else {
            return UITableViewCell()
        }
    
        cell.contentLabel.text = lifeModel[indexPath.row].category
        cell.contentLabel.text = lifeModel[indexPath.row].context
        cell.nickNameLabel.text = lifeModel[indexPath.row].nickName
        cell.locationLabel.text = lifeModel[indexPath.row].location
        cell.timeLabel.text = lifeModel[indexPath.row].time
        cell.repleLabel.text = lifeModel[indexPath.row].repley
        cell.feelLabel.text = lifeModel[indexPath.row].feel

        
        cell.selectionStyle = .none

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 250
        }

        return UITableView.automaticDimension
    }
    
    
}
