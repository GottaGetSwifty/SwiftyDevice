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

	public static var deviceLine: DeviceLine {
		return DeviceLine.make(from: machineInfoName)
	}

	public static var isPhoneIdiom: Bool {
		return current.userInterfaceIdiom == .phone
	}

	public static var isRetina: Bool {
		return UIScreen.main.scale == 2.0
	}
	public static var isIPod: Bool {
		switch deviceLine {
		case .iPod(_):
			return true
		default:
			return false
		}
	}

	public static var machineInfoName: String {
		return hardwareString()
	}

	public static var cpuFrequency: Int {
		return systemInfo(for: HW_CPU_FREQ)
	}

	public static var busFrequency: Int {
		return systemInfo(for: HW_BUS_FREQ)
	}

	public static var totalMemory: Int {
		return systemInfo(for: HW_MEMSIZE)
	}

	public static var userMemory: Int {
		return systemInfo(for: HW_USERMEM)
	}

	public static var maxSocketBufferSize: Int {
		return systemInfo(for: KIPC_MAXSOCKBUF)
	}

	public static var totalDiskSpace: Float? {
		guard let attributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()) else {
			return nil
		}
		return attributes[FileAttributeKey.systemSize] as? Float
	}

	public static var freeDiskSpace: Float? {
		guard let attributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()) else {
			return nil
		}
		return attributes[FileAttributeKey.systemFreeSize] as? Float
	}

	fileprivate static func hardwareString() -> String {
		var name: [Int32] = [CTL_HW, HW_MACHINE]
		var size: Int = 2
		sysctl(&name, 2, nil, &size, &name, 0)
		var hw_machine = [CChar](repeating: 0, count: Int(size))
		sysctl(&name, 2, &hw_machine, &size, &name, 0)

		let hardware: String = String(validatingUTF8: hw_machine)!
		return hardware
	}

	fileprivate static func systemInfo(for key: Int32) -> Int {
		var name: [Int32] = [CTL_HW, key]
		var size: Int = 2
		sysctl(&name, 2, nil, &size, &name, 0)
		var value = [Int](repeating: 0, count: Int(size))
		sysctl(&name, 2, &value, &size, &name, 0)

		return value[0]
	}
}



