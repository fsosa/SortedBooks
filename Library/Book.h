//
//  Book.h
//  Library
//
//  Created by Fidel Sosa on 10/8/13.
//  Copyright (c) 2013 Fidel Sosa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (nonatomic, strong, readwrite) NSString *author;
@property (nonatomic, strong, readwrite) NSString *title;
@property (nonatomic, strong, readwrite) NSString *isbn;

+ (NSSortDescriptor *) descriptorByTitleAscending:(BOOL)isAscending;
+ (NSSortDescriptor *) descriptorbyAuthorAscending:(BOOL)isAscending;

- (id) initWithTitle:(NSString *)title author:(NSString *)author isbn:(NSString *)isbn;

@end
