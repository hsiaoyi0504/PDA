//
//  ViewController.swift
//  tableviewtest
//
//  Created by nmlab on 2015/6/27.
//  Copyright (c) 2015年 nmlab. All rights reserved.
//

import UIKit

class PlayingModeTableViewController: UITableViewController {
    
    var mode = -1
    
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
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier( "ListItem", forIndexPath: indexPath) as! PlayingModeTableViewCell
    
        if indexPath.row == 0{
            cell.accessoryType = .None
            cell.backgroundImageView.image = UIImage(named: "中文流行")
        } else if indexPath.row == 1{
            cell.backgroundImageView.image = UIImage(named: "中文老歌")
        } else if indexPath.row == 2{
            cell.backgroundImageView.image = UIImage(named: "英文流行")
        } else if indexPath.row == 3{
            cell.backgroundImageView.image = UIImage(named: "英文老歌")
        } else if indexPath.row == 4{
            cell.backgroundImageView.image = UIImage(named: "古典音樂")
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
        
                playingmode(indexPath.row)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
                })
           
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func playingmode(row: Int){
        mode = row
        performSegueWithIdentifier("gameStart", sender: self)
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gameStart" {
            let gVC = segue.destinationViewController as! GamePlayViewController
            gVC.gameMode = mode
        }
    }



}

