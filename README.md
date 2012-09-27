UIImage-MSImageNamed568hSupport
=============================

### Method for UIImage to be able to load images with the -568h prefix on the iPhone5.

- UIKit uses the -568h prefix to load a different image on the iPhone 5 only for the Default.png. This adds a method via a category to use in replacement for ```+[UIImage imageNamed:]``` that searches for the file with the prefix for any image.

- If the device is not the iPhone 5, it behaves exactly like ```+imageNamed:```
On iPhone 5 it looks for the image with the ```-568h``` prefix, and falls back to just `name` if it can't find it.
 
- This just adds a different method on a category, **it doesn't do any method swizzling**, so it doesn't mess with the system at all.

 ```objc
+ (UIImage *)ms_imageNamed568hSupport:(NSString *)name;
 ```