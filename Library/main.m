//
//  main.m
//  Library
//
//  Created by Fidel Sosa on 10/8/13.
//  Copyright (c) 2013 Fidel Sosa. All rights reserved.
//

#import "Book.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSArray *authors = @[@"Bernoulli, James", @"Einstein, Albert",
                            @"Lovecraft, H.P.", @"King, Stephen",
                            @"Fadell, Tony", @"Abnett, Dan",
                            @"Dembski-Bowden, Aaron",@"Swallow, James",
                            @"Goto, CS", @"Lee, Mike"];
        
        NSArray *titles = @[@"James and the Giant Peach", @"A Study in Mathematics",
                           @"The Long Goodbye", @"Searchers on the Bluff",
                           @"Know No Fear", @"The Final Stand",
                           @"How To Repair Computers", @"Zenith's History",
                           @"Computational Photography", @"Operation Sci-Fi"];
        
        NSArray *isbns = @[@"3-293-00001-0", @"3-293-00002-9",
                          @"3-293-00003-7", @"3-293-00004-5",
                          @"3-293-00005-3", @"3-293-00006-1",
                          @"3-293-00007-5", @"3-293-00008-8",
                          @"3-293-00009-6", @"3-293-00010-9"];
        
        NSMutableArray *books = [NSMutableArray array];
        
        // Initialize all our books
        for (int i = 0; i < 10; i++) {
            NSString *title = titles[i];
            NSString *author = authors[i];
            NSString *isbn = isbns[i];
            
            Book *book = [[Book alloc] initWithTitle:title author:author isbn:isbn];
            [books addObject:book];
        }
        
        // We can optionally choose to sort by ascending or descending, as demonstrated here
        NSSortDescriptor *byTitleAscending = [Book descriptorByTitleAscending:YES];
        NSSortDescriptor *byAuthorDescending = [Book descriptorbyAuthorAscending:NO];
        
        
        NSLog(@"\n--------------Unsorted Books:-------------- \n%@", books);
        
        [books sortUsingDescriptors:@[byTitleAscending]];
        NSLog(@"\n--------------Sorted By Title Ascending:-------------- \n%@",books);
        
        [books sortUsingDescriptors:@[byAuthorDescending]];
        NSLog(@"\n--------------Sorted By Author Descending:-------------- \n%@",books);
    }
    return 0;
}


