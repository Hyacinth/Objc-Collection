//
//  CCTMXObjectGroup+Ext.h
//
//  Created by Dmitry Seredinov on 15.11.11.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@interface CCTMXObjectGroup(Ext)
-(CCArray*) objectsNamed:(NSString *)objectName;
@end
