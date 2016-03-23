#import "SWGMerchantsApi.h"
#import "SWGQueryParamCollection.h"
#import "SWGMemberCreateResponse.h"
#import "SWGError.h"
#import "SWGMemberCreateRequest.h"
#import "SWGMemberResponse.h"
#import "SWGMemberUserResponse.h"
#import "SWGMemberLocationResponse.h"
#import "SWGEnumerationItemResponse.h"


@interface SWGMerchantsApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SWGMerchantsApi

static SWGMerchantsApi* singletonAPI = nil;

#pragma mark - Initialize methods

- (id) init {
    self = [super init];
    if (self) {
        SWGConfiguration *config = [SWGConfiguration sharedConfig];
        if (config.apiClient == nil) {
            config.apiClient = [[SWGApiClient alloc] init];
        }
        self.apiClient = config.apiClient;
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id) initWithApiClient:(SWGApiClient *)apiClient {
    self = [super init];
    if (self) {
        self.apiClient = apiClient;
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -

+(SWGMerchantsApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {

    if (singletonAPI == nil) {
        singletonAPI = [[SWGMerchantsApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(SWGMerchantsApi*) sharedAPI {

    if (singletonAPI == nil) {
        singletonAPI = [[SWGMerchantsApi alloc] init];
    }
    return singletonAPI;
}

-(void) addHeader:(NSString*)value forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(void) setHeaderValue:(NSString*) value
           forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(unsigned long) requestQueueSize {
    return [SWGApiClient requestQueueSize];
}

#pragma mark - Api Methods

///
/// Creates a new Merchant
/// Creates a *Merchant* and optionally *MerchantLocation* and *MerchantUser*
///  @param body The *Merchant* to create 
///
///  @returns SWGMemberCreateResponse*
///
-(NSNumber*) createMemberWithBody: (SWGMemberCreateRequest*) body
    completionHandler: (void (^)(SWGMemberCreateResponse* output, NSError* error)) handler {

    
    // verify the required parameter 'body' is set
    if (body == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `body` when calling `createMember`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/members/create"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"X-Boomtown-Date", @"X-Boomtown-Signature", @"X-Boomtown-Token"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    
    bodyParam = body;
    

    
    return [self.apiClient requestWithPath: resourcePath
                                    method: @"POST"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMemberCreateResponse*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((SWGMemberCreateResponse*)data, error);
                           }
          ];
}

///
/// Returns a Merchant
/// Returns a *Merchant*
///  @param memberId The primary key of the *Merchant* 
///
///  @returns SWGMemberResponse*
///
-(NSNumber*) getMemberWithMemberId: (NSString*) memberId
    completionHandler: (void (^)(SWGMemberResponse* output, NSError* error)) handler {

    
    // verify the required parameter 'memberId' is set
    if (memberId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `memberId` when calling `getMember`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/members/get/{member_id}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (memberId != nil) {
        pathParams[@"member_id"] = memberId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"X-Boomtown-Date", @"X-Boomtown-Signature", @"X-Boomtown-Token"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMemberResponse*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((SWGMemberResponse*)data, error);
                           }
          ];
}

///
/// Returns a collection of MerchantUsers
/// Returns a collection of *MerchantUsers* belonging to a *MerchantLocation*
///  @param memberId The primary key of the *Merchant* 
///
///  @returns SWGMemberUserResponse*
///
-(NSNumber*) getMemberLocationUsersWithMemberId: (NSString*) memberId
    completionHandler: (void (^)(SWGMemberUserResponse* output, NSError* error)) handler {

    
    // verify the required parameter 'memberId' is set
    if (memberId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `memberId` when calling `getMemberLocationUsers`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/members/location/users/{member_id}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (memberId != nil) {
        pathParams[@"member_id"] = memberId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"X-Boomtown-Date", @"X-Boomtown-Signature", @"X-Boomtown-Token"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMemberUserResponse*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((SWGMemberUserResponse*)data, error);
                           }
          ];
}

///
/// Returns a collection of MerchantLocations
/// Returns a collection of *MerchantLocation* records belonging to a *Merchant*
///  @param memberId The primary key of the *Merchant* 
///
///  @param membersLocationsId An optional members_locations_id to filter the results with (optional)
///
///  @returns SWGMemberLocationResponse*
///
-(NSNumber*) getMemberLocationsWithMemberId: (NSString*) memberId
    membersLocationsId: (NSString*) membersLocationsId
    completionHandler: (void (^)(SWGMemberLocationResponse* output, NSError* error)) handler {

    
    // verify the required parameter 'memberId' is set
    if (memberId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `memberId` when calling `getMemberLocations`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/members/location/get/{member_id}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (memberId != nil) {
        pathParams[@"member_id"] = memberId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (membersLocationsId != nil) {
        
        queryParams[@"members_locations_id"] = membersLocationsId;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"X-Boomtown-Date", @"X-Boomtown-Signature", @"X-Boomtown-Token"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMemberLocationResponse*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((SWGMemberLocationResponse*)data, error);
                           }
          ];
}

///
/// Returns collection of industries
/// Returns the industries available for a *Merchant*
///  @returns SWGEnumerationItemResponse*
///
-(NSNumber*) getMemberMetaIndustriesWithCompletionHandler: 
    (void (^)(SWGEnumerationItemResponse* output, NSError* error)) handler {

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/members/meta/industries"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"X-Boomtown-Date", @"X-Boomtown-Signature", @"X-Boomtown-Token"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGEnumerationItemResponse*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((SWGEnumerationItemResponse*)data, error);
                           }
          ];
}

///
/// Returns collection of statuses
/// Returns the statuses available for a *Merchant* or *MerchantUsers*
///  @returns SWGEnumerationItemResponse*
///
-(NSNumber*) getMemberMetaStatusesWithCompletionHandler: 
    (void (^)(SWGEnumerationItemResponse* output, NSError* error)) handler {

    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/members/meta/statuses"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"X-Boomtown-Date", @"X-Boomtown-Signature", @"X-Boomtown-Token"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGEnumerationItemResponse*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((SWGEnumerationItemResponse*)data, error);
                           }
          ];
}

///
/// Returnsa a collection of MerchantUsers
/// Returns a collection of *MerchantUser* records belonging to a *Merchant*
///  @param memberId The id of the *Merchant* 
///
///  @param userId Optional user_id to filter the results with (optional)
///
///  @returns SWGMemberUserResponse*
///
-(NSNumber*) getMemberUsersWithMemberId: (NSString*) memberId
    userId: (NSString*) userId
    completionHandler: (void (^)(SWGMemberUserResponse* output, NSError* error)) handler {

    
    // verify the required parameter 'memberId' is set
    if (memberId == nil) {
        [NSException raise:@"Invalid parameter" format:@"Missing the required parameter `memberId` when calling `getMemberUsers`"];
    }
    

    NSMutableString* resourcePath = [NSMutableString stringWithFormat:@"/members/user/get/{member_id}"];

    // remove format in URL if needed
    if ([resourcePath rangeOfString:@".{format}"].location != NSNotFound) {
        [resourcePath replaceCharactersInRange: [resourcePath rangeOfString:@".{format}"] withString:@".json"];
    }

    NSMutableDictionary *pathParams = [[NSMutableDictionary alloc] init];
    if (memberId != nil) {
        pathParams[@"member_id"] = memberId;
    }
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if (userId != nil) {
        
        queryParams[@"user_id"] = userId;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    

    // HTTP header `Accept`
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[@"application/json"]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[@"application/json"]];

    // Authentication setting
    NSArray *authSettings = @[@"X-Boomtown-Date", @"X-Boomtown-Signature", @"X-Boomtown-Token"];

    id bodyParam = nil;
    NSMutableDictionary *formParams = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *localVarFiles = [[NSMutableDictionary alloc] init];
    
    
    

    
    return [self.apiClient requestWithPath: resourcePath
                                    method: @"GET"
                                pathParams: pathParams
                               queryParams: queryParams
                                formParams: formParams
                                     files: localVarFiles
                                      body: bodyParam
                              headerParams: headerParams
                              authSettings: authSettings
                        requestContentType: requestContentType
                       responseContentType: responseContentType
                              responseType: @"SWGMemberUserResponse*"
                           completionBlock: ^(id data, NSError *error) {
                               handler((SWGMemberUserResponse*)data, error);
                           }
          ];
}



@end
