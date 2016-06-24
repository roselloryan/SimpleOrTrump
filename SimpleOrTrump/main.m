//
//  main.m
//  SimpleOrTrump


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *line = @"8C 8S | C";
        
        NSArray *sepArray = [line componentsSeparatedByString:@" | "];
        
        NSString *trumpSuit = [NSString stringWithFormat:@"%@", [sepArray objectAtIndex:1]];
        
        NSArray *cardsArray = [[NSString stringWithFormat:@"%@", [sepArray objectAtIndex:0]] componentsSeparatedByString:@" "];
        
        NSMutableString *firstCard = [[NSString stringWithFormat:@"%@", [cardsArray objectAtIndex:0]] mutableCopy];
        NSMutableString *secondCard = [[NSString stringWithFormat:@"%@", [cardsArray objectAtIndex:1]] mutableCopy];
        
        NSString *suitOfFirstCard = [NSString stringWithFormat:@"%c", [firstCard characterAtIndex:firstCard.length - 1]];
        NSString *suitOfSecondCard = [NSString stringWithFormat:@"%c", [secondCard characterAtIndex:secondCard.length - 1]];
        
        NSString *solutionString = [[NSString alloc]init];
        
        
        // check for trump suit!
        if ([suitOfFirstCard isEqualToString:trumpSuit] && ![suitOfSecondCard isEqualToString:trumpSuit]) {
            // print first card
            solutionString = [NSString stringWithFormat:@"%@", [cardsArray objectAtIndex:0]];
        }
        
        else if ([suitOfSecondCard isEqualToString:trumpSuit] && ![suitOfFirstCard isEqualToString:trumpSuit]) {
            // print second card
            solutionString = [NSString stringWithFormat:@"%@", [cardsArray objectAtIndex:1]];
        }
        
        else {
            
            NSRange suitRangeFirstCard = NSMakeRange(firstCard.length - 1, 1);
            [firstCard deleteCharactersInRange:suitRangeFirstCard];
        
            NSRange suitRangeSecondCard = NSMakeRange(secondCard.length - 1, 1);
            [secondCard deleteCharactersInRange:suitRangeSecondCard];
        
            
            if ([firstCard isEqualToString:suitOfSecondCard]) {
                // print both cards
                solutionString = [NSString stringWithFormat:@"%@", [sepArray objectAtIndex:0]];
            }
            
            else {
                
                NSCharacterSet *letterCharacterSet = [NSCharacterSet letterCharacterSet];
                
                if ([letterCharacterSet characterIsMember:[firstCard characterAtIndex:0]] && ![letterCharacterSet characterIsMember:[secondCard characterAtIndex:0]]) {
                    // print first card
                    solutionString = [NSString stringWithFormat:@"%@",  [cardsArray objectAtIndex:0]];
                    
                }
                else if (![letterCharacterSet characterIsMember:[firstCard characterAtIndex:0]] && [letterCharacterSet characterIsMember:[secondCard characterAtIndex:0]]) {
                    // print second card
                    solutionString = [NSString stringWithFormat:@"%@",  [cardsArray objectAtIndex:1]];
                    
                }
                else if ([letterCharacterSet characterIsMember:[firstCard characterAtIndex: 0]] && [letterCharacterSet characterIsMember:[secondCard characterAtIndex:0]]) {
                    
                    NSArray *faceCardsRanked = [NSArray arrayWithObjects: @"A", @"K", @"Q", @"J", nil];
                    //compare face cards
                    if ([faceCardsRanked indexOfObject:firstCard] < [faceCardsRanked indexOfObject:secondCard]) {
                        // print first card
                        solutionString = [NSString stringWithFormat:@"%@",  [cardsArray objectAtIndex:0]];
                        
                    }
                    else if ([faceCardsRanked indexOfObject:firstCard] > [faceCardsRanked indexOfObject:secondCard]) {
                        // print second card
                        solutionString = [NSString stringWithFormat:@"%@",  [cardsArray objectAtIndex:1]];
                        
                    }
                    else {
                        // print both cards
                        solutionString = [NSString stringWithFormat:@"%@",  [sepArray objectAtIndex:0]];
                    }

                }
                
                else {
                    // compare number values
                    NSInteger firstcardInt = [firstCard integerValue];
                    NSInteger secondcardInt = [secondCard integerValue];
                    
                    if (firstcardInt > secondcardInt) {
                        // print first card
                        solutionString = [NSString stringWithFormat:@"%@",  [cardsArray objectAtIndex:0]];
                        
                    }
                    else if (firstcardInt < secondcardInt) {
                        // print second card
                        solutionString = [NSString stringWithFormat:@"%@",  [cardsArray objectAtIndex:1]];
                        
                    }
                    else {
                        // print both cards
                        solutionString = [NSString stringWithFormat:@"%@",  [sepArray objectAtIndex:0]];
                    }
                }
            }
        }
        NSLog(@"%@", solutionString);

    }
    return 0;
}
