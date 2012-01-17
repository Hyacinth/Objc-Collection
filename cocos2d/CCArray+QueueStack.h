//
//  CCArray+QueueStack.h
//
//  Created by Dmitry Seredinov on 21.12.11.
//
//  Credits: 
//      http://stackoverflow.com/questions/817469/how-do-i-make-and-use-a-queue-in-objective-c
//      http://stackoverflow.com/questions/791232/canonical-way-to-randomize-an-nsarray-in-objective-c/791744#791744
//

#import "CCArray.h"

@interface CCArray(QueueStack)
-(id) pop;
-(id) shift;
-(void) push:(id)obj;
-(BOOL) isEmpty;
-(void) shuffle;
@end
