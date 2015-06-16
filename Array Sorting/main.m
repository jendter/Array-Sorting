//
//  main.m
//  Array Sorting
//
//  Created by Josh Endter on 6/16/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arrayToSort = @[@"eeeeeAAbfdf",
                                 @"Everything",
                                 @"news to me",
                                 @"timepiece",
                                 @"egg",
                                 @"eggs",
                                 @"paper",
                                 @"e",
                                 @"facebook",
                                 @"painting",
                                 @"231 thurlow st",
                                 @"99 bottles"];
        NSArray *sortedArray;
        
        // All in one way
//        sortedArray = [arrayToSort sortedArrayUsingComparator: ^NSComparisonResult (id obj1, id obj2) {
//            
//            return [obj1 caseInsensitiveCompare:obj2];
//            
//        }];
//        NSLog(@"Sorted %@", sortedArray);
//
        
        
        // Sorting Alphabetically
        NSComparator sortAlphabetically = ^(id obj1, id obj2) {
            return [obj1 caseInsensitiveCompare:obj2];
        };
        sortedArray = [arrayToSort sortedArrayUsingComparator:sortAlphabetically];
        NSLog(@"Sorted alphabetically: %@", sortedArray);
        
        
        // Sort by Length
        NSComparator sortByLength = ^(id obj1, id obj2) {
            NSString *obj1String = [NSString stringWithString:(NSString *)obj1];
            NSString *obj2String = [NSString stringWithString:(NSString *)obj2];
            
            if (obj1String.length > obj2String.length) {
                return (NSComparisonResult)NSOrderedDescending;
            } else if (obj1String.length < obj2String.length) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            
            return (NSComparisonResult)NSOrderedSame;
        };
        sortedArray = [arrayToSort sortedArrayUsingComparator:sortByLength];
        NSLog(@"Sorted by length: %@", sortedArray);
        
        
        // Sort alphabetically by last character
        NSComparator sortAlphabeticallyByLastCharacter = ^(id obj1, id obj2) {
            
            NSString *obj1String = [NSString stringWithString:(NSString *)obj1];
            NSString *obj2String = [NSString stringWithString:(NSString *)obj2];
            
            NSString *obj1LastChar = [obj1String substringFromIndex:obj1String.length-1];
            NSString *obj2LastChar = [obj2String substringFromIndex:obj2String.length-1];
            
            return [obj1LastChar caseInsensitiveCompare:obj2LastChar];
        };
        sortedArray = [arrayToSort sortedArrayUsingComparator:sortAlphabeticallyByLastCharacter];
        NSLog(@"Sorted alphabetically by last character: %@", sortedArray);
        
        
        // Sort by occurrences of 'e'
        NSComparator sortByOccurrencesOfE = ^(id obj1, id obj2) {
            
            NSString *obj1String = [NSString stringWithString:(NSString *)obj1];
            NSString *obj2String = [NSString stringWithString:(NSString *)obj2];
            
            NSUInteger numOfEInObj1 = [[obj1String componentsSeparatedByString:@"e"] count]-1;
                       numOfEInObj1 += [[obj1String componentsSeparatedByString:@"E"] count]-1;
            NSUInteger numOfEInObj2 = [[obj2String componentsSeparatedByString:@"e"] count]-1;
                       numOfEInObj2 += [[obj2String componentsSeparatedByString:@"E"] count]-1;
            
            if (numOfEInObj1 < numOfEInObj2) {
                return (NSComparisonResult)NSOrderedDescending;
            } else if (numOfEInObj1 > numOfEInObj2) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            
            return (NSComparisonResult)NSOrderedSame;
            
            
        };
        sortedArray = [arrayToSort sortedArrayUsingComparator:sortByOccurrencesOfE];
        NSLog(@"occurrences of 'e': %@", sortedArray);
    }
    return 0;
}
