//
//  AsyncDelegatesImplementation.swift
//  Chat
//
//  Created by Mahyar Zhiani on 7/23/1397 AP.
//  Copyright © 1397 Mahyar Zhiani. All rights reserved.
//

import Foundation
import SwiftyJSON

import PodAsync


extension Chat: AsyncDelegates {
    
    public func asyncConnect(newPeerID: Int) {
//        log.verbose("Async Connected", context: "Chat: DelegateComesFromAsync")
        
        peerId = newPeerID
        delegate?.chatConnected()
    }
    
    public func asyncDisconnect() {
//        log.verbose("Async Disconnected", context: "Chat: DelegateComesFromAsync")
        
        oldPeerId = peerId
        peerId = nil
        delegate?.chatDisconnect()
    }
    
    public func asyncReconnect(newPeerID: Int) {
//        log.verbose("Async Reconnected", context: "Chat: DelegateComesFromAsync")
        
        peerId = newPeerID
        delegate?.chatReconnect()
    }
    
    public func asyncStateChanged(socketState: Int, timeUntilReconnect: Int, deviceRegister: Bool, serverRegister: Bool, peerId: Int) {
        let logMsg: String = "Chat state changed: \n|| socketState = \(socketState) \n|| timeUntilReconnect = \(timeUntilReconnect) \n|| deviceRegister = \(deviceRegister) \n|| serverRegister = \(serverRegister)"
        print("logMsg:\n\(logMsg)")
//        log.verbose(logMsg, context: "Chat: DelegateComesFromAsync")
        
        
        chatFullStateObject = ["socketState": socketState,
                               "timeUntilReconnect": timeUntilReconnect,
                               "deviceRegister": deviceRegister,
                               "serverRegister": serverRegister,
                               "peerId": peerId]
        switch (socketState) {
        case 0: // CONNECTING
            break
        case 1: // CONNECTED
            chatState = true
            ping()
            break
        case 2: // CLOSING
            break
        case 3: // CLOSED
            chatState = false
            break
        default:
            break
        }
        delegate?.chatState(state: socketState)
    }
    
    public func asyncError(errorCode: Int, errorMessage: String, errorEvent: Any?) {
//        log.verbose("Error comes from Async", context: "Chat: DelegateComesFromAsync")
        
        delegate?.chatError(errorCode: errorCode, errorMessage: errorMessage, errorResult: errorEvent)
    }
    
    public func asyncReady() {
//        log.verbose("Async Ready", context: "Chat: DelegateComesFromAsync")
        
        handleAsyncReady()
    }
    
    public func asyncSendMessage(params: Any) {
        // this message is sends through Async
    }
    
    public func asyncReceiveMessage(params: JSON) {
        handleReceiveMessageFromAsync(params: params)
    }
    
    
    
    
    
    func handleAsyncReady() {
//        log.verbose("HandleAsyncReady", context: "Chat")
        
        peerId = asyncClient?.asyncGetPeerId()
        if userInfo == nil {
            if (getUserInfoRetryCount < getUserInfoRetry) {
                getUserInfoRetryCount += 1
                
                getUserInfo(uniqueId: { _ in }, completion: { (result) in
                    
                    let resultModel: UserInfoModel = result as! UserInfoModel
                    let resultJSON: JSON = resultModel.returnDataAsJSON()
                    
//                    log.verbose("get info result comes, and save userInfo: \n \(resultJSON)", context: "Chat")
                    
                    if resultJSON["hasError"].boolValue == false {
                        self.userInfo = User(messageContent: resultJSON["result"]["user"])
                        self.chatState = true
                        self.delegate?.chatReady(withUserInfo: self.userInfo!)
                    }
                }) { _ in }
                
            }
        } else {
            chatState = true
            delegate?.chatReady(withUserInfo: userInfo!)
        }
    }
    
    
    func handleReceiveMessageFromAsync(params: JSON) {
        // checkout to keep async alive
        self.lastReceivedMessageTimeoutId?.suspend()
        DispatchQueue.global().async {
            self.lastReceivedMessageTime = Date()
            let myTimeInterval = Double(self.chatPingMessageInterval) * 1.5
            self.lastReceivedMessageTimeoutId = RepeatingTimer(timeInterval: myTimeInterval)
            self.lastReceivedMessageTimeoutId?.eventHandler = {
                if let lastReceivedMessageTimeBanged = self.lastReceivedMessageTime {
                    let elapsed = Date().timeIntervalSince(lastReceivedMessageTimeBanged)
                    let elapsedInt = Int(elapsed)
                    if (elapsedInt >= self.connectionCheckTimeout) {
                        DispatchQueue.main.async {
                            self.asyncClient?.asyncReconnectSocket()
                        }
                        self.lastReceivedMessageTimeoutId?.suspend()
                    }
                }
            }
            self.lastReceivedMessageTimeoutId?.resume()
        }
        
        pushMessageHandler(params: params)
    }
    
    
}
