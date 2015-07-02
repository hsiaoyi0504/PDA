//
//  UserInfoViewController.swift
//  GuessMusic2
//
//  Created by 陳和均 on 2015/6/27.
//  Copyright (c) 2015年 HC Chen. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var name_label: UILabel!
    @IBOutlet weak var level_label: UILabel!
    @IBOutlet weak var exp_label: UILabel!
    @IBOutlet weak var winLose_label: UILabel!
    @IBOutlet weak var money_label: UILabel!
    @IBOutlet weak var power_label: UILabel!
    @IBOutlet weak var userIcon: UIImageView!
    var level = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getUserInformation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToHomepage(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func getUserInformation() {
        //update frame
        updateUserLevel()
        // Get information from standard user defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        let name = defaults.stringForKey(Info.Name)
        let icon = defaults.integerForKey(Info.Icon)
        let level = defaults.integerForKey(Info.Level)
        let exp = defaults.integerForKey(Info.Exp)
        let win = defaults.integerForKey(Info.Win)
        let lose = defaults.integerForKey(Info.Lose)
        let money = defaults.integerForKey(Info.Money)
        let power = defaults.integerForKey(Info.Power)
        // Display on screen
        name_label.text = name
        userIcon.image = UIImage(named: "\(icon)")
        level_label.text = String(level)
        exp_label.text = String(exp)
        winLose_label.text = "\(win)勝 \(lose)敗"
        money_label.text = String(money)
        power_label.text = String(power)
    }
    
    func updateUserInformation() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let name = defaults.stringForKey(Info.Name)
        name_label.text = name
        let icon = defaults.integerForKey(Info.Icon)
        userIcon.image = UIImage(named: "\(icon)")
    }
    
    func updateUserLevel() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let exp = defaults.integerForKey(Info.Exp)
        level = 1 + Int(exp/(2000+(exp/10)))
        defaults.setInteger(level, forKey: Info.Level)
        
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "setInfo" {
            let dVC = segue.destinationViewController as! SetInfoViewController
            dVC.infoVC = self
        }
    }


}
