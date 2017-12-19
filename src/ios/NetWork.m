/********* NetWork.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import "BaseNetWorking.h"
@interface NetWork : CDVPlugin {
    // Member variables go here.
}

- (void)request:(CDVInvokedUrlCommand*)command;
@end

@implementation NetWork

- (void)request:(CDVInvokedUrlCommand*)command
{
    NSDictionary* params = [command.arguments objectAtIndex:0];
    NSString *url = [params objectForKey:@"url"];
    NSString *param = [params objectForKey:@"params"];
    //TODO net request
    __block CDVPluginResult* pluginResult = nil;
    [BaseNetWorking POST:url parameters:params progress:nil success:^(id responseObject) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:responseObject];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } failure:^(NSString *errorMsg) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
    
}

@end
