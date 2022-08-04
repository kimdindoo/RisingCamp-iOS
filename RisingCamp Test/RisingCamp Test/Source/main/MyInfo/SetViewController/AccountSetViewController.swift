//
//  AccountSetViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import UIKit

class AccountSetViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var dataManager: AccountSetManager = AccountSetManager()
    var SetManager = AccountSetManager.shared
    var genderCell: GenderCell!
    
    var genderData: String?
    var birthData: String?
    var phoneNumData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        dataManager.getAccountInfo(self)
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        
    }
    
    func didSuccess(_ response: AccountSetResponse) {
        self.genderData = response.result.gender
        self.birthData = response.result.birth
        self.phoneNumData = response.result.phoneNum
        
        tableView.reloadData()
    }

    @IBAction func confirmButtonTapped(_ sender: Any) {
//        tableView.reloadData()
//
//        SetManager.gender = genderCell.genderTextView.text
//        print(SetManager.gender)

//        SetManager.patchAccountInfo()
        
        
    }
    
}



extension AccountSetViewController: UITableViewDelegate, UITableViewDataSource {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
}
    
func numberOfSections(in tableView: UITableView) -> Int {
    return 5
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    
    
    if indexPath.section == 0 {
        guard let genderCell = tableView.dequeueReusableCell(withIdentifier: "GenderCell", for: indexPath) as? GenderCell else { return UITableViewCell() }
        
        genderCell.genderTextView.text = genderData ?? ""
        SetManager.gender = genderCell.genderTextView.text
        print(SetManager.gender)
        
        return genderCell
    } else if indexPath.section == 1 {
 
        guard let dateOfBirthCell = tableView.dequeueReusableCell(withIdentifier: "DateOfBirthCell", for: indexPath) as? DateOfBirthCell else { return UITableViewCell() }
        
        dateOfBirthCell.birthDataTextView.text = birthData ?? ""
//        SetManager.birth = dateOfBirthCell.birthDataTextView.text

        
        return dateOfBirthCell
        
    } else if indexPath.section == 2 {
        
        guard let contactCell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactCell else { return UITableViewCell() }
        
        contactCell.phoneNumDataTextView.text = phoneNumData ?? ""
//        SetManager.phoneNum = contactCell.phoneNumDataTextView.text

        
        return contactCell
        
    } else if indexPath.section == 3 {
        
        guard let SNSCell = tableView.dequeueReusableCell(withIdentifier: "SNSCell", for: indexPath) as? SNSCell else { return UITableViewCell() }
        
        
        return SNSCell
        
    } else if indexPath.section == 4 {
        
        guard let toLeaveCell = tableView.dequeueReusableCell(withIdentifier: "ToLeaveCell", for: indexPath) as? ToLeaveCell else { return UITableViewCell() }
        
        
        return toLeaveCell
        
    }
    
    else {
        return UITableViewCell()
    }
    
    
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }



}
