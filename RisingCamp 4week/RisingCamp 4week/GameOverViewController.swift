//
//  GameOverViewController.swift
//  RisingCamp 4week
//
//  Created by 김진수 on 2022/07/04.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var wizardDeath: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    var score: Int = 0
    
    var wizardDeathArray = [UIImage(named:"wizardDeath1")!,
                            UIImage(named:"wizardDeath2")!,
                            UIImage(named:"wizardDeath3")!,
                            UIImage(named:"wizardDeath4")!,
                            UIImage(named:"wizardDeath5")!,
                            UIImage(named:"wizardDeath6")!,
                            UIImage(named:"wizardDeath7")!,]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = String(score)

        self.wizardDeath.animationImages = wizardDeathArray
        self.wizardDeath.animationDuration = 2
        self.wizardDeath.animationRepeatCount = 0
        self.wizardDeath.startAnimating()
    }
    
    @IBAction func reGame(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
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
