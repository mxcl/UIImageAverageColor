#import "UIImage+AverageColor.h"


@implementation UIImage (AverageColor)

- (UIColor *)averageColor {
    CGSize size = {1, 1};
    UIGraphicsBeginImageContext(size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(ctx, kCGInterpolationMedium);
    [self drawInRect:(CGRect){.size = size} blendMode:kCGBlendModeCopy alpha:1];
    uint8_t *data = CGBitmapContextGetData(ctx);
    UIColor *color = [UIColor colorWithRed:data[0] / 255.f green:data[1] / 255.f blue:data[2] / 255.f alpha:1];
    UIGraphicsEndImageContext();
    return color;
}

@end
