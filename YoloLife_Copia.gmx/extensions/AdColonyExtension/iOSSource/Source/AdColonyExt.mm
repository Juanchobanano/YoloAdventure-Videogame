//
//  AdColonyExt.mm
//  iPad_Runner
//
//  Created by Fritz on 06/03/2014.
//
//

#import "AdColonyExt.h"
#import <AdColony/AdColony.h>

const int EVENT_OTHER_SOCIAL = 70;
extern int CreateDsMap( int _num, ... );
extern void CreateAsynEventWithDSMap(int dsmapindex, int event_index);

@implementation AdColonyExt

BOOL v4vc_available=false;
BOOL video_available=false;
NSString *v4vc_zoneid;
NSString *video_zoneid;

- (void) AdColony_Init:(char *) arg1 Arg2:(char*)arg2 Arg3:(char *)arg3
{
	NSString *appid = [NSString stringWithCString:arg1 encoding:NSUTF8StringEncoding];
	NSString *zoneid = [NSString stringWithCString:arg2 encoding:NSUTF8StringEncoding];
	NSString *zoneid2 = [NSString stringWithCString:arg3 encoding:NSUTF8StringEncoding];
	
	[AdColony configureWithAppID:appid
			zoneIDs:@[zoneid,zoneid2]
			delegate:self
			logging:YES];
			
	v4vc_zoneid = zoneid2;
	video_zoneid = zoneid;
}

-(void) AdColony_ShowVideoForV4VC:(char *) arg1
{
	NSString *zoneid = [NSString stringWithCString:arg1 encoding:NSUTF8StringEncoding];
	[AdColony playVideoAdForZone:zoneid withDelegate:self withV4VCPrePopup:YES andV4VCPostPopup:YES];

}

- (void) AdColony_ShowVideo:(char*) arg1
{
	NSString *zoneid = [NSString stringWithCString:arg1 encoding:NSUTF8StringEncoding];
	[AdColony playVideoAdForZone:zoneid withDelegate:self];
}

-(void) onAdColonyAdStartedInZone:(NSString *)zoneID
{
	NSLog(@"Ad Colony ad started");
}

-(void) onAdColonyAdAttemptFinished:(BOOL) shown inZone:(NSString *)zoneID
{
	if(shown)
		NSLog(@"Ad Colony attempt finished with success");
	else
		NSLog(@"Ad Colony attempt failed");
		
}

// Callback activated when a V4VC currency reward succeeds or fails
// This implementation is designed for client-side virtual currency without a server
// It uses NSUserDefaults for persistent client-side storage of the currency balance
// For applications with a server, contact the server to retrieve an updated currency balance

- ( void ) onAdColonyV4VCReward:(BOOL)success currencyName:(NSString*)currencyName currencyAmount:(int)amount inZone:(NSString*)zoneID {
	NSLog(@"AdColony zone %@ reward %i %i %@", zoneID, success, amount, currencyName);
	
	if (success) 
	{
		NSLog(@"V4VC reward succeeded");

		
		int dsMapIndex = CreateDsMap(3,
						"id",(double)101,(void *)NULL,
						"currname",0.0,[currencyName UTF8String],
						"curramount",(double)amount,(void *)NULL
						);
		CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
				
           
		
	} 
	//else {
	//	[[NSNotificationCenter defaultCenter] postNotificationName:kZoneOff object:nil];
	//}
}
- (double) AdColony_VideoAvailable
{
	if(video_available)
		return 1;
	return 0;
}
- (double) AdColony_V4VCAvailable
{
	if(v4vc_available)
		return 1;
	return 0;
}

- ( void ) onAdColonyAdAvailabilityChange:(BOOL)available inZone:(NSString*) zoneID {

	
	if(available)
		NSLog(@"Ad Availability: available in zone %@",zoneID);
	else
		NSLog(@"Ad Availability: not available in zone %@",zoneID);
	
	if([zoneID isEqualToString:v4vc_zoneid])
		v4vc_available=available;
	else if([zoneID isEqualToString:video_zoneid])
		video_available=available;
	else
		NSLog(@"Unknown zone in availability");

	//if(available) {
//		[[NSNotificationCenter defaultCenter] postNotificationName:kZoneReady object:nil];
//	} else {
		//[[NSNotificationCenter defaultCenter] postNotificationName:kZoneLoading object:nil];
//	}
}

@end

