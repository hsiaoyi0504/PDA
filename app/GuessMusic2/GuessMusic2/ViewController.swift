//
//  ViewController.swift
//  GuessMusic2
//
//  Created by 陳和均 on 2015/6/14.
//  Copyright (c) 2015年 HC Chen. All rights reserved.
//

import UIKit

struct Info {
    static let Name = "Name"
    static let Icon = "Icon"
    static let Level = "Level"
    static let Exp = "Exp"
    static let Win = "Win"
    static let Lose = "Lose"
    static let Money = "Money"
    static let Power = "Power"
    static let Tool1 = "Tool1"
    static let Tool2 = "Tool2"
    static let Tool3 = "Tool3"
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadUserInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadUserInfo() {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let name = defaults.stringForKey(Info.Name) {
        } else { // First time user
            defaults.setObject("藏鏡人", forKey: Info.Name)
            defaults.setInteger(2, forKey: Info.Icon)
            defaults.setInteger(1, forKey: Info.Level)
            defaults.setInteger(0, forKey: Info.Win)
            defaults.setInteger(0, forKey: Info.Lose)
            defaults.setInteger(3000, forKey: Info.Money)
            defaults.setInteger(50, forKey: Info.Power)
            defaults.setInteger(1, forKey: Info.Tool1)
            defaults.setInteger(1, forKey: Info.Tool2)
            defaults.setInteger(1, forKey: Info.Tool3)
        }
    }


}

