//
//  GameManager.swift
//  GuessMusic2
//
//  Created by H.C.CHEN on 6/14/15.
//  Copyright (c) 2015 HC Chen. All rights reserved.
//

import Foundation
import AVFoundation

struct State {
    static let Uninitial = "uninitial"
    static let Request = "request"
    static let Host = "host"
    static let Client = "client"
    static let GameOnHost = "gameOnHost"
    static let GameOnClient = "gameOnClient"
    static let ReadyForNext = "readyForNext"
}

class GameManager {
    
    var conn: Connection?
    var vc: GamePlayViewController?
    var player = AVPlayer()
    var state = State.Uninitial
    var questions = [String]()
    var choices = [String]()
    var ids = [String]()
    var answers = [Int]()
    var scores = [Int]()
    var opScores = [Int]()
    var round = 0
    var meReady = false
    var opReady = false
    var opOver = false
    var gameMode = -1
    // Client
    var cId1 = 0
    var cId2 = 0
    var cId3 = 0
    // Opponent's information
    var opName = ""
    var opLevel = -1
    var opIcon = -1
    // User's information
    var userName = ""
    var userLevel = -1
    var userIcon = -1
    // Magic tool
    var multiplier = 1
    var adder = 0
    
    func setVC(viewController: GamePlayViewController) {
        vc = viewController
    }
    
    func setGameMode(mode: Int) {
        gameMode = mode
        println("Game Mode: \(gameMode)")
    }
    
    func initiate() {
        // Use information
        let defaults = NSUserDefaults.standardUserDefaults()
        userName = defaults.stringForKey(Info.Name)!
        userIcon = defaults.integerForKey(Info.Icon)
        // Start connection
        conn = Connection()
        conn!.setGM(self)
        conn!.connect("140.112.41.137", port: 6789)
        while true {
            if conn!.sendString("request;\(userName);\(userIcon);\(gameMode)") {
                break
            }
        }
        state = State.Request
        vc!.setRoundLabel("配對中，請稍候")
    }
    
    func connectionFail() {
        println("Fail to connect to server.")
        vc?.closeView()
    }
    
    func getUserInfo() {
        let defaults = NSUserDefaults.standardUserDefaults()
        userName = defaults.stringForKey(Info.Name)!
        userLevel = defaults.integerForKey(Info.Level)
    }
    
    func getMessage(msg: String) {
        var tokens = split(msg) { $0 == ";"}
        switch state {
        case State.Request:
            if tokens[0] == "confirm" {
                opName = tokens[2]
                opIcon = tokens[3].toInt()!
                if tokens[1] == "host" {
                    println("Pair with \(opName), become Host")
                    state = State.Host
                    getQuestion()
                } else {
                    println("Pair with \(opName), become client")
                    state = State.Client
                }
                vc!.setScoreLabels(0, opScore: 0)
                vc!.setInfoLabel()
            } else if tokens[0] == "wait" {
                println("No opponents now, waiting...")
            } else { println("Error in state request")}
        case State.Host:
            if tokens[0] == "ready" {
                round++
                conn!.sendString("start;1")
                state = State.GameOnHost
                startRound()
            }
        case State.Client:
            if tokens[0] == "getquestions" {
                getQuestion()
            } else if tokens[0] == "ids" {
                cId1 = tokens[1].toInt()!
                cId2 = tokens[2].toInt()!
                cId3 = tokens[3].toInt()!
            } else if tokens[0] == "start" {
                round++
                state = State.GameOnClient
                startRound()
            } else { println("Error in state client")}
        case State.GameOnHost:
            if tokens[0] == "round" {
                let opScore = tokens[1].toInt()!
                opScores.append(opScore)
                opReady = true
                vc!.scoreLabelsAnimation(opScore, target: "op")
                if meReady {
                    if round == 3 {
                        conn!.sendString("over")
                        gameOver()
                    } else {
                        round++
                        conn!.sendString("start;\(round)")
                        startRound()
                    }
                } else {
                    if round == 3 {
                        opOver = true
                    } else {
                        opReady = true
                    }
                }
            }
        case State.GameOnClient:
            if tokens[0] == "round" {
                let opScore = tokens[1].toInt()!
                opScores.append(opScore)
                opReady = true
                vc!.scoreLabelsAnimation(opScore, target: "op")
                if round == 3 {
                    opOver = true
                }
            } else if tokens[0] == "start" {
                round++
                startRound()
            } else if tokens[0] == "over" {
                gameOver()
            }
        default: break
        }
    }
    
