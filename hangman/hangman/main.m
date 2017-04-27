//
//  main.m
//  hangman
//
//  Created by Eric Giannini on 4/27/17.
//  Copyright © 2017 Unicorn Mobile, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSString *word = @"RHYTHM";
        NSMutableArray<NSString *> *usedLetters = [NSMutableArray arrayWithCapacity:8];
        
        printf("Welcome to hangman!\n");
        printf("Press a letter to guess, or Ctrl+C to quit. \n");
        printWord(word, usedLetters);
        
        while (1) {
            // read a string from the user
            char cstring[256];
            scanf("%s", cstring);
            
            // convert it to an NSString
            
            NSString *input = [NSString stringWithCString:cstring encoding:NSUTF8StringEncoding];
            
            if ([input length] !=1){
                printf("Please type exactly one letter, or Ctrl-C to quit.");
                
            }else {
                // this letter is new
                
                // pull out the first letter from the input
                unichar letter = [input characterAtIndex:0];
                
                // convert it to an uppercase NSString
                
                NSString *letterString = [[NSString stringWithFormat:@"%C", letter] uppercaseString];
                
                if ([usedLetters containsObject:letterString]) {
                    printf("You used that letter already! \n");
                } else {
                    [usedLetters addObject:letterString];
                }
            }
            
            printWord(word, usedLetters);
        }
        
    }
    
    return 0;
}
