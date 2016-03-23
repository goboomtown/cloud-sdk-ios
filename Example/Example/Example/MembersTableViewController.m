//
//  MembersTableViewController.m
//  Example
//
//  Created by Larry Borsato on 2016-03-23.
//  Copyright © 2016 Boomtown. All rights reserved.
//

#import "MembersTableViewController.h"
#import "SWGProvidersApi.h"
#import "SWGApiClient.h"

@interface MembersTableViewController ()

@property (nonatomic, strong)	NSMutableArray	*members;

@end

@implementation MembersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.members = [[NSMutableArray alloc] init];
    
	[SWGConfiguration sharedConfig].apiToken  = @"SET API TOKEN HERE";
	[SWGConfiguration sharedConfig].apiSecret = @"SET API SECRET HERE";
	
	[self getProvider];
	
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) getProvider
{
	[[SWGProvidersApi sharedAPI] getProviderWithCompletionHandler:^(SWGProviderResponse *output, NSError *error) {
		if ( error != nil )
		{
			[self showErrorMessage:error];
		}
		else
		{
			if ( output.totalCount > 0 )
			{
				SWGProvider *provider = output.results[0];
				NSString *name = provider.name;
				self.title = name;
				[self getMembers];
			}
		}
	}];
}


- (void)getMembers
{
	[[SWGProvidersApi sharedAPI] getProviderMembersWithCompletionHandler:^(SWGMemberResponse *output, NSError *error) {
		if ( error != nil )
		{
			[self showErrorMessage:error];
		}
		else
		{
			if ( output.totalCount > 0 )
			{
				[self.members removeAllObjects];
				for ( SWGMember *member in output.results )
				{
					[self.members addObject:member];
				}
				[self.tableView reloadData];
			}
		}
	}];
}


- (void)showErrorMessage:(NSError *)error
{
	NSDictionary *userInfo = error.userInfo;
	NSDictionary *response = userInfo[@"SWGResponseObject"];
	if ( response!=nil && [response isKindOfClass:[NSDictionary class]] )
	{
		NSString *message = response[@"message"];
		if ( message != nil )
		{
			UIAlertController *alertController = [UIAlertController
												  alertControllerWithTitle:NSLocalizedString(@"Warning",nil)
												  message:NSLocalizedString(message, nil)
												  preferredStyle:UIAlertControllerStyleAlert];
			UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK action")
															   style:UIAlertActionStyleDefault
															 handler:^(UIAlertAction *action)
									   {
									   }];
			[alertController addAction:okAction];
			[self presentViewController:alertController animated:YES completion:nil];
		}
	}
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.members.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
	SWGMember *member = self.members[indexPath.row];
	cell.textLabel.text = member.name;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
