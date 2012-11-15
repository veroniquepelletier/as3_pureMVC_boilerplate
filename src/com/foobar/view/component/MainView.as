package com.foobar.view.component
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.MouseEvent;
	
	
	public class MainView extends MovieClip 
	{    
		
		
		public static const NAME:String                         = 'TerrasseView';
		
		public static const DATA_GET:String                     = NAME + 'DataGet';
		public static const DATA_READY:String                   = NAME + 'DataReady';
		public static const SHOW:String                         = NAME + 'Show';
		public static const DESTROY:String                      = NAME + 'Destroy';
		public static const CLICKED:String                      = NAME + 'Clicked';
		
		private var _view:MovieClip; 
		
		public function init(view:MovieClip):void
		{
			_view = view;
		}
		
		public function show():void
		{
			addChild(_view) as MovieClip;
		}
		

		public function destroy():void
		{
			removeChild(_view);
		}
		
		
		private function addListeners():void
		{
			
		}
	}
	
}