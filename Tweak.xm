%hook TGUser 
	- (BOOL)hasExplicitContent {
		return false;
	}
%end

%hook TGConversation 
	- (BOOL)hasExplicitContent {
		return false;
	}
%end

%hook TGAppDelegate

- (void)applicationDidBecomeActive:(id)application {
	NSUserDefaults *validate = [NSUserDefaults standardUserDefaults];
	NSString *alreadyRun = @"already_run1.2";
	if ([validate boolForKey:alreadyRun])  
	return;
	[validate setBool:YES forKey:alreadyRun];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Telexplicit"
	message:@"A tweak by iDeviceTeam" delegate:self cancelButtonTitle:@"Close"
	otherButtonTitles:@"Follow @iDevice_Team", nil];
	[alert show];
	[alert release];
	%new
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

       if(buttonIndex !=alertView.cancelButtonIndex)

{

        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://"]]) {

    		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=iDevice_Team"]];
    	
    	}

		else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot://"]]) {

			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tweetbot://iDevice_Team/user_profile/iDevice_Team"]];

		}
		
		else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific://"]]) {

			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitterrific://profile?screen_name=iDevice_Team"]];

		}

		else {

			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.twitter.com/iDevice_Team"]];

		}

}
}

%end