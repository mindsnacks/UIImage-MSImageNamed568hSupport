//
//  UIImage+MSImageNamed568hSupport.h
//
//  Created by Javier Soto on 9/27/12.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (MSImageNamed568hSupport)

/**
 * @discussion if the device is not the iPhone 5, it behaves exactly like +imageNamed:
 * On iPhone 5 it looks for the image with the -568h prefix, and falls back to just `name` if it can't find it.
 */
+ (UIImage *)ms_imageNamed568hSupport:(NSString *)name;

@end
