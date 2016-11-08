//
//  ViewController.swift
//  SwiftyDevice
//
//  Created by Paul Fechner on 9/14/16.
//  Copyright © 2016 PeeJWeeJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var firstLabel: UILabel!
	@IBOutlet weak var secondLabel: UILabel!
	@IBOutlet weak var thirdLabel: UILabel!
	@IBOutlet weak var fourthLabel: UILabel!
	@IBOutlet weak var fifthLabel: UILabel!
	@IBOutlet weak var sixthLabel: UILabel!
	@IBOutlet weak var seventhLabel: UILabel!
	@IBOutlet weak var eighthLabel: UILabel!
	@IBOutlet weak var ninthLabel: UILabel!

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		let deviceLine = UIDevice.deviceLine
		firstLabel.text = "Line: \(deviceLine.lineName)"
		secondLabel.text = "Device: \(deviceLine.deviceName)"
//		thirdLabel.text = "CPU Frequency: \(UIDevice.cpuFrequency)"
		fourthLabel.text = "Bus Frequency: \(UIDevice.busFrequency)"
		fifthLabel.text = "Total Memory: \(UIDevice.totalMemory)"
//		sixthLabel.text = "User Memory: \(UIDevice.userMemory)"
		seventhLabel.text = "Max Socket Buffer Size: \(UIDevice.maxSocketBufferSize)"
		eighthLabel.text = "Total Disk Space: \(Int((UIDevice.totalDiskSpace!) / 1000000))MB"
		ninthLabel.text = "Free Disk Space: \(Int((UIDevice.freeDiskSpace!) / 1000000))MB)"
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}