    func getQuestion() {
        // For test
        questions = ["這是問題1", "這是問題2", "這是問題3"]
        choices = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
        answers = [1, 2, 3]
        ids = ["https://p.scdn.co/mp3-preview/c470b347c0173185126188e77050de5436e91354","https://p.scdn.co/mp3-preview/c470b347c0173185126188e77050de5436e91354","https://p.scdn.co/mp3-preview/c470b347c0173185126188e77050de5436e91354"]
        // Do the HTTP request
        var type = ""
        switch gameMode {
        case 0: type = "3"//"chinese_fashion"
        case 1: type = "4"//"chinses_oldies"
        case 2: type = "1"//"english_fashion"
        case 3: type = "2"//"english_oldies"
        case 4: type = "5"//"classical"
        default: break
        }
        var id1 = Int(arc4random_uniform(12)) + 1
        var id2 = Int(arc4random_uniform(12)) + 1
        while id2 == id1 {
            id2 = Int(arc4random_uniform(12)) + 1
        }
        var id3 = Int(arc4random_uniform(12)) + 1
        while id3 == id2 || id3 == id1 {
            id3 = Int(arc4random_uniform(12)) + 1
        }
        if state == State.Host {
            conn!.sendString("ids;\(id1);\(id2);\(id3)")
        } else if state == State.Client {
            id1 = cId1
            id2 = cId2
            id3 = cId3
        }
        println("id1:\(id1), id2:\(id2), id3:\(id3)")
        let URL = "http://140.112.18.201/action.php?action=get3&questionID1=\(id1)&questionID2=\(id2)&questionID3=\(id3)&songType=\(type)"
        var sequence:Int = 0
        var questionID: [String] = ["","",""]
        var preview_url:[String] = ["","",""]
        var question:[String] = ["","",""]
        var choice0:[String] = ["","",""]
        var choice1:[String] = ["","",""]
        var choice2:[String] = ["","",""]
        var choice3:[String] = ["","",""]
        var correctChoice:[String] = ["","",""]
        
        let request = NSURLRequest(URL: NSURL(string: URL)!)
        let urlSession = NSURLSession.sharedSession()
        let task = urlSession.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                println(error.localizedDescription)
            }
            var error:NSError?
            let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as? NSDictionary
            
            // Return nil if there is any error
            if error != nil {
                println(error?.localizedDescription)
            }
            
            // Parse JSON data
            let jsonObjs = jsonResult?["questions"] as! [AnyObject]
            for jsonObj in jsonObjs {
                questionID[sequence] = jsonObj["questionID"] as! String
                preview_url[sequence] = jsonObj["preview_url"] as! String
                question[sequence] = jsonObj["questionDescription"] as! String
                choice0[sequence] = jsonObj["choice0"] as! String
                choice1[sequence] = jsonObj["choice1"] as! String
                choice2[sequence] = jsonObj["choice2"] as! String
                choice3[sequence] = jsonObj["choice3"] as! String
                correctChoice[sequence] = jsonObj["correctChoice"] as! String
                
                sequence += 1
            }
            
