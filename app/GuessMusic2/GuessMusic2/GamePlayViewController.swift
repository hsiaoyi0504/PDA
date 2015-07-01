//
//  GamePlayViewController.swift
//  GuessMusic2
//
//  Created by H.C.CHEN on 6/14/15.
//  Copyright (c) 2015 HC Chen. All rights reserved.
//

import UIKit
import AudioToolbox

class GamePlayViewController: UIViewController {

    @IBOutlet weak var counter_label: UILabel!
    @IBOutlet weak var question_label: UILabel!
    @IBOutlet weak var round_label: UILabel!
    @IBOutlet weak var myScore_label: UILabel!
    @IBOutlet weak var opScore_label: UILabel!
    @IBOutlet weak var myName_label: UILabel!
    @IBOutlet weak var opName_label: UILabel!
    @IBOutlet weak var myIcon: UIImageView!
    @IBOutlet weak var opIcon: UIImageView!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var mButton1: UIButton!
    @IBOutlet weak var mButton2: UIButton!
    @IBOutlet weak var mButton3: UIButton!
    
    @IBOutlet weak var leaveButton: UIButton!
    
    var gm = GameManager()
    var counter = 0.0
    var preCounter = 0
    var round = 0
    var timer = NSTimer()
    var scoreTimer1 = NSTimer()
    var scoreTimer2 = NSTimer()
    var addAmount1 = 0
    var addAmount2 = 0
    var buttons = [UIButton]()
    var magicButtons = [UIButton]()
    var gameMode = -1
    // Game results
    var myScore = 0
    var opScore = 0
    var moneyGained = 0
    var expGained = 0
    var powerGained = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Choice buttons
        buttons.append(button1)
        buttons.append(button2)
        buttons.append(button3)
        buttons.append(button4)
        configureChoiceButton("hide")
        // Magic buttons
        magicButtons.append(mButton1)
        magicButtons.append(mButton2)
        magicButtons.append(mButton3)
        configureMagicButton("hide")
        // Initial labels and icons
        counter_label.text = ""
        round_label.text = ""
        question_label.text = ""
        myScore_label.text = ""
        opScore_label.text = ""
        myName_label.text = ""
        opName_label.text = ""
        myIcon.hidden = true
        opIcon.hidden = true
        // Game  manager
        gm.setVC(self)
        gm.setGameMode(gameMode)
        gm.initiate()
        //prepareToStart(1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func closeView() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func goBack(sender: UIButton) {
        gm.offLine()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setInfoLabel() {
        myName_label.text = gm.userName
        opName_label.text = gm.opName
        myIcon.image = UIImage(named: "\(gm.userIcon)")
        opIcon.image = UIImage(named: "\(gm.opIcon)")
        myIcon.hidden = false
        opIcon.hidden = false
        leaveButton.setTitle("", forState: .Normal)
        leaveButton.enabled = false
    }
    
