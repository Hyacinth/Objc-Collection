//
//  CCArray+QueueStack.m
//
//  Created by Dmitry Seredinov on 21.12.11.
//

#import "CCArray+QueueStack.h"

@implementation CCArray(QueueStack)

-(BOOL) isEmpty
{
    return [self count] == 0;
}

// Stacks are LIFO, so we return && remove objects from the end
-(id) pop
{
    if ([self isEmpty]) {
        return nil;
    }
    id lastObject = [self lastObject];
    if (lastObject)
        [[lastObject retain] autorelease];
        [self removeLastObject];
    return lastObject;
}

// Queues are FIFO, so we return && remove objects from the head
-(id) shift {
    if ([self isEmpty]) {
        return nil;
    }
    // if ([self count] == 0) return nil; // to avoid raising exception (Quinn)
    id headObject = [self objectAtIndex:0];
    if (headObject != nil) {
        [[headObject retain] autorelease]; // so it isn't dealloc'ed on remove
        [self removeObjectAtIndex:0];
    }
    return headObject;
}

// Push object to the end of array (queue || stack)
-(void) push:(id)obj
{
    [self addObject: obj];
}

// Chooses a random integer below n without bias.
// Computes m, a power of two slightly above n, and takes random() modulo m,
// then throws away the random number if it's between n and m.
// (More naive techniques, like taking random() modulo n, introduce a bias 
// towards smaller numbers in the range.)
static NSUInteger random_below(NSUInteger n) {
    NSUInteger m = 1;
    
    // Compute smallest power of two greater than n.
    // There's probably a faster solution than this loop, but bit-twiddling
    // isn't my specialty.
    do {
        m <<= 1;
    } while(m < n);
    
    NSUInteger ret;
    
    do {
        ret = random() % m;
    } while(ret >= n);
    
    return ret;
}

-(void) shuffle
{
    // http://en.wikipedia.org/wiki/Knuth_shuffle
    
    for(NSUInteger i = [self count]; i > 1; i--) {
        NSUInteger j = random_below(i);
        [self exchangeObjectAtIndex:i-1 withObjectAtIndex:j];
    }    
}
@end
