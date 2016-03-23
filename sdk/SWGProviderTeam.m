#import "SWGProviderTeam.h"

@implementation SWGProviderTeam

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
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"id": @"_id", @"name": @"name", @"nickname": @"nickname", @"description": @"_description", @"email": @"email", @"phone": @"phone", @"avatar": @"avatar", @"auto_assign_route": @"autoAssignRoute", @"auto_assign_sponsor": @"autoAssignSponsor", @"status": @"status", @"type": @"type", @"exclusive": @"exclusive", @"published": @"published", @"published_name": @"publishedName", @"private_label": @"privateLabel", @"brand_color1": @"brandColor1", @"brand_logo_1x": @"brandLogo1x", @"brand_logo_2x": @"brandLogo2x", @"brand_logo_3x": @"brandLogo3x", @"support_email": @"supportEmail", @"support_phone": @"supportPhone", @"support_url": @"supportUrl", @"created": @"created", @"updated": @"updated" }];
}

/**
 * Indicates whether the property with the given name is optional.
 * If `propertyName` is optional, then return `YES`, otherwise return `NO`.
 * This method is used by `JSONModel`.
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  NSArray *optionalProperties = @[@"_id", @"name", @"nickname", @"_description", @"email", @"phone", @"avatar", @"autoAssignRoute", @"autoAssignSponsor", @"status", @"type", @"exclusive", @"published", @"publishedName", @"privateLabel", @"brandColor1", @"brandLogo1x", @"brandLogo2x", @"brandLogo3x", @"supportEmail", @"supportPhone", @"supportUrl", @"created", @"updated"];

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
