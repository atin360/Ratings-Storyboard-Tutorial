//
//  PlayersViewController.m
//  Ratings
//
//  Created by Brian Crider on 1/25/13.
//  Copyright (c) 2013 Brian Crider. All rights reserved.
//

#import "PlayersViewController.h"
#import "Player.h"
#import "PlayerCell.h"

@interface PlayersViewController ()

@end

@implementation PlayersViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//######################################
#pragma mark - Table view data source
//######################################

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.players count];
}

////////////
// OLD
////////////
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell" forIndexPath:indexPath];
//    
//    // Configure the cell...
//    Player *player = [self.players objectAtIndex:indexPath.row];
//	cell.textLabel.text = player.name;
//	cell.detailTextLabel.text = player.game;
//    
//    return cell;
//}

//###########################################################################
# pragma mark - REPLACEMENT cellForRowAtIndexPath & NEW imageForRating method
//###########################################################################

////////////
// NEW
////////////
//- (UITableViewCell *)tableView:(UITableView *)tableView
//         cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Allows for the cells to be removed from memory as they are scrolled off the screen
//	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];
//    
//    // Instantiate a player object from the players array based on the row being loaded
//	Player *player = [self.players objectAtIndex:indexPath.row];
//    
//    // Provide a variable name for the UILabel with a tag of 100 and set the text value for it
//	UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
//	nameLabel.text = player.name;
//    
//    // Provide a variable name for the UILabel with a tag of 101 and set the text value for it
//	UILabel *gameLabel = (UILabel *)[cell viewWithTag:101];
//	gameLabel.text = player.game;
//    
//    // Provide a variable name for the UIImageView with a tag of 102 and set the image for it via a new method called imageForRating
//	UIImageView * ratingImageView = (UIImageView *)[cell viewWithTag:102];
//	ratingImageView.image = [self imageForRating:player.rating];  // JAVA EQUIVALENT: ratingImageView.image = this.imageForRating(player.rating);
//    return cell;
//}

//////////////////////////////////////////////////////////
// NEWER (after creating a PlayerCell.h and PlayerCell.m)
//////////////////////////////////////////////////////////
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Allows for the cells to be removed from memory as they are scrolled off the screen
	//UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];
    PlayerCell *cell = (PlayerCell *)[tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];
    
    // Instantiate a player object from the players array based on the row being loaded
	Player *player = [self.players objectAtIndex:indexPath.row];
    
    // Provide a variable name for the UILabel with a tag of 100 and set the text value for it
//	UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
//	nameLabel.text = player.name;
    cell.nameLabel.text = player.name;
    
    // Provide a variable name for the UILabel with a tag of 101 and set the text value for it
//	UILabel *gameLabel = (UILabel *)[cell viewWithTag:101];
//	gameLabel.text = player.game;
    cell.gameLabel.text = player.game;
    
    // Provide a variable name for the UIImageView with a tag of 102 and set the image for it via a new method called imageForRating
//	UIImageView * ratingImageView = (UIImageView *)[cell viewWithTag:102];
//	ratingImageView.image = [self imageForRating:player.rating];  // JAVA EQUIVALENT: ratingImageView.image = this.imageForRating(player.rating);
    cell.ratingImageView.image = [self imageForRating:player.rating];
    
    return cell;
}


//
// Method: returns the image based on the player's rating (1-5)
//
- (UIImage *)imageForRating:(int)rating
{
	switch (rating)
	{
		case 1: return [UIImage imageNamed:@"1StarSmall.png"];
		case 2: return [UIImage imageNamed:@"2StarsSmall.png"];
		case 3: return [UIImage imageNamed:@"3StarsSmall.png"];
		case 4: return [UIImage imageNamed:@"4StarsSmall.png"];
		case 5: return [UIImage imageNamed:@"5StarsSmall.png"];
	}
	return nil;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

///////
// NEW
///////
// This method gets called when the delete button (or any editting on the row I think?) gets tapped
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"delete initiated");

	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
        // Hide the stars (USER LESSON)
        NSLog(@"delete tapped");
        
		[self.players removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
