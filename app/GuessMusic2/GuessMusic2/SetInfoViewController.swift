//
//  SetInfoViewController.swift
//  GuessMusic2
//
//  Created by 陳和均 on 2015/6/27.
//  Copyright (c) 2015年 HC Chen. All rights reserved.
//

import UIKit

class SetInfoViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var userIcon: UIImageView!
    
    var infoVC: UserInfoViewController?
    var newIcon = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
        let index = defaults.integerForKey(Info.Icon)
        userIcon.image = UIImage(named: "\(index)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    @IBAction func updateInfo(sender: UIButton) {
        let defaults = NSUserDefaults.standardUserDefaults()
        if nameField.text != "" {
            defaults.setObject(nameField.text, forKey: Info.Name)
        }
        if newIcon != -1 {
            defaults.setInteger(newIcon, forKey: Info.Icon)
        }
        infoVC?.updateUserInformation()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func changeIcon(sender: UIButton) {
        let index = sender.tag
        newIcon = index
        userIcon.image = UIImage(named: "\(index)")
    }
    
    @IBAction func backToPreviuspage(sender: UIButton) {
        infoVC?.updateUserInformation()
        dismissViewControllerAnimated(true, completion: nil)
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
