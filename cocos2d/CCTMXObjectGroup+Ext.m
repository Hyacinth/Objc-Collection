//
//  CCTMXObjectGroup+Ext.m
//
//  Created by Dmitry Seredinov on 15.11.11.
//

#import "CCTMXObjectGroup+Ext.h"

@implementation CCTMXObjectGroup(Ext)
-(CCArray*) objectsNamed:(NSString *)objectName
{
    CCArray *result = [CCArray array];
	for( id object in objects_ ) {
		if( [[object valueForKey:@"name"] isEqual:objectName] ) {
			[result addObject:object];          
		}
    }
	return result;
}
@end
