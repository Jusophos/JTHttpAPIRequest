//
//  JTHttpAPIRequest.m
//
//  Created by Richard Jung on 14.11.2013.
//  Copyright (c) 2013 Jung IT. All rights reserved.
//

#import "JTHttpAPIRequest.h"

#import "JSONKit.h"

@interface JTHttpAPIRequest ()

@property (nonatomic, strong) NSString *endpoint;
@property (nonatomic, strong) NSURL *endpointURL;

@property (assign) enum JTHttpAPIRequestMethod *method;

@end

@implementation JTHttpAPIRequest

+ (APIRequest *)requestWithEndpoint:(NSString *)endpoint method:(enum JTHttpAPIRequestMethod *)method {
    
    return [[[self class] alloc] initWithEndpoint:endpoint method:method];
}

#pragma mark - Initialization
- (id)initWithEndpoint:(NSString *)endpoint method:(enum JTHttpAPIRequestMethod *)method {
    
    if ((self = [super init])) {
        
        self.endpoint = endpoint;
        self.method = method;
        
        NSString *baseURLString = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"config.api.base_url"];
        
        NSString *endpointURLString = [baseURLString stringByAppendingPathComponent:[@"/" stringByAppendingString:self.endpoint]];
        
        self.endpointURL = [NSURL URLWithString:endpointURLString];
        
        NSAssert(self.endpointURL != nil, @"Given endpoint or base url in app configuration is not valid.");
    }
    
    return self;
}

#pragma mark - Custom properties
- (NSString *)methodString {
    
    switch ((int)self.method) {
            
        case JTHttpAPIRequestMethodGET: return @"GET"; break;
        case JTHttpAPIRequestMethodPOST: return @"POST"; break;
        case JTHttpAPIRequestMethodPUT: return @"PUT"; break;
        case JTHttpAPIRequestMethodDELETE: return @"DELETE"; break;
        case JTHttpAPIRequestMethodHEAD: return @"HEAD"; break;
    }
    
    return nil;
}

#pragma mark - Actions
- (void)send {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    dispatch_async(queue, ^{
        
        NSString *rawResponse = [NSString stringWithContentsOfURL:self.endpointURL encoding:NSUTF8StringEncoding error:nil];
        
        if (!rawResponse) {
            
            [self triggerError:JTHttpAPIRequestErrorResponse]; return;
        }
        
        id parsedResponse = [rawResponse objectFromJSONString];
        
        if (!parsedResponse) {
            
            [self triggerError:JTHttpAPIRequestErrorParsing]; return;
        }
        
        if (self.synchronous)
    });
}

#pragma mark - Helper
- (void)triggerError:(enum JTHttpAPIRequestError)error {
    
    
}

- (void)startLoading {
    
    
}

- (void)endLoading {
    
}

@end
