//
//  UIDevice+Hardware.swift
//  SwiftyDevice
//
//  Created by Paul Fechner on 9/14/16.
//  Copyright © 2016 PeeJWeeJ. All rights reserved.
//

import UIKit
import SystemConfiguration





extension UIDevice {

	static var deviceLine: DeviceLine {
		return DeviceLine.make(from: machineInfoName)
	}

	static var isPhoneIdiom: Bool {
		return current.userInterfaceIdiom == .phone
	}

	static var isRetina: Bool {
		return UIScreen.main.scale == 2.0
	}
	static var isIPod: Bool {
		return DeviceLine.make(from: machineInfoName).matchesEnumValue(otherEnum: .iPod(.unknown))
	}

	static var machineInfoName: String {
		return hardwareString()
	}

	static var cpuFrequency: Int {
		return systemInfo(for: HW_CPU_FREQ)
	}

	static var busFrequency: Int {
		return systemInfo(for: HW_BUS_FREQ)
	}

	static var totalMemory: Int {
		return systemInfo(for: HW_MEMSIZE)
	}

	static var userMemory: Int {
		return systemInfo(for: HW_USERMEM)
	}

	static var maxSocketBufferSize: Int {
		return systemInfo(for: KIPC_MAXSOCKBUF)
	}

	static var totalDiskSpace: Float? {
		guard let attributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()) else {
			return nil
		}
		return attributes[FileAttributeKey.systemSize] as? Float
	}

	static var freeDiskSpace: Float? {
		guard let attributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()) else {
			return nil
		}
		return attributes[FileAttributeKey.systemFreeSize] as? Float
	}

	static func hardwareString() -> String {
		var name: [Int32] = [CTL_HW, HW_MACHINE]
		var size: Int = 2
		sysctl(&name, 2, nil, &size, &name, 0)
		var hw_machine = [CChar](repeating: 0, count: Int(size))
		sysctl(&name, 2, &hw_machine, &size, &name, 0)

		let hardware: String = String(validatingUTF8: hw_machine)!
		return hardware
	}

	static func systemInfo(for key: Int32) -> Int {
		var name: [Int32] = [CTL_HW, key]
		var size: Int = 2
		sysctl(&name, 2, nil, &size, &name, 0)
		var value = [Int](repeating: 0, count: Int(size))
		sysctl(&name, 2, &value, &size, &name, 0)

		return value[0]
	}
}



