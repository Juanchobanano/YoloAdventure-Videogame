//
//  Released by YoYo Games Ltd. on 17/04/2014. Intended for use with GM: S EA97 and above ONLY.
//  Copyright YoYo Games Ltd., 2014.
//  For support please submit a ticket at help.yoyogames.com
//
//


package ${YYAndroidPackageName};



import ${YYAndroidPackageName}.RunnerActivity;
import com.yoyogames.runner.RunnerJNILib;
import com.jirbo.adcolony.*;
import android.util.Log;
import com.yoyogames.runner.RunnerJNILib;

public class AdColonyExt implements AdColonyAdListener, AdColonyAdAvailabilityListener,AdColonyV4VCListener
{
	AdColonyV4VCAd v4vc_ad;
	int EVENT_OTHER_SOCIAL = 70;
	boolean video_available=false;
	boolean v4vc_available=false;
	String v4vc_zoneid;
	String video_zoneid;
	
	public void AdColony_Init(String _app_id,String zone_id,String c)
	{
		final String app_id = _app_id;
		final String [] Zones = new String[2];
		Zones[0] = zone_id;
		Zones[1] = c;
		
		video_zoneid = zone_id;
		v4vc_zoneid = c;
		
	//og.i("yoyo","Initialising AdColony with activity "+RunnerActivity.CurrentActivity);
	RunnerActivity.ViewHandler.post( new Runnable() {
			public void run() {
			AdColony.configure(RunnerActivity.CurrentActivity,"version:1.0,store:google",app_id,Zones);
			AdColony.addAdAvailabilityListener( AdColonyExt.this );
			AdColony.addV4VCListener( AdColonyExt.this );
		 }
		 });
	}
	
	public void AdColony_ShowVideo(String _a)
	{
		final String a = _a;
		Log.i("yoyo","Show Video with key "+a);
		
		RunnerActivity.ViewHandler.post( new Runnable() {
			public void run() {
				AdColonyVideoAd ad = new AdColonyVideoAd( a ).withListener(AdColonyExt.this );
				ad.show();
			}
		});
		
		
	}
	public double AdColony_VideoAvailable()
	{
		if(video_available)
			return 1.0;
		
		return 0;
	}
	
	public double AdColony_V4VCAvailable()
	{
		if(v4vc_available)
			return 1.0;
		
		return 0;
	}
	
	
	public void AdColony_ShowVideoForV4VC(String _a)
	{
		final String a = _a;
		Log.i("yoyo","Show Video for V4VC for key "+a);
		RunnerActivity.ViewHandler.post( new Runnable() {
			public void run() {
				v4vc_ad = new AdColonyV4VCAd( a ).withListener( AdColonyExt.this ).withConfirmationDialog().withResultsDialog();
				v4vc_ad.show();
			}
		});
	}
	
	
	 //Ad Started Callback - called only when an ad successfully starts playing
	  public void onAdColonyAdStarted( AdColonyAd ad )
	  {
		Log.i("yoyo", "onAdColonyAdStarted");
	  }

	  //Ad Attempt Finished Callback - called at the end of any ad attempt - successful or not.
	  public void onAdColonyAdAttemptFinished( AdColonyAd ad )
	  {
		// You can ping the AdColonyAd object here for more information:
		// ad.shown() - returns true if the ad was successfully shown.
		// ad.notShown() - returns true if the ad was not shown at all (i.e. if onAdColonyAdStarted was never triggered)
		// ad.skipped() - returns true if the ad was skipped due to an interval play setting
		// ad.canceled() - returns true if the ad was cancelled (either programmatically or by the user)
		// ad.noFill() - returns true if the ad was not shown due to no ad fill.
		  
		Log.i("yoyo", "onAdColonyAdAttemptFinished");
	  }
	
	  
	public void onAdColonyV4VCReward( AdColonyV4VCReward reward )
	{
		if (reward.success())
		{
		  //string vc_name = reward.name();
			Log.i("yoyo","Awarding " +reward.amount() + " of " + reward.name()); 
		  
		  	String [] keys ={"id"};
			
			double [] dvals ={(double)101};

			int dsmapindex = RunnerJNILib.jCreateDsMap(keys,null,dvals);
			
		
			//RunnerJNILib.DsMapAdd_Double(dsmapindex,"id",(double)e_achievement_our_info);
			RunnerJNILib.DsMapAddString(dsmapindex,"currname", reward.name());
			RunnerJNILib.DsMapAddDouble(dsmapindex,"curramount",reward.amount());
			
			RunnerJNILib.CreateAsynEventWithDSMap(dsmapindex,EVENT_OTHER_SOCIAL);
		}
		else
		{
			Log.i("yoyo","onAdColonyV4VCReward called but without reward success");
		}
	}
  
 
  

  // Ad Availability Change Callback - update button text
  public void onAdColonyAdAvailabilityChange(boolean available, String zone_id) 
  {
	Log.i("yoyo","onAdColonyAdAvailabilityChange " + available + " in zone " + zone_id);
	//if (available) button_text_handler.post(button_text_runnable);
	
	if(zone_id==v4vc_zoneid)
		v4vc_available=available;
	else if(zone_id==video_zoneid)
		video_available=available;
	else
		Log.i("yoyo","Unknown zone id returned in availability change");
	
  }
	
}


