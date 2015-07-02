//
//  ViewController.swift
//  tableviewtest
//
//  Created by nmlab on 2015/6/27.
//  Copyright (c) 2015年 nmlab. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var money = 10000
    var itemNumber:[Int] = [0,0,0]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //tableView.rowHeight = 120
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier( "ListItem", forIndexPath: indexPath) as! TableViewCell
        let defaults = NSUserDefaults.standardUserDefaults()
        var money = defaults.integerForKey(Info.Money)
        var tool1 = defaults.integerForKey(Info.Tool1)
        var tool2 = defaults.integerForKey(Info.Tool2)
        var tool3 = defaults.integerForKey(Info.Tool3)
    
        if indexPath.row == 0{
            cell.accessoryType = .None
            cell.backgroundImageView.image = UIImage(named: "store1")
            cell.itemNameLabel.text = "智慧印記：刪去兩個錯誤選項"
            cell.itemImageView.image = UIImage(named: "delete")
            cell.itemPriceLabel.text = "\(300)"
            cell.itemNumberLabel.text = "X\(tool1)"
            cell.moneyLabel.text = "\(money)"
            
        }else if indexPath.row == 1{
            cell.backgroundImageView.image = UIImage(named: "store2")
            cell.itemNameLabel.text = "今年不是兩倍嗎：本回合獲得分數加倍"
            cell.itemImageView.image = UIImage(named: "double")
            cell.itemPriceLabel.text = "\(500)"
            cell.itemNumberLabel.text = "X\(tool2)"
            cell.moneyLabel.text = "\(money)"

            
        }else if indexPath.row == 2{
            cell.backgroundImageView.image = UIImage(named: "store3")
            cell.itemNameLabel.text = "愚者的喜悅：即使答錯也會有分數"
            cell.itemImageView.image = UIImage(named: "secure")
            cell.itemPriceLabel.text = "\(200)"
            cell.itemNumberLabel.text = "X\(tool3)"
            cell.moneyLabel.text = "\(money)"
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            
                self.itemsold(indexPath.row)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
                })
        
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func itemsold(row: Int){
        let defaults = NSUserDefaults.standardUserDefaults()
        var money = defaults.integerForKey(Info.Money)
        var tool1 = defaults.integerForKey(Info.Tool1)
        var tool2 = defaults.integerForKey(Info.Tool2)
        var tool3 = defaults.integerForKey(Info.Tool3)
        if row == 0 && money >= 300{
            money -= 300
            tool1 += 1
        }else if row == 1 && money >= 500{
            money -= 500
            tool2 += 1
        }else if row == 2 && money >= 200{
            money -= 200
            tool3 += 1
        }
        defaults.setInteger(money, forKey: Info.Money)
        defaults.setInteger(tool1, forKey: Info.Tool1)
        defaults.setInteger(tool2, forKey: Info.Tool2)
        defaults.setInteger(tool3, forKey: Info.Tool3)
    }
        
    


}

