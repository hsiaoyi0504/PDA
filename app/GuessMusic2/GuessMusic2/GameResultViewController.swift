//
//  GameResultViewController.swift
//  GuessMusic2
//
//  Created by 陳和均 on 2015/6/29.
//  Copyright (c) 2015年 HC Chen. All rights reserved.
//

import UIKit

class GameResultViewController: UIViewController {
    
    @IBOutlet weak var myScore_label: UILabel!
    @IBOutlet weak var opScore_label: UILabel!
    @IBOutlet weak var money_label: UILabel!
    @IBOutlet weak var exp_label: UILabel!
    @IBOutlet weak var power_label: UILabel!
    
    var myScore = 0
    var opScore = 0
    var money = 0
    var exp = 0
    var power = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUserInfo()
        presentResult()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentResult() {
        // Show results on screen
        myScore_label.text = "你的得分： \(myScore)"
        opScore_label.text = "對方得分： \(opScore)"
        money_label.text = "獲得金錢： \(money)"
        exp_label.text = "獲得經驗： \(exp)"
        power_label.text = "獲得能量： \(power)"
    }
    
    func updateUserInfo() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let newMoney = defaults.integerForKey(Info.Money) + money
        defaults.setInteger(newMoney, forKey: Info.Money)
        let newExp = defaults.integerForKey(Info.Exp) + exp
        defaults.setInteger(newExp, forKey: Info.Exp)
        let newPower = defaults.integerForKey(Info.Power) + power
        defaults.setInteger(newPower, forKey: Info.Power)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
