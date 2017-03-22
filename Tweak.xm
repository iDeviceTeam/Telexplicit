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
    NSString *alreadyRun = @"already_run1.0";
    if ([validate boolForKey:alreadyRun])  
    return;
    [validate setBool:YES forKey:alreadyRun];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Telexplicit"
    message:@"A tweak by @iDeviceTeam" delegate:self cancelButtonTitle:@"Close"
    otherButtonTitles:@"Follow @iDeviceTeam", nil];
    [alert show];
    [alert release];
    %new
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
       if(buttonIndex !=alertView.cancelButtonIndex) 
{ 
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=iDevice_Team"]];                                                                              
        }
}

%end