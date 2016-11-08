//
//  UIDevice+Hardware.swift
//  SwiftyDevice
//
//  Created by Paul Fechner on 9/14/16.
//  Copyright © 2016 PeeJWeeJ. All rights reserved.
//

import UIKit
import SystemConfiguration

enum IPhone: String {

	case unknown = "Unknown"
	case iPhone1 = "iPhone 1G"
	case iPhone3G = "iPhone 3G"
	case iPhone3GS = "iPhone 3Gs"
	case iPhone4 = "iPhone 4"
	case iPhone4s = "iPhone 4s"
	case iPhone5 = "iPhone 5"
	case iPhone5C = "iPhone 5C"
	case iPhone5s = "iPhone 5s"
	case iPhone6 = "iPhone 6"
	case iPhone6Plus = "iPhone 6+"
	case iPhone6s = "iPhone 6s"
	case iPhone6sPlus = "iPhone 6s+"
	case iPhoneSE = "iPhone SE"
	case iPhone7 = "iPhone 7"
	case iPhone7Plus = "iPhone 7+"

	static func deviceForHWString(hwString: String) -> IPhone {

		switch hwString {
		case "iPhone1,1":
			return .iPhone1

		case "iPhone1,2":
			return .iPhone3G

		case "iPhone2":
			return .iPhone3GS

		case "iPhone3,1", "iPhone3,3":
			return .iPhone4

		case "iPhone4":
			return .iPhone4s

		case "iPhone5,1", "iPhone5,2":
			return .iPhone5

		case "iPhone5,3", "iPhone5,4":
			return .iPhone5C

		case "iPhone6,1", "iPhone6,2":
			return .iPhone5s

		case "iPhone7,2":
			return .iPhone6

		case "iPhone7,1":
			return .iPhone6Plus

		case "iPhone8,1":
			return .iPhone6s

		case "iPhone8,2":
			return .iPhone6sPlus

		case "iPhone8,4":
			return .iPhoneSE

		case "iPhone9,1":
			return .iPhone7

		case "iPhone9,2":
			return .iPhone7Plus
		default:
			return .unknown
		}
	}
}

enum IPad: String {

	case unknown
	case iPad1 = "iPad 1"
	case iPad2 = "iPad 2"
	case iPadMini1 = "iPad-Mini 1"
	case iPad3 = "iPad 3"
	case iPad4 = "iPad 4"
	case iPadAir1 = "iPad Air 1"
	case iPadMini2 = "iPad-Mini 2"
	case iPadMini3 = "iPad-Mini 3"
	case iPadMini4 = "iPad-Mini 4"
	case iPadAir2 = "iPad Air 2"
	case iPadPro1 = "iPad Pro 1-12.9"
	case iPadBabyPro1 = "iPad Pro 1-9.7"

	static func deviceForHWString(hwString: String) -> IPad {

		switch hwString {

		case "iPad1":
			return .iPad1

		case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
			return .iPad2

		case "iPad2,5", "iPad2,6", "iPad2,7":
			return .iPadMini1

		case "iPad3,1", "iPad3,2", "iPad3,3":
			return .iPad3

		case "iPad3,4", "iPad3,5", "iPad3,6":
			return .iPad4

		case "iPad4,1", "iPad4,2", "iPad4,3":
			return .iPadAir1

		case "iPad4,4", "iPad4,5", "iPad4,6":
			return .iPadMini2

		case "iPad4,7", "iPad4,8", "iPad4,9":
			return .iPadMini3

		case "iPad5,1", "iPad5,2":
			return .iPadMini4

		case "iPad5,3", "iPad5,4":
			return .iPadAir2

		case "iPad6,3", "iPad6,4":
			return .iPadBabyPro1

		case "iPad6,7", "iPad6,8":
			return .iPadPro1

		default:
			return .unknown
		}
	}
}

enum IPod: String {
	case unknown
	case iPod1 = "iPod 1G"
	case iPod2 = "iPod 2G"
	case iPod3 = "iPod 3G"
	case iPod4 = "iPod 4G"
	case iPod5 = "iPod 5G"
	case iPod6 = "iPod 6G"

	static func deviceForHWString(hwString: String) -> IPod {

		switch hwString {
		case "iPod1,1":
			return .iPod1
		case "iPod2,1":
			return .iPod2
		case "iPod3,1":
			return .iPod3
		case "iPod4,1":
			return .iPod4
		case "iPod5,1":
			return .iPod5
		case "iPod7,1":
			return .iPod6

		default:
			return .unknown
		}
	}
}

