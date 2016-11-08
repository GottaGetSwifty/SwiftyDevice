//
//  UIDevice+Hardware.h
//  SwiftyDevice
//
//  Created by Paul Fechner on 9/14/16.
//  Copyright © 2016 PeeJWeeJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Hardware)

+ (NSString *) getSysInfoByName: (NSString *)typeSpecifier;
+ (NSUInteger) getSysInfo: (uint) typeSpecifier;

@end
