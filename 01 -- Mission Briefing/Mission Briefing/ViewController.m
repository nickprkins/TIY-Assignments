//
//  ViewController.m
//  Mission Briefing
//
//  Created by Ben Gohlke on 1/16/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *agentNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *agentPasswordTextField;
@property (strong, nonatomic) IBOutlet UILabel *greetingLabel;
@property (strong, nonatomic) IBOutlet UITextView *missionBriefingTextView;

- (IBAction)authenticateAgent:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //
    // 1. These three UI elements need to be emptied on launch
    //    Hint: there is a string literal that represents empty
    //
    
    self.agentNameTextField.text = nil;
    self.agentPasswordTextField.text = nil;
    self.greetingLabel.text = nil;
    self.missionBriefingTextView.text = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)authenticateAgent:(UIButton *)sender
{
    // This will cause the keyboard to dismiss when the authenticate button is tapped
    if ([self.agentNameTextField isFirstResponder])
    {
        [self.agentNameTextField resignFirstResponder];
    }
    
    //
    // 2. Check whether there is text in BOTH the name and password textfields
    //
    if (![self.agentNameTextField.text isEqualToString:@""] && ![self.agentPasswordTextField.text isEqualToString:@""] )
    {
        //
        // 3. The greetingLabel needs to be populated with the the string "Good evening, Agent #", where # is the last name of
        //    the agent logging in. The agent's full name is listed in the text field, but you need to pull out just the last
        //    name. Open the Apple Documentation and go to the page for NSString. There is a section in the left called "Dividing
        //    Strings". You should be able to find a method that allows you to break up a string using a delimiter. In our case,
        //    the delimiter would be a space character.
        //
        //    NICK NOTES:   I looked at the Apple Documentation and then found on stackoverflow that someone had code to help
        //                  divide text in the textfield by a single space.
        //                  Source: stackoverflow.com/questions/21997062/split-fullname-in-firstname-and-lastname
        // Additional step(s) to remove only the last name
        NSString *agentName = self.agentNameTextField.text;
        NSString *firstName = [[agentName componentsSeparatedByString:@" "] objectAtIndex:0];
        NSString *lastName = [agentName substringFromIndex:[agentName rangeOfString:firstName].length + 1];
        NSString *specialGreeting = [[@"GOOD EVENING, AGENT " stringByAppendingString:lastName] stringByAppendingString:@"!"];
        self.greetingLabel.text = specialGreeting;
        
        //
        // 4. The mission briefing textview needs to be populated with the briefing from HQ, but it must also include the last
        //    name of the agent that logged in. You will notice in the text a "%@" string after the word "Agent". This
        //    instructs the system to replace the "%@" with an actual value at runtime. Perhaps you could use the text in the
        //    textfield to get the agent's last name.
        //
        //    Set the textview text property to the paragraph in "MissionBriefing.txt"
        //
        //    NICK NOTES: found stringByAppendingString and was able to figure out how to bring the strings and the lastName
        //    variable together.
        //
        
        NSString *fullMissionText = [[@"This mission will be an arduous one, fraught with peril. You will cover much strange and unfamiliar territory. Should you choose to accept this mission, Agent " stringByAppendingString:lastName] stringByAppendingString:@", you will certainly be disavowed, but you will be doing your country a great service. This message will self destruct in 5 seconds."];
        self.missionBriefingTextView.text = fullMissionText;
        
        //
        // 5. The view's background color needs to switch to green to indicate a successful login by the agent.
        //
        //    The color's RGB value is Red: 0.585, Green: 0.78, Blue: 0.188 with an alpha of 1. There is a class method on the
        //    UIColor class that returns a color object with custom defined RGBA values. Open the documentation and look for a
        //    method on UIColor that can take red, green, blue and alpha values as arguments.
        //
        //    Once you have the color object, you should be able to set the view's background color to this object.
        //
        
        self.view.backgroundColor = [UIColor colorWithRed:0.585 green:0.78 blue:0.188 alpha:1.0];
        self.missionBriefingTextView.backgroundColor = [UIColor colorWithRed:0.585 green:0.78 blue:0.188 alpha:1.0];

        // Additional step to set the above color object to self.view's background color
        
    }
    else
    {
        //
        // 6. The view's background color needs to switch to red to indicate a failed login by the agent.
        //
        //    The color's RGB value is Red: 0.78, Green: 0.188, Blue: 0.188 with an alpha of 1. There is a class method on the
        //    UIColor class that returns a color object with custom defined RGBA values. Open the documentation and look for a
        //    method on UIColor that can take red, green, blue and alpha values as arguments.
        //
        //    Once you have the color object, you should be able to set the view's background color to this object.
        //
        self.view.backgroundColor = [UIColor colorWithRed:0.78 green:0.188 blue:0.188 alpha:1.0];
        self.missionBriefingTextView.backgroundColor = [UIColor colorWithRed:0.78 green:0.188 blue:0.188 alpha:1.0];
        
        // Additional step to set the above color object to self.view's background color
    }
}

@end