//
//  HardwareStringable.swift
//  SwiftyDevice
//
//  Created by Paul Fechner on 11/10/16.
//  Copyright © 2016 PeeJWeeJ. All rights reserved.
//

protocol HardwareStringable: Equatable {
	static func make(from hwString: String) -> Self
	static func makeOrNil(from hwString: String) -> Self?
}

extension DeviceLine.IPhone: HardwareStringable {

	static func make(from hwString: String) -> DeviceLine.IPhone {

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

		case "iPhone9,1", "iPhone9,3":
			return .iPhone7

		case "iPhone9,2", "iPhone9,4":
			return .iPhone7Plus
		default:
			return .unknown
		}
	}

	static func makeOrNil(from hwString: String) -> DeviceLine.IPhone? {
		let result = make(from: hwString)
		return result == .unknown ? nil : result
	}
}

extension DeviceLine.IPad: HardwareStringable {

	static func make(from hwString: String) -> DeviceLine.IPad {

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

	static func makeOrNil(from hwString: String) -> DeviceLine.IPad? {
		let result = make(from: hwString)
		return result == .unknown ? nil : result
	}
}

extension DeviceLine.IPod: HardwareStringable {

	static func make(from hwString: String) -> DeviceLine.IPod {

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

	static func makeOrNil(from hwString: String) -> DeviceLine.IPod? {
		let result = make(from: hwString)
		return result == .unknown ? nil : result
	}
}

extension DeviceLine.Watch: HardwareStringable {

	static func make(from hwString: String) -> DeviceLine.Watch {
		switch hwString {
		case "Watch1,1":
			return .watch0_38
		case "Watch1,2":
			return .watch0_42
		case "Watch2,3":
			return .watch2_38
		case "Watch2,4":
			return .watch2_42
		case "Watch2,6":
			return .watch1_38
		case "Watch2,7":
			return .watch1_42
		default:
			return .unknown
		}
	}

	static func makeOrNil(from hwString: String) -> DeviceLine.Watch? {
		let result = make(from: hwString)
		return result == .unknown ? nil : result
	}
}

extension DeviceLine.AppleTV: HardwareStringable {

	static func make(from hwString: String) -> DeviceLine.AppleTV {
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

	static func makeOrNil(from hwString: String) -> DeviceLine.AppleTV? {
		let result = make(from: hwString)
		return result == .unknown ? nil : result
	}
}

extension DeviceLine: HardwareStringable {

	static func make(from hwString: String) -> DeviceLine {

		if hwString.contains("86") {
			return .simulator
		}
		else if hwString.contains("iPhone") {
			return .iPhone(IPhone.make(from: hwString))
		}
		else if hwString.contains("iPad") {
			return .iPad(IPad.make(from: hwString))
		}
		else if hwString.contains("iPod") {
			return .iPod(IPod.make(from: hwString))
		}
		else if hwString.contains("Watch") {
			return .watch(Watch.make(from: hwString))
		}
		else if hwString.contains("Apple TV") {
			return .appleTV(AppleTV.make(from: hwString))
		}
		else if hwString.contains("Simulator") {
			return .simulator
		}
		else {
			return .unknown
		}
	}

	static func makeOrNil(from hwString: String) -> DeviceLine? {
		let result = make(from: hwString)
		return (result == DeviceLine.unknown) ? nil : result
	}
}

extension DeviceLine: Equatable {
	static func ==(leftItem: DeviceLine, rightItem: DeviceLine) -> Bool {
		switch (leftItem, rightItem) {
		case (.unknown, .unknown), (.simulator, simulator):
			return true
		case (.iPhone(let left), iPhone(let right)):
			return left == right
		case (.iPad(let left), iPad(let right)):
			return left == right
		case (.iPod(let left), iPod(let right)):
			return left == right
		case (.watch(let left), watch(let right)):
			return left == right
		case (.appleTV(let left), appleTV(let right)):
			return left == right
		default:
			return false
		}
	}
}

fileprivate extension RawRepresentable where RawValue: Comparable {

	static func <(lessThan: Self, item: Self) -> Bool {
		return lessThan.rawValue < item.rawValue
	}

	static func ==(leftItem: Self, rightItem: Self) -> Bool {
		return leftItem.rawValue == rightItem.rawValue
	}
	
}
