//
//  JTHttpAPIRequest.h
//
//  Created by Richard Jung on 14.11.2013.
//  Copyright (c) 2013 Jung IT. All rights reserved.
//
#import <Foundation/Foundation.h>

enum JTHttpAPIRequestMethod {
    
    JTHttpAPIRequestMethodGET = 1,
    JTHttpAPIRequestMethodPOST = 2,
    JTHttpAPIRequestMethodPUT = 3,
    JTHttpAPIRequestMethodDELETE = 4,
    JTHttpAPIRequestMethodHEAD = 5,
    
} JTHttpAPIRequestMethod;

enum JTHttpAPIRequestError {
    
    JTHttpAPIRequestErrorResponse = -1,
    JTHttpAPIRequestErrorConnection = -2,
    JTHttpAPIRequestErrorParsing = -3,
    
} JTHttpAPIRequestError;

@interface JTHttpAPIRequest : NSObject

@property (readonly) NSString *endpoint;
@property (readonly) NSURL *endpointURL;
@property (readonly) enum JTHttpAPIRequestMethod *method;
@property (readonly) NSString *methodString;

@property (assign) BOOL synchronous;

+ (APIRequest *)requestWithEndpoint:(NSString *)endpoint method:(enum JTHttpAPIRequestMethod *)method;

#pragma mark - Initialization
- (id)initWithEndpoint:(NSString *)endpoint method:(enum JTHttpAPIRequestMethod *)method;


#pragma mark - Actions
- (void)send;

@end