    func prepareToStart(thisRound: Int) {
        preCounter = 3
        counter_label.text = String(preCounter)
        round = thisRound
        round_label.text = "第\(round)回合即將開始，請準備："
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "preTimerFire", userInfo: nil, repeats: true)
    }
    
    func preTimerFire() {
        preCounter -= 1
        counter_label.text = String(preCounter)
        if preCounter == 0 {
            timer.invalidate()
            startCountingDown()
        }
    }
    
    func startCountingDown() {
        gm.startPlayingMusic()
        round_label.text = "第\(round)回合"
        counter = 15
        counter_label.text = String(format:"%.1f", counter)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: "timerFire", userInfo: nil, repeats: true)
    }
    
    func timerFire() {
        counter -= 0.25
        counter_label.text = String(format:"%.1f", counter)
        if counter <= 0 {
            timer.invalidate()
            configureChoiceButton("freeze")
            configureMagicButton("hide")
            gm.haveAnswered(-1, time: 0)
        }
    }
    
    func setScoreLabels(userScore: Int, opScore: Int) {
        myScore_label.text = String(userScore)
        opScore_label.text = String(opScore)
    }
    
    func scoreLabelsAnimation(add: Int, target: String) {
        if target == "user" {
            addAmount1 = add
            scoreTimer1 = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("scoreTimerFire1:"), userInfo: target, repeats: true)
        } else if target == "op" {
            addAmount2 = add
            scoreTimer2 = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("scoreTimerFire2:"), userInfo: target, repeats: true)
        }
    }
    
    func scoreTimerFire1(timer: NSTimer) {
        if addAmount1 == 0 {
            scoreTimer1.invalidate()
            return
        }
        var origin = myScore_label.text!.toInt()!
        var newScore = origin + 1
        myScore_label.text = String(newScore)
        addAmount1 -= 1
    }
    
    func scoreTimerFire2(timer: NSTimer) {
        if addAmount2 == 0 {
            scoreTimer2.invalidate()
            return
        }
        var origin = opScore_label.text!.toInt()!
        var newScore = origin + 1
        opScore_label.text = String(newScore)
        addAmount2 -= 1
    }

    @IBAction func AnswerButtonPressed(sender: UIButton) {
        timer.invalidate()
        configureChoiceButton("freeze")
        configureMagicButton("hide")
        switch sender.tag {
        case 101: gm.haveAnswered(0, time: counter)
        case 102: gm.haveAnswered(1, time: counter)
        case 103: gm.haveAnswered(2, time: counter)
        case 104: gm.haveAnswered(3, time: counter)
        default:
            break
        }
    }
    
    func setRoundLabel(text: String) {
        round_label.text = text
    }
    
    func setQuestionLabel(question: String) {
        var text = ""
        switch question {
        case "1": text = "請問這首歌的名字是？"
        case "2": text = "請問這首歌的原唱/作曲家是？"
        case "3": text = "請問這首歌是屬於哪張專輯？"
        default: break
        }
        question_label.text = text
    }
    
    func configureChoiceButton(state: String, choices:[String] = [""]) {
        if state == "hide" {
            for i in 0...3 {
                buttons[i].setTitle("", forState: .Normal)
                buttons[i].enabled = false
            }
        } else if state == "enable" {
            for i in 0...3 {
                buttons[i].setTitle(choices[i], forState: .Normal)
                buttons[i].enabled = true
            }
        } else if state == "freeze" {
            for i in 0...3 {
                buttons[i].enabled = false
            }
        } else if state == "recover" {
            for i in 0...3 {
                buttons[i].enabled = true
            }
        }
    }
    
    func configureMagicButton(state: String) {
        if state == "hide" {
            for i in 0...2 {
                magicButtons[i].setTitle("", forState: .Normal)
                magicButtons[i].enabled = false
            }
        } else if state == "enabled" {
            mButton1.setTitle("智慧印記", forState: .Normal)
            mButton2.setTitle("今年不是兩倍嗎?", forState: .Normal)
            mButton3.setTitle("愚者的喜悅", forState: .Normal)
            let defauls = NSUserDefaults.standardUserDefaults()
            let tool1 = defauls.integerForKey(Info.Tool1)
            let tool2 = defauls.integerForKey(Info.Tool2)
            let tool3 = defauls.integerForKey(Info.Tool3)
            if tool1 > 0 {
                mButton1.enabled = true
            }
            if tool2 > 0 {
                mButton2.enabled = true
            }
            if tool3 > 0 {
                mButton3.enabled = true
            }
        } else {
            println("Error in configureMagicButton")
        }
    }
    
    func deleteTwoOption(op1: Int, op2: Int) {
        buttons[op1].enabled = false
        buttons[op2].enabled = false
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    @IBAction func useMagic(sender: UIButton) {
        gm.useMagic(sender.tag)
        sender.enabled = false
    }
    
    func gameOver(myScore: Int, opScore: Int, money: Int, exp: Int, power: Int) {
        self.myScore = myScore
        self.opScore = opScore
        moneyGained = money
        expGained = exp
        powerGained = power
        
        preCounter = 5
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "postTimerFire", userInfo: nil, repeats: true)
    }
    
    func postTimerFire() {
        preCounter -= 1
        if preCounter == 0 {
            timer.invalidate()
            performSegueWithIdentifier("gameResult", sender: self)
        }
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gameResult" {
            let rVC = segue.destinationViewController as! GameResultViewController
            rVC.myScore = self.myScore
            rVC.opScore = self.opScore
            rVC.money = moneyGained
            rVC.exp = expGained
            rVC.power = powerGained
        }
    }


}
