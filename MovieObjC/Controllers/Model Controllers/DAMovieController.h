//
//  DAMovieController.h
//  MovieObjC
//
//  Created by Darin Marcus Armstrong on 7/5/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAMovie.h"

@interface DAMovieController : NSObject

+ (void)fetchMovieForSearchTerm:(NSString *)searchTerm completion:(void(^) (NSArray<DAMovie *> * movies))completion;

@end

