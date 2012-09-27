//
//  UIImage+MSImageNamed568hSupport.m
//
//  Created by Javier Soto on 9/27/12.
//
//

#import "UIImage+iPhone5ImageNamed.h"

#define kIphone5ScreenHeight 568.0f
#define k568hImageNamePrefix @"-568h"

static BOOL _isIphone5 = NO;

@implementation UIImage (MSImageNamed568hSupport)

+ (void)load
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat screenHeight= MAX(screenSize.width, screenSize.height);

    _isIphone5 = (screenHeight == kIphone5ScreenHeight);
}

+ (UIImage *)ms_imageNamed568hSupport:(NSString *)name
{
    UIImage *image = nil;

    if (_isIphone5)
    {
        NSString *imageExtension = [name pathExtension];
        NSString *imageNameWithoutExtension = [name stringByDeletingPathExtension];

        NSString *tallerImageName = [NSString stringWithFormat:@"%@%@", imageNameWithoutExtension, k568hImageNamePrefix];

        if (imageExtension.length > 0)
        {
            tallerImageName = [tallerImageName stringByAppendingPathExtension:imageExtension];
        }

        image = [self imageNamed:tallerImageName];
    }

    if (!image)
    {
        image = [self imageNamed:name];
    }

    return image;
}

@end
