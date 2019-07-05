//
//  DAMovie.h
//  MovieObjC
//
//  Created by Darin Marcus Armstrong on 7/5/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DAMovie : NSObject

@property (nonatomic, copy, readonly) NSString * title;
@property (nonatomic, readonly) double rating;
@property (nonatomic, copy, readonly) NSString * overview;

- (instancetype)initWithMovieTitle:(NSString *)title
                            rating:(double)rating
                          overview:(NSString *)overview;


@end

@interface DAMovie (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
