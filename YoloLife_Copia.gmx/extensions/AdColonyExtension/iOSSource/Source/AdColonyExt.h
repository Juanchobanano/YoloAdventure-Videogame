//
//  AdColonyExt.h
//  iPad_Runner
//
//  Created by Fritz on 05/03/2013.
//
//

#import <Foundation/Foundation.h>
#import <AdColony/AdColony.h>


@interface AdColonyExt:NSObject<AdColonyAdDelegate,AdColonyDelegate>

- (void) AdColony_Init:(char *) arg1 Arg2:(char*)arg2 Arg3:(char *)arg3;
- (void) AdColony_ShowVideo:(char*) arg1;
- (void) AdColony_ShowVideoForV4VC:(char*) arg1;
- (double) AdColony_VideoAvailable;
- (double) AdColony_V4VCAvailable;

@end
