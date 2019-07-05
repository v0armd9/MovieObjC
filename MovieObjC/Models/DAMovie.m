//
//  DAMovie.m
//  MovieObjC
//
//  Created by Darin Marcus Armstrong on 7/5/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

#import "DAMovie.h"

@implementation DAMovie

- (instancetype)initWithMovieTitle:(NSString *)title rating:(double)rating overview:(NSString *)overview
{
    self = [super init];
    if (self)
    {
        _title = title;
        _rating = rating;
        _overview = overview;
    }
    return self;
}

@end

@implementation DAMovie (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * title = dictionary[@"title"];
    double rating = [dictionary[@"vote_average"]doubleValue];
    NSString * overview = dictionary[@"overview"];
    
    return [self initWithMovieTitle:title rating:rating overview:overview];
    
}

@end
