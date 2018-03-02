//
//  UIImage+MSImageNamed568hSupport.m
//
//  Created by Javier Soto on 9/27/12.
//
//

#import "UIImage+MSImageNamed568hSupport.h"

#define kIphone5ScreenHeight 568.0f
#define kIphone6PlusScreenHeight 736.0f
#define kIphone6ScreenHeight 667.0f
#define kIphoneXScreenHeight 812.0f
#define k568hImageNamePrefix @"-568h"
#define k736hImageNamePrefix @"-736h"
#define k667hImageNamePrefix @"-667h"
#define k812hImageNamePrefix @"-812h"

static BOOL _isIphone5 = NO;
static BOOL _isIphone6 = NO;
static BOOL _isIphone6Plus = NO;
static BOOL _isIphoneX = NO;
static BOOL _calculatedScreenSize = NO;

@implementation UIImage (MSImageNamed568hSupport)

+ (UIImage *)ms_imageNamed568hSupport:(NSString *)name
{
    if (!_calculatedScreenSize)
    {
        const CGSize screenSize = [UIScreen mainScreen].bounds.size;
        const CGFloat screenHeight = MAX(screenSize.width, screenSize.height);

        _isIphone5 = (screenHeight == kIphone5ScreenHeight);
        _isIphone6Plus = (screenHeight == kIphone6PlusScreenHeight);
        _isIphone6 = (screenHeight == kIphone6ScreenHeight);
        _isIphoneX = (screenHeight == kIphoneXScreenHeight);
        _calculatedScreenSize = YES;
    };

    UIImage *image = nil;
    NSString *prefix = nil;
    if (_isIphone5) {
        prefix = k568hImageNamePrefix;
    } else if (_isIphone6Plus) {
        prefix = k736hImageNamePrefix;
    } else if (_isIphone6) {
        prefix = k667hImageNamePrefix;
    } else if (_isIphoneX) {
        prefix = k812hImageNamePrefix;
    }

    if (prefix)
    {
        NSString *imageExtension = [name pathExtension];
        NSString *imageNameWithoutExtension = [name stringByDeletingPathExtension];

        NSString *tallerImageName = [imageNameWithoutExtension stringByAppendingString:prefix];

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
