//
//  MagicPacketSender.swift
//  WakeMeUp
//
//  Created by Ferit Bölezek on 2017-11-17.
//  Copyright © 2017 Ferit Bölezek. All rights reserved.
//

import Foundation
import SwiftSocket

private let PORT = 9;
private let seperators: CharacterSet = [":","-"];

class MagicPacketSender {
    
    func wakeMeUp(broadcastAddress: String, macAddress: String) {
        
        if broadcastAddress.isEmpty || macAddress.isEmpty {
            return
        }
        
        if let macBytes = getMacBytes(macStr: macAddress) {
            var bytes = [UInt8]()
            
            for _ in 0...5 {
                bytes.append(0xff)
            }
            // 102 is the size of the total packet size 6*16+6 = 102 bytes
            for i in 6..<102 {
                bytes[i...].append(contentsOf: macBytes[0...macBytes.count - 1])
            }
            
            let client = UDPClient(address: broadcastAddress, port: 9)
            client.enableBroadcast()
            var data = Data()
            data.append(contentsOf: bytes)
            
            switch client.send(data: data) {
            case .success:
                print("Great success! Your packet was sent!")
                
            case .failure(let error):
                print("Sending packet failed with error: \(error.localizedDescription)")
                
            }
        }
        
        
    }
    
    private func getMacBytes(macStr: String) -> [UInt8]? {
        var bytes: [UInt8] = Array()
        let hex:Array<String> = macStr.components(separatedBy: seperators)
        
        if hex.count != 6 { return nil }
        
        for component in hex {
            if let hexValue = UInt8(String(component.characters), radix: 16) {
                bytes.append(hexValue)
            }
        }
        return bytes
        
    }
    
}
