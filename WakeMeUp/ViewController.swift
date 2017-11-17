//
//  ViewController.swift
//  WakeMeUp
//
//  Created by Ferit Bölezek on 2017-11-17.
//  Copyright © 2017 Ferit Bölezek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var broadcastAddress: UITextField!
    @IBOutlet weak var macAddress: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func wakeMeUpTapped(_ sender: Any) {
        if let broadcast = broadcastAddress.text, let mac = macAddress.text {
            let magicPacket = MagicPacketSender()
            magicPacket.wakeMeUp(broadcastAddress: broadcast, macAddress: mac)
        }
    }
}