enum Watch: String {
	case unknown
	case watch138 = "Apple Watch 1-38mm"
	case watch142 = "Apple Watch 1-42mm"


	static func deviceForHWString(hwString: String) -> Watch {
		switch hwString {
		case "Watch1,1":
			return .watch138
		case "Watch1,2":
			return .watch142
		default:
			return .unknown
		}
	}
}

enum AppleTV: String {
	case unknown
	case appleTV1G = "AppleTV 1"
	case appleTV2G = "AppleTV 2"
	case appleTV3G = "AppleTV 3"
	case appleTV4G = "AppleTV 4"

	static func deviceForHWString(hwString: String) -> AppleTV {
		switch hwString {
		case "AppleTV1,1":
			return .appleTV1G
		case "AppleTV2,1":
			return .appleTV2G
		case "AppleTV3,1", "AppleTV3,2":
			return .appleTV3G
		case "AppleTV5,3":
			return .appleTV4G
		default:
			return .unknown
		}
	}
}

enum DeviceLine {

	case unknown
	case iPhone(IPhone)
	case iPad(IPad)
	case iPod(IPod)
	case watch(Watch)
	case appleTV(AppleTV)
	case simulator

	var lineName: String {
		switch self {
		case .unknown:
			return "Unknown"
		case .iPhone(_):
			return "iPhone"
		case .iPad(_):
			return "iPad"
		case .iPod(_):
			return "iPod"
		case .watch(_):
			return "Apple Watch"
		case .appleTV(_):
			return "Apple TV"
		case .simulator:
			return "Simulator"
		}
	}

	var deviceName: String {
		switch self {
		case .unknown:
			return "Unknown"
		case .iPhone(let device):
			return device.rawValue
		case .iPad(let device):
			return device.rawValue
		case .iPod(let device):
			return device.rawValue
		case .watch(let device):
			return device.rawValue
		case .appleTV(let device):
			return device.rawValue
		case .simulator:
			return "Simulator"
		}
	}

	static func lineForHWString(hwString: String) -> DeviceLine {

		if hwString.contains("86") {
			return .simulator
		}
		else if hwString.contains("iPhone") {
			return .iPhone(IPhone.deviceForHWString(hwString: hwString))
		}
		else if hwString.contains("iPad") {
			return .iPad(IPad.deviceForHWString(hwString: hwString))
		}
		else if hwString.contains("iPod") {
			return .iPod(IPod.deviceForHWString(hwString: hwString))
		}
		else if hwString.contains("Watch") {
			return .watch(Watch.deviceForHWString(hwString: hwString))
		}
		else if hwString.contains("Apple TV") {
			return .appleTV(AppleTV.deviceForHWString(hwString: hwString))
		}
		else if hwString.contains("Simulator") {
			return .simulator
		}
		else {
			return .unknown
		}
	}

	func matchesEnumValue(otherEnum: DeviceLine) -> Bool {
		switch (self, otherEnum) {
		case (.unknown, .unknown), (.iPhone(_), .iPhone(_)),
			 (.iPad(_), .iPad(_)), (.iPod(_), .iPod(_)),
			 (.watch(_), .watch(_)), (.appleTV(_), .appleTV(_)),
			 (.simulator, .simulator):
			return true
		default:
			return false
		}
	}
}



extension UIDevice {

	static var deviceLine: DeviceLine {
		return DeviceLine.lineForHWString(hwString: machineInfoName)
	}

	static var isPhoneIdiom: Bool {
		return current.userInterfaceIdiom == .phone
	}

	static var isRetina: Bool {
		return UIScreen.main.scale == 2.0
	}
	static var isIPod: Bool {
		return DeviceLine.lineForHWString(hwString: machineInfoName).matchesEnumValue(otherEnum: .iPod(.unknown))
	}

	static var machineInfoName: String {
		return getSysInfo(byName: "hw.machine")
	}

	static var cpuFrequency: Int {
		return Int(getSysInfo(uint(HW_CPU_FREQ)))
	}

	static var busFrequency: Int {
		return Int(getSysInfo(uint(HW_BUS_FREQ)))
	}

	static var totalMemory: Int {
		return Int(getSysInfo(uint(HW_MEMSIZE)))
	}

	static var userMemory: Int {
		return Int(getSysInfo(uint(HW_USERMEM)))
	}

	static var maxSocketBufferSize: Int {
		return Int(getSysInfo(uint(KIPC_MAXSOCKBUF)))
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
}







