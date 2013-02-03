//
//  AppDelegate.m
//  Ratings
//
//  Created by Brian Crider on 1/25/13.
//  Copyright (c) 2013 Brian Crider. All rights reserved.
//

#import "AppDelegate.h"
#import "Player.h"
#import "PlayersViewController.h"

@implementation AppDelegate
{
    NSMutableArray *players;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Initiliaze the array to an array of up to 20 elements
	players = [NSMutableArray arrayWithCapacity:20];
	Player *player = [[Player alloc] init];     // Java: Player[] player = new Player()[20];

    // Populate the players array
    player.name = @"Bill Evans";
	player.game = @"Tic-Tac-Toe";
	player.rating = 4;
	[players addObject:player];
	player = [[Player alloc] init];
	player.name = @"Oscar Peterson";
	player.game = @"Spin the Bottle";
	player.rating = 5;
	[players addObject:player];
	player = [[Player alloc] init];
	player.name = @"Dave Brubeck";
	player.game = @"Texas Hold’em Poker";
	player.rating = 2;
	[players addObject:player];
    
    ////////////////////////////////////////////////////////////
    //  Yikes, what is that?! We want to assign the players array to the players property of PlayersViewController so it can use this array for its data source. But the app delegate doesn’t know anything about PlayersViewController yet, so it will have to dig through the storyboard to find it.

    //  This is one of the limitations of storyboards that I find annoying. With Interface Builder you always had a reference to the App Delegate in your MainWindow.xib and you could make connections from your top-level view controllers to outlets on the App Delegate. That is currently not possible with storyboards. You cannot make references to the app delegate from your top-level view controllers. That’s unfortunate, but we can always get those references programmatically.
    ////////////////////////////////////////////////////////////
    
    // We know that the storyboard’s initial view controller is a Tab Bar Controller, so we can look up the window’s rootViewController and cast it.
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    
    // The PlayersViewController sits inside a navigation controller in the first tab, so we look up that UINavigationController object
	UINavigationController *navigationController = [[tabBarController viewControllers] objectAtIndex:0];
    
    // then ask it for its root view controller, which is the PlayersViewController that we are looking for
	PlayersViewController *playersViewController = [[navigationController viewControllers] objectAtIndex:0];
    
    // finally set the array to the controller
	playersViewController.players = players;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
