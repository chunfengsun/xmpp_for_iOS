
#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"


@interface tooles : NSObject {	

}

+ (NSString *)Date2StrV:(NSDate *)indate;
+ (NSString *)Date2Str:(NSDate *)indate;
+ (void)MsgBox:(NSString *)msg;

+ (NSDateComponents *)DateInfo:(NSDate *)indate;

+ (void)OpenUrl:(NSString *)inUrl;

+ (void)showHUD:(NSString *)msg;
+ (void)removeHUD;



@end
