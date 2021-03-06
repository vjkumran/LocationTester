//
//  RegionOptionsViewController.m
//  LocationTester
//
//  Created by Patrice Jaton on 2/19/12.
//  Copyright (c) 2012 Patrice Jaton. All rights reserved.
//

#import "OptionsViewController.h"
#import <CoreLocation/CoreLocation.h>

@implementation OptionsViewController

@synthesize picker = _picker;
@synthesize label = _label;
@synthesize delegate = _delegate;
@synthesize control = _control;
@synthesize message = _message;
@synthesize firstOptions = _firstOptions;
@synthesize secondOptions = _secondOptions;


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self.picker selectRow:self.firstOptions.selected inComponent:0 animated:NO];
    [self.picker selectRow:self.secondOptions.selected inComponent:1 animated:NO];
    [self.label setText:self.message];
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - Picker View Data Source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.firstOptions.size;
    }
    return self.secondOptions.size;
}



#pragma mark - Picker View Delegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [[self.firstOptions.options objectAtIndex:row] label];
    }
    return [[self.secondOptions.options objectAtIndex:row] label];
}



#pragma mark - Picker View Delegate

- (IBAction)apply 
{
    NSInteger firstIndex = [self.picker selectedRowInComponent:0];
    NSInteger secondIndex = [self.picker selectedRowInComponent:1];
    BOOL changed = (firstIndex != self.firstOptions.selected) || (secondIndex != self.secondOptions.selected);
    [self.firstOptions setSelected:firstIndex];
    [self.secondOptions setSelected:secondIndex];
    [self.delegate optionsController:self updatedWithChanges:changed];
}

@end
