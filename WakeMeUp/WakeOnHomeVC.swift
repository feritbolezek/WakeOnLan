//
//  WakeOnHomeVC.swift
//  WakeMeUp
//
//  Created by Ferit Bölezek on 2017-11-17.
//  Copyright © 2017 Ferit Bölezek. All rights reserved.
//

import UIKit
import CoreLocation

// Optional class/VC made for fun. The magic happens in the main ViewController and "MagicPacketSender" class.

class WakeOnHomeVC: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var broadcastAddressTxtField: UITextField!
    
    @IBOutlet weak var macAddressTxtField: UITextField!
    
    @IBOutlet weak var beaconUUIDTxtField: UITextField!
    
    let locationManager = CLLocationManager()
    
    var magicPacketSent = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
    }
    
    @IBAction func startListeningTapped(_ sender: Any) {
        locationManager.requestAlwaysAuthorization()
        if let beaconUUID = beaconUUIDTxtField.text {
            let beaconRegion = CLBeaconRegion(proximityUUID: UUID(uuidString: beaconUUID)!, identifier: "WakeOnHomeBeacon")
            locationManager.startMonitoring(for: beaconRegion)
            locationManager.startRangingBeacons(in: beaconRegion)
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if !magicPacketSent {
            if let broadcastAddress = broadcastAddressTxtField.text, let macAddress = macAddressTxtField.text {
                let magicPacket = MagicPacketSender()
                magicPacket.wakeMeUp(broadcastAddress: broadcastAddress, macAddress: macAddress)
                magicPacketSent = true
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        
    }
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {

    }
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        print("error")
    }
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if !magicPacketSent {
            if let broadcastAddress = broadcastAddressTxtField.text, let macAddress = macAddressTxtField.text {
                let magicPacket = MagicPacketSender()
                magicPacket.wakeMeUp(broadcastAddress: broadcastAddress, macAddress: macAddress)
                magicPacketSent = true
            }
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}
