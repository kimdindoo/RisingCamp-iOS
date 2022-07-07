//
//  ViewController.swift
//  RisingCamp 4week
//
//  Created by 김진수 on 2022/07/01.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    enum TimerStatus {
        case start
        case pause
        case end
    }
 
    
    @IBOutlet var myView: UIView!
    @IBOutlet weak var wizard: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var stopGameLabel: UIButton!
    @IBOutlet weak var startGameLabel: UIButton!
    
    var score = 0
    
    var timerStatus: TimerStatus = .end
    var timer: DispatchSourceTimer?
    var currentSeconds = 20
    
    var monster : Timer?
    var reapar : Timer?
    
    var audioPlayer: AVAudioPlayer?

    
    
    var wizardIdelArray = [UIImage(named:"wizardIdle1")!,
                           UIImage(named:"wizardIdle2")!,
                           UIImage(named:"wizardIdle3")!,
                           UIImage(named:"wizardIdle4")!,
                           UIImage(named:"wizardIdle5")!,
                           UIImage(named:"wizardIdle6")!,]
    
    var wizardAttackArray = [UIImage(named:"wizardAttack1")!,
                             UIImage(named:"wizardAttack2")!,
                             UIImage(named:"wizardAttack3")!,
                             UIImage(named:"wizardAttack4")!,
                             UIImage(named:"wizardAttack5")!,
                             UIImage(named:"wizardAttack6")!,
                             UIImage(named:"wizardAttack7")!,
                             UIImage(named:"wizardAttack8")!,]
    
    var wizardDeathArray = [UIImage(named:"wizardDeath1")!,
                            UIImage(named:"wizardDeath2")!,
                            UIImage(named:"wizardDeath3")!,
                            UIImage(named:"wizardDeath4")!,
                            UIImage(named:"wizardDeath5")!,
                            UIImage(named:"wizardDeath6")!,
                            UIImage(named:"wizardDeath7")!,]
    
    var wizardDeathArray2 = [UIImage(named:"wizardDeath7")!]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.wizard.animationImages = wizardIdelArray
        self.wizard.animationDuration = 2/3
        self.wizard.animationRepeatCount = 0
        self.wizard.startAnimating()
      
        configureToggleButton()
        

        
//        wizardDie()
        
        
        // 1. create a gesture recognizer (tap gesture)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(handleTap2(sender:)))
        

        // 2. add the gesture recognizer to a view
        myView.addGestureRecognizer(tapGesture)
        wizard.addGestureRecognizer(tapGesture2)
        wizard.isUserInteractionEnabled = true
        
        scoreLabel.text = "\(score)"
        timeLabel.text = "\(currentSeconds)"
        
    }
    
    func configureToggleButton() {
        self.startGameLabel.setTitle("시작", for: .normal)
        self.startGameLabel.setTitle("일시정지", for: .selected)
    }
    
    func startTimer() {
        if self.timer == nil {
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
            self.timer?.schedule(deadline: .now(), repeating: 1)
            self.timer?.setEventHandler(handler: { [weak self] in
                guard let self = self else { return }
                self.currentSeconds -= 1
     
                self.timeLabel.text = "\(self.currentSeconds)"

                if self.currentSeconds <= 0 {
                    self.stopTimer()
                    guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "GameOverViewController") as? GameOverViewController else { return }
                    vc.score = self.score
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
                

            })
            self.timer?.resume()
        }
    }
    
    func stopTimer() {


        if self.timerStatus == .pause {
            self.timer?.resume()
        }
        self.timerStatus = .end
        self.startGameLabel.isSelected = false
        self.timer?.cancel()
        self.timer = nil
    


    }
    