            self.questions = [question[0], question[1], question[2]]
            self.answers = [correctChoice[0].toInt()!, correctChoice[1].toInt()!, correctChoice[2].toInt()!]
            self.choices = [choice0[0], choice1[0], choice2[0], choice3[0], choice0[1], choice1[1], choice2[1], choice3[1], choice0[2], choice1[2], choice2[2], choice3[2] ]
            self.ids = [preview_url[0], preview_url[1], preview_url[2]]
            println("Get questions:\(self.questions)")
            println("Get answers:\(self.answers)")
            println("Get choices:\(self.choices)")
            if self.state == State.Client {
                self.conn!.sendString("ready")
            } else if self.state == State.Host {
                self.conn!.sendString("getquestions")
            }
        })
        task.resume()
    }
    
    func startRound() {
        meReady = false
        opReady = false
        startLoadingMusic()
        vc!.prepareToStart(round)
    }
    
    func startLoadingMusic() {
        //let url = "https://p.scdn.co/mp3-preview/" + ids[round-1]
        let url = ids[round-1]
        let playerItem = AVPlayerItem( URL:NSURL( string:url ) )
        player = AVPlayer(playerItem:playerItem)
        player.rate = 1.0
    }
    
    func startPlayingMusic() {
        player.play()
        println("Start Playing..")
        var choices_arr = [String]()
        let index = (round - 1)*4
        for i in 0...3 {
            choices_arr.append(choices[index+i])
        }
        let question = questions[round-1]
        vc!.setQuestionLabel(question)
        vc!.configureChoiceButton("enable", choices: choices_arr)
        vc!.configureMagicButton("enabled")
    }
    
    func haveAnswered(choice: Int, time: Double) {
        println("haveAnswered")
        player.pause()
        var score = 0
        var bonus = Int(15 - time)
        if choice == answers[round-1] {
            score = multiplier * (200 + 500/bonus)
        } else {
            score = adder
        }
        multiplier = 1
        adder = 0
        scores.append(score)
        vc!.scoreLabelsAnimation(score, target: "user")
        conn!.sendString("round;\(scores[round-1])")
        meReady = true
        if state == State.GameOnHost {
            if opOver == true {
                conn!.sendString("over")
                gameOver()
            } else if opReady == true {
                round++
                conn!.sendString("start;\(round)")
                startRound()
            }
        }
    }
    
    func useMagic(tool: Int) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let tool1 = defaults.integerForKey(Info.Tool1)
        let tool2 = defaults.integerForKey(Info.Tool2)
        let tool3 = defaults.integerForKey(Info.Tool3)
        switch tool {
        // Delete 2 options
        case 1:
            defaults.setInteger(tool1 - 1, forKey: Info.Tool1)
            let answer = answers[round-1]
            var op1 = answer
            while op1 == answer {
                op1 = Int(arc4random_uniform(4))
            }
            var op2 = op1
            while op2 == op1 || op2 == answer {
                op2 = Int(arc4random_uniform(4))
            }
            vc!.deleteTwoOption(op1, op2: op2)
        // Score x 2
        case 2:
            defaults.setInteger(tool2 - 1, forKey: Info.Tool2)
            multiplier = 2
        case 3:
            defaults.setInteger(tool3 - 1, forKey: Info.Tool3)
            adder = 200
        default: break
        }
    }
    
    func gameOver() {
        let myTotalScore = scores[0] + scores[1] + scores[2]
        let opTotalScore = opScores[0] + opScores[1] + opScores[2]
        var moneyGained = 0
        let expGained = myTotalScore * 2
        var powerGained = 0
        
        println("You score \(myTotalScore), Op scores \(opTotalScore)")
        if myTotalScore > opTotalScore {
            println("You win!")
            moneyGained = 500 + Int(myTotalScore/4)
            powerGained = 10
            vc!.setQuestionLabel("You Win :)")
        } else {
            println("You lose!")
            moneyGained = Int(myTotalScore/4)
            powerGained = 0
            vc!.setQuestionLabel("You Lose :(")
        }
        conn!.sendString("OVER")
        vc!.gameOver(myTotalScore, opScore: opTotalScore, money: moneyGained, exp: expGained, power: powerGained)
    }
    
    func offLine() {
        conn!.sendString("OVER")
    }
}