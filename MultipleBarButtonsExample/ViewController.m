//
//  ViewController.m
//  MultipleBarButtonsExample
//
//  Created by Eu on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)barButtonClicked:(UIBarButtonItem *)item
{
    UIAlertView* view = [[UIAlertView alloc] initWithTitle:@"Alert" message:item.title
                                                  delegate:nil cancelButtonTitle:@"OK"
                                         otherButtonTitles:nil];
    if (!item.title) {
        view.message = @"Custom View or System Item";
    }
    [view show];
    [view release];
}

- (void)setupNavigationItems
{
    NSMutableArray* buttons = [NSMutableArray arrayWithCapacity:2];

    // Add buttons to the array
    UIBarButtonItem* bi;
    bi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                       target:self
                                                       action:@selector(barButtonClicked:)];
    [buttons addObject:bi];
    [bi release];

    bi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
                                                       target:self
                                                       action:@selector(barButtonClicked:)];
    [buttons addObject:bi];
    [bi release];

    // Cria um Flexible Space à equerda para alinhar os botões
    bi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                       target:nil action:nil];
    [buttons insertObject:bi atIndex:0];
    [bi release];

    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 103, 44.01)];
    toolbar.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    toolbar.clearsContextBeforeDrawing = NO;
    toolbar.tintColor = self.navigationController.navigationBar.tintColor;
    toolbar.barStyle = -1; // Limpa o background

    [toolbar setItems:buttons animated:NO];
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithCustomView:toolbar] autorelease];

    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Some Title"
                                                                              style:UIBarButtonItemStyleBordered
                                                                             target:self
                                                                             action:@selector(barButtonClicked:)] autorelease];
    [toolbar release];
}

- (NSString *)title
{
    return @"Main";
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setupNavigationItems];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
