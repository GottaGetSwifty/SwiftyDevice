//
//  Devices.swift
//  SwiftyDevice
//
//  Created by Paul Fechner on 11/10/16.
//  Copyright © 2016 PeeJWeeJ. All rights reserved.
//

/******************************************
* The way this works is the enum DeviceLine's cases are each device family, (iPhone, iPad, etc.)
* Each case has an associated value for the specific line in the family. (iPhone 5, iphone 6, etc.)
* All these enums can create themselves based on a hardware string
******************************************/


/// * The way this works is the enum DeviceLine's cases are each device family, (iPhone, iPad, etc.)
/// * Each case has an associated value for the specific line in the family. (iPhone 5, iphone 6, etc.)
///  * All these enums can create themselves based on a hardware string
///
/// - iPhone:: enum for iPhone line
/// - iPad:: enum for iPhone line
/// - iPod:: enum for iPhone line
/// - watch:: enum for iPhone line
/// - appleTV:: enum for iPhone line
/// - unknown: No valid device was found
public enum DeviceLine {

	case unknown
	case iPhone(IPhone)
	case iPad(IPad)
	case iPod(IPod)
	case watch(Watch)
	case appleTV(AppleTV)
	case simulator


	//MARK: Formatting helpers

	/// Pretty text with the simple line name, e.g. iPhone or iPad
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

	/// Pretty text with the device name from the device Type, e.g. iPhone 6+ or Apple Watch Series 1-42mm
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


	//MARK: Comparison

	/// Convenience method to compare the basic enum values without comparing their stored types
	///
	/// - Parameter otherEnum: enum to compare with own instance
	/// - Returns: whether the basic enum values match without comparing their stored types
	fileprivate func matchesBasicLine(otherEnum: DeviceLine) -> Bool {
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

	//MARK: - SubTypes

	/// Should contain all basic models of iPhones
	public enum IPhone: String {

		case unknown = "Unknown iPhone"
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
	}

	/// Should contain all basic models of iPads
	public enum IPad: String {

		case unknown = "Unknown iPad"
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
	}

	/// Should contain all basic models of iPods
	public enum IPod: String {
		case unknown = "Unknown iPod"
		case iPod1 = "iPod 1G"
		case iPod2 = "iPod 2G"
		case iPod3 = "iPod 3G"
		case iPod4 = "iPod 4G"
		case iPod5 = "iPod 5G"
		case iPod6 = "iPod 6G"
	}

	/// Should contain all basic models of Apple Watches
	public enum Watch: String {
		case unknown = "Unknown Apple Watch"
		case watch0_38 = "Apple Watch Series 0-38mm"
		case watch0_42 = "Apple Watch Series 0-42mm"
		case watch1_38 = "Apple Watch Series 1-38mm"
		case watch1_42 = "Apple Watch Series 1-42mm"
		case watch2_38 = "Apple Watch Series 2-38mm"
		case watch2_42 = "Apple Watch Series 12-42mm"
	}

	/// Should contain all basic models of Apple TVs
	public enum AppleTV: String {
		case unknown
		case appleTV1G = "AppleTV 1"
		case appleTV2G = "AppleTV 2"
		case appleTV3G = "AppleTV 3"
		case appleTV4G = "AppleTV 4"
	}
}



