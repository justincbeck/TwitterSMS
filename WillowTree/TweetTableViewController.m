//
//  TweetTableViewController.m
//  WillowTree
//
//  Created by Justin Beck on 10/16/11.
//  Copyright (c) 2011 BeckProduct. All rights reserved.
//

#import "TweetTableViewController.h"

#import <SBJson/SBJson.h>
#import <RestKit/RestKit.h>

@implementation TweetTableViewController

- (void) loadView
{
    UITableView *tweetView = [[UITableView alloc] initWithFrame:CGRectZero];
    [tweetView setBackgroundColor:[UIColor whiteColor]];
    
    [self setTableView:tweetView];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        tweetData = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([tweetData count] == 0)
    {
        RKClient *client = [RKClient clientWithBaseURL:@"http://api.twitter.com/1/statuses/user_timeline.json"];
        [client get:@"?screen_name=willowtreeapps&count=100" delegate:self];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [tweetData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    if ([tweetData count] != 0)
    {
        [[cell textLabel] setText:[[tweetData objectAtIndex:[indexPath row]] valueForKey:@"text"]];
        [[cell textLabel] setFont:[UIFont fontWithName:@"Helvetica" size:12.0]];
        [[cell textLabel] setLineBreakMode:UILineBreakModeWordWrap];
        [[cell textLabel] setNumberOfLines:0];
    }
    
    return cell;
}

#pragma mark - RestKit delegate

- (void)request:(RKRequest *)request didLoadResponse:(RKResponse *)response
{
    SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
    tweetData = [jsonParser objectWithString:[response bodyAsString] error:nil];
    
    [[self tableView] reloadData];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
	if([MFMessageComposeViewController canSendText])
	{
		[controller setBody:[[tweetData objectAtIndex:[indexPath row]] valueForKey:@"text"]];
		[controller setMessageComposeDelegate:self];
		[self presentModalViewController:controller animated:YES];
	}
}

#pragma mark - Message view delegate

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    // TODO: Need some flow control here
	[self dismissModalViewControllerAnimated:YES];
}

@end
