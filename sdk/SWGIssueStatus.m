#import "SWGIssueStatus.h"

@implementation SWGIssueStatus

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"created": @"created", @"type": @"type", @"status": @"status", @"resolution": @"resolution", @"scheduled_time": @"scheduledTime", @"ticketSummaryText": @"ticketSummaryText", @"historySummaryText": @"historySummaryText" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  NSArray *optionalProperties = @[@"created", @"type", @"status", @"resolution", @"scheduledTime", @"ticketSummaryText", @"historySummaryText"];

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
