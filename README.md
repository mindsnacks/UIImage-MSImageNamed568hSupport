UIImage-ImageNamed568hSupport
=============================

Method for UIImage to be able to load images with the -568h prefix on the iPhone5.

If the device is not the iPhone 5, it behaves exactly like ```+imageNamed:```
 On iPhone 5 it looks for the image with the ```-568h```` prefix, and falls back to just `name` if it can't find it.