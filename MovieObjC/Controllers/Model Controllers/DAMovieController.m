//
//  DAMovieController.m
//  MovieObjC
//
//  Created by Darin Marcus Armstrong on 7/5/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

#import "DAMovieController.h"

static NSString * const baseURLString = @"https://api.themoviedb.org/3";
static NSString * const searchComponent = @"search";
static NSString * const movieComponent = @"movie";
static NSString * const apiKeyQueryItemName = @"api_key";
static NSString * const apiKeyQueryItemValue = @"1cc9f8060ce325d7b8e3eb1bc2e2ba4b";
static NSString * const searchTermQueryItemName = @"query";


@implementation DAMovieController

+ (void)fetchMovieForSearchTerm:(NSString *)searchTerm completion:(void(^) (NSArray<DAMovie *> * movies))completion
{
    NSURL * baseURL = [NSURL URLWithString:baseURLString];
    NSURL * searchURL = [baseURL URLByAppendingPathComponent:searchComponent];
    NSURL * searchMovieURL = [searchURL URLByAppendingPathComponent:movieComponent];
    NSURLComponents * urlComponents = [NSURLComponents componentsWithURL:searchMovieURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem * apiKey = [[NSURLQueryItem alloc]initWithName:apiKeyQueryItemName value:apiKeyQueryItemValue];
    NSURLQueryItem * searchQuery = [[NSURLQueryItem alloc] initWithName:searchTermQueryItemName value:searchTerm];
    
    urlComponents.queryItems = @[apiKey, searchQuery];
    
    NSURL * finalURL = urlComponents.URL;
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        if (error)
        {
            NSLog(@"There was an issue with the URL: %@, %@", error.localizedDescription, error);
            completion(nil);
            return;
        }
        
        if (data)
        {
            NSDictionary * topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing JSON data: %@", error.localizedDescription);
                completion(nil);
                return;
            }
            
            NSMutableArray * movieArray = [NSMutableArray new];
            NSArray * resultsArray = topLevelDictionary[@"results"];
                
            for (NSDictionary * movieResultDict in resultsArray)
            {
                DAMovie * movie = [[DAMovie alloc] initWithDictionary:movieResultDict];
                [movieArray addObject:movie];
                completion(movieArray);
            }
        }
    }]resume];
}

@end
