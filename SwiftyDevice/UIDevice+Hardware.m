//
//  UIDevice+Hardware.m
//  SwiftyDevice
//
//  Created by Paul Fechner on 9/14/16.
//  Copyright © 2016 PeeJWeeJ. All rights reserved.
//

#import "UIDevice+Hardware.h"
#include <sys/sysctl.h>

#pragma mark sysctl utils

@implementation UIDevice (Hardware)

+ (NSUInteger) getSysInfo: (uint) typeSpecifier
{
	size_t size = sizeof(int);
	int results;
	int mib[2] = {CTL_HW, typeSpecifier};
	sysctl(mib, 2, &results, &size, NULL, 0);
	return (NSUInteger) results;
}


+ (NSString *) getSysInfoByName: (NSString *)typeSpecifier
{
	char *type = (char *) [typeSpecifier UTF8String];
	size_t size;
	sysctlbyname(type, NULL, &size, NULL, 0);

	char *answer = malloc(size);
	sysctlbyname(type, answer, &size, NULL, 0);

	NSString *results = @(answer);

	free(answer);
	return results;
}

@end
