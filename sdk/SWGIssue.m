#import "SWGIssue.h"

@implementation SWGIssue

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"id": @"_id", @"reference_num": @"referenceNum", @"members_id": @"membersId", @"members_name": @"membersName", @"members_email": @"membersEmail", @"members_locations_id": @"membersLocationsId", @"members_locations_name": @"membersLocationsName", @"members_users_id": @"membersUsersId", @"members_users_name": @"membersUsersName", @"members_users_email": @"membersUsersEmail", @"type": @"type", @"category": @"category", @"details": @"details", @"status": @"status", @"job": @"job", @"resolution": @"resolution", @"created": @"created", @"updated": @"updated", @"enroute_time": @"enrouteTime", @"scheduled_time": @"scheduledTime", @"arrival_time": @"arrivalTime", @"departure_time": @"departureTime" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  NSArray *optionalProperties = @[@"_id", @"referenceNum", @"membersName", @"membersEmail", @"membersLocationsName", @"membersUsersName", @"membersUsersEmail", @"type", @"category", @"details", @"status", @"job", @"resolution", @"created", @"updated", @"enrouteTime", @"scheduledTime", @"arrivalTime", @"departureTime"];

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
