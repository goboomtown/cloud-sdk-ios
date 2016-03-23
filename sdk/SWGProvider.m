#import "SWGProvider.h"

@implementation SWGProvider

- (instancetype)init {
  self = [super init];

  if (self) {
    // initalise property's default value, if any
    
  }

  return self;
}


/**
 * Maps json key to property name.
 * This method is used by `JSONModel`.
 */
+ (JSONKeyMapper *)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"id": @"_id", @"name": @"name", @"name_legal": @"nameLegal", @"nickname": @"nickname", @"comm_id": @"commId", @"description": @"_description", @"street_1": @"street1", @"street_2": @"street2", @"city": @"city", @"state": @"state", @"zipcode": @"zipcode", @"latitude": @"latitude", @"longitude": @"longitude", @"default_partners_teams_id": @"defaultPartnersTeamsId", @"email": @"email", @"phone": @"phone", @"website": @"website", @"avatar": @"avatar", @"created": @"created", @"updated": @"updated" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  NSArray *optionalProperties = @[@"_id", @"name", @"nameLegal", @"nickname", @"commId", @"_description", @"street1", @"street2", @"city", @"state", @"zipcode", @"latitude", @"longitude", @"defaultPartnersTeamsId", @"email", @"phone", @"website", @"avatar", @"created", @"updated"];

  if ([optionalProperties containsObject:propertyName]) {
    return YES;
  }
  else {
    return NO;
  }
}

/**
 * Gets the string presentation of the object.
 * This method will be called when logging model object using `NSLog`.
 */
- (NSString *)description {
    return [[self toDictionary] description];
}

@end
