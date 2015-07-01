//
//  Connection.swift
//  testTCP
//
//  Created by H.C.CHEN on 6/10/15.
//  Copyright (c) 2015 HC Chen. All rights reserved.
//

import Foundation

class Connection: NSObject, NSStreamDelegate {
    var host:String?
    var port:Int?
    var inputStream: NSInputStream?
    var outputStream: NSOutputStream?
    var myBuffer = ""
    var gameManager: GameManager?
    var failToConnect = false
    
    func setGM(gm: GameManager) {
        gameManager = gm
    }
    
    func connect(host: String, port: Int) -> Bool {
        
        self.host = host
        self.port = port
        
        NSStream.getStreamsToHostWithName(host, port: port, inputStream: &inputStream, outputStream: &outputStream)
        
        if inputStream != nil && outputStream != nil {
            
            // Set delegate
            inputStream!.delegate = self
            outputStream!.delegate = self
            
            // Schedule
            inputStream!.scheduleInRunLoop(.mainRunLoop(), forMode: NSDefaultRunLoopMode)
            outputStream!.scheduleInRunLoop(.mainRunLoop(), forMode: NSDefaultRunLoopMode)
            
            println("Start open()")
            
            // Open
            inputStream!.open()
            outputStream!.open()
            
            return true
        } else {
            return false
        }
    }
    
    func stream(aStream: NSStream, handleEvent eventCode: NSStreamEvent) {
        if aStream == inputStream {
            switch eventCode {
            case NSStreamEvent.ErrorOccurred:
                println("input: ErrorOccurred: \(aStream.streamError?.description)")
                if !failToConnect {
                    gameManager!.connectionFail()
                    failToConnect = true
                }
            case NSStreamEvent.OpenCompleted:
                println("input: OpenCompleted")
            case NSStreamEvent.HasBytesAvailable:
                //println("input: HasBytesAvailable")
                // Here you can `read()` from `inputStream`
                let bufferSize = 1024
                var buffer = Array<UInt8>(count: bufferSize, repeatedValue: 0)
                
                let bytesRead = inputStream!.read(&buffer, maxLength: bufferSize)
                if bytesRead >= 0 {
                    var output = NSString(bytes: &buffer, length: bytesRead, encoding: NSUTF8StringEncoding)
                    if let msg = output {
                        myBuffer += msg as String
                        updateBuffer()
                    }
                } else {
                    // Handle error
                }
            default:
                break
            }
        }
        else if aStream == outputStream {
            switch eventCode {
            case NSStreamEvent.ErrorOccurred:
                println("output: ErrorOccurred: \(aStream.streamError?.description)")
                if !failToConnect {
                    gameManager!.connectionFail()
                    failToConnect = true
                }
            case NSStreamEvent.OpenCompleted:
                println("output: OpenCompleted")
            case NSStreamEvent.HasSpaceAvailable:
                println("output: HasSpaceAvailable")
                // Here you can write() to `outputStream`
                break
            default:
                break
            }
        }
    }
    
    func updateBuffer() {
        let bufferArr = Array(myBuffer)
        //println(myBuffer)
        if let range = myBuffer.rangeOfString("\n") {
            let leftIndex = distance(myBuffer.startIndex, range.startIndex) - 1
            let endIndex = count(myBuffer) - 1
            var target = ""
            if leftIndex == (endIndex - 1) {
                let targetArr = bufferArr[0...leftIndex]
                target = String(targetArr)
                myBuffer = ""
            } else {
                let rightIndex = distance(myBuffer.startIndex, range.endIndex)
                let targetArr = bufferArr[0...leftIndex]
                target = String(targetArr)
                let remainArr = bufferArr[rightIndex...endIndex]
                let remain = String(remainArr)
                myBuffer = remain
            }
            println("Get msg:->\(target)<-")
            gameManager?.getMessage(target)
        }
        if count(myBuffer) > 1 {
            updateBuffer()
        }
    }
    
    func sendString(message: String) -> Bool {
        let msg = message + "\n"
        if let oStream = outputStream {
            if oStream.hasSpaceAvailable {
                if let data: NSData = msg.dataUsingEncoding(NSUTF8StringEncoding) {
                    println("Send:->\(message)<-")
                    outputStream!.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length)
                    return true
                }
            }
        }
        return false
    }
}