//    @IBAction func stopGame(_ sender: Any) {
//        switch self.timerStatus {
//        case .start, .pause:
////                stopTimer() 함수에다가 옮겨준다
////            self.timerStatus = .end
////            self.cancleButton.isEnabled = false
////            self.setTimerInfoViewVisble(isHidden: true)
////            self.datePicker.isHidden = false
////            self.toggleButton.isSelected = false
//            self.stopTimer()
//
//        default:
//            break
//        }
//    }
    
    func makeMonster()
    {
      if monster == nil {
          monster = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setMonsterImageView), userInfo: nil, repeats: true)
      }
    }

    func stopMonster()
    {
      if monster != nil {
          monster!.invalidate()
          monster = nil
      }
    }
    
    func makeReaper()
    {
      if reapar == nil {
          reapar = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(setReaperImageView), userInfo: nil, repeats: true)
      }
    }

    func stopReaper()
    {
      if reapar != nil {
          reapar!.invalidate()
          reapar = nil
      }
    }

    
    @IBAction func startGame(_ sender: Any) {
        
            switch self.timerStatus {
            case .end:
                self.timerStatus = .start
                self.startGameLabel.isSelected = true
                self.startTimer()
                makeMonster()
                makeReaper()
                
            case .start:
                self.timerStatus = .pause
                self.startGameLabel.isSelected = false
                self.timer?.suspend()
                stopMonster()
                stopReaper()
                
            case .pause:
                self.timerStatus = .start
                self.startGameLabel.isSelected = true
                self.timer?.resume()
                makeMonster()
                makeReaper()

            }
        
        
    
        
    }
    
    @objc private func playMusic() {
            let url = Bundle.main.url(forResource: "filmfight", withExtension: "mp3")
            if let url = url {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.prepareToPlay()
                    audioPlayer?.play()
                } catch {
                    print(error)
                }
            }
        }
    
    

    
    // 3. this method is called when a tap is recognized
    @objc func handleTap(sender: UITapGestureRecognizer) {
        print("tap")

    }
    
    @objc func handleTap2(sender: UITapGestureRecognizer) {
        print("wizard tap")

    }
    
    @objc func monsterHandleTap(sender: UITapGestureRecognizer) {
        print("monster tap")
        
//        var AudioPlayer = AVAudioPlayer()
//          let url = Bundle.main.url(forResource: "filmfight", withExtension: "mp3")!
//
//              do {
//                  try AudioPlayer = AVAudioPlayer(contentsOf: url)
//              } catch {
//                  fatalError()
//
//          }
//
//        AudioPlayer.play()
        
        playMusic()
        
        
        self.wizard.animationImages = self.wizardAttackArray
        self.wizard.animationDuration = 2/3
        self.wizard.animationRepeatCount = 0
        self.wizard.startAnimating()
    
        
        for view in myView.subviews {
            if view is UIImageView && view.tag == 100 {
                view.removeFromSuperview()
            }
        }
        
  
        
        score += 100
        
        DispatchQueue.global().async {
            DispatchQueue.main.sync {
                self.scoreLabel.text = "\(self.score)"
            }
        }
        
        
        

        
    }
    
    @objc func reaperHandleTap(sender: UITapGestureRecognizer) {
        print("reaper tap")
        
        for view in myView.subviews {
            if view is UIImageView && view.tag == 200 {
                view.removeFromSuperview()
            }
        }
        
        score -= 100
        
        DispatchQueue.global().async {
            DispatchQueue.main.sync {
                self.scoreLabel.text = "\(self.score)"
            }
        }
        
        
    }
    

    
//    func wizardDie() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.wizard.animationImages = self.wizardDeathArray
//            self.wizard.animationDuration = 2/3
//            self.wizard.animationRepeatCount = 0
//            self.wizard.startAnimating()
//
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
//            self.wizard.animationImages = self.wizardDeathArray2
//            self.wizard.animationDuration = 2/3
//            self.wizard.animationRepeatCount = 0
//            self.wizard.startAnimating()
//        }
//
//    }
    
    

    
    @objc func setMonsterImageView() {
        let randomValue1 = Int.random(in: 0..<Int(UIScreen.main.bounds.width)-10)
        let randomValue2 = Int.random(in: 0..<Int(UIScreen.main.bounds.height)-10)

        let monsterTapGesture = UITapGestureRecognizer(target: self, action: #selector(monsterHandleTap(sender:)))
//        monster.addGestureRecognizer(monsterTapGesture)
//        monster.isUserInteractionEnabled = true
        
        
        let monsterImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "monster")
            imageView.frame = CGRect(x: randomValue1 ,y: randomValue2, width: 150, height: 150)
            imageView.tag = 100
            
            
            imageView.addGestureRecognizer(monsterTapGesture)
            imageView.isUserInteractionEnabled = true
            return imageView
        }()
        
        
        
        self.view.addSubview(monsterImageView)
        
        
        
    }
    
    
    
    @objc func setReaperImageView() {
        let randomValue1 = Int.random(in: 0..<Int(UIScreen.main.bounds.width)-10)
        let randomValue2 = Int.random(in: 0..<Int(UIScreen.main.bounds.width)-10)
        
        let reaperTapGesture = UITapGestureRecognizer(target: self, action: #selector(reaperHandleTap(sender:)))

        let reaperImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "reaper")
            imageView.frame = CGRect(x: randomValue1 ,y: randomValue2, width: 100, height: 100)
            imageView.tag = 200
            
            imageView.addGestureRecognizer(reaperTapGesture)
            imageView.isUserInteractionEnabled = true
            return imageView
        }()
        
        self.view.addSubview(reaperImageView)
        
    

            
        }
    
    
    
    

    
    
        
    }
