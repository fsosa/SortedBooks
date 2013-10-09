//
//  Book.m
//  Library
//
//  Created by Fidel Sosa on 10/8/13.
//  Copyright (c) 2013 Fidel Sosa. All rights reserved.
//

#import "Book.h"

@implementation Book

+ (NSSortDescriptor *) descriptorbyAuthorAscending:(BOOL)isAscending {
    return [NSSortDescriptor sortDescriptorWithKey:@"author" ascending:isAscending];
}

+ (NSSortDescriptor *) descriptorByTitleAscending:(BOOL)isAscending {
    return [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:isAscending];
}

- (id) initWithTitle:(NSString *)title author:(NSString *)author isbn:(NSString *)isbn {
    self = [super init];
    
    if (self) {
        self.title = title;
        self.author = author;
        self.isbn = isbn;
    }
    
    return self;
}

- (NSString *) description {
    return [NSString stringWithFormat:@"%@ - %@ - ISBN %@", self.title, self.author, self.isbn];
}

@end
