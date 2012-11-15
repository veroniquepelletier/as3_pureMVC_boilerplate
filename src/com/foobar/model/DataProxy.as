package com.foobar.model
{  
	import com.foobar.model.vo.DataVO;
	
	import flash.display.MovieClip;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.SecurityErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	import flash.utils.setTimeout;
	import flash.display.Loader;
	import flash.events.HTTPStatusEvent;

	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class DataProxy extends Proxy implements IProxy 
	{     
		
		public static const NAME:String                     = 'DataProxy';  
		public static const DATA_MAIN_VIEW:String 			= "dataMainView";
		
		private var _loader:LvlLoader;
		
		public function DataProxy()  
		{         
			super( NAME, new DataVO() ); 
		}  
		
		public function get vo():DataVO 
		{     
			return data as DataVO;  
		} 
		
		
		public function swfsDataGet(dataName:String):void
		{

			var request:URLRequest = new URLRequest();
			var notification:String;
			
			if (_loader)
			{
				// TOTO :: DOES NOT SEEM TO UNLOAD PROPERLY!
				_loader.unloadAndStop();
				_loader = null;
				vo.swfArray[0] = null;
				vo.swfArray = [];
			}
			
			_loader = new LvlLoader();
			
			switch(dataName) {
				case DATA_MAIN_VIEW : 
					request.url = vo.dataTerrasse;
					notification = TerrasseView.DATA_READY;
					break;	
			}
			
			_loader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, handleProgress );
			_loader.contentLoaderInfo.addEventListener( Event.COMPLETE, function( loadingEvent:Event ) :void 
			{
				handleGameDataGetComplete( loadingEvent, notification );
			})

			_loader.load(request)
		}
		
		private function handleGameDataGetComplete(loadingEvent:Event, notification:String) :void 
		{
			vo.swfArray.push( loadingEvent.currentTarget.content );
			sendNotification( notification );
			
		}	

	
		private function handleProgress(e:ProgressEvent):void
		{
			sendNotification( ProgressView.UPDATE, { percent: Math.round( ( e.bytesLoaded / e.bytesTotal ) * 100 ) } );
		}
		
		protected function onHTTPError(e:HTTPStatusEvent):void{ 
			trace("HTTPError ::"+e.status); 
		} 
		
		private function handleError(error:Error) :void
		{
			trace("Unable to load requested document." +error); 
		}

	}
}