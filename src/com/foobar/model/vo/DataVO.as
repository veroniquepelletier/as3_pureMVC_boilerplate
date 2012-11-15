package com.foobar.model.vo
{  
	import com.lvlstudio.utils.Global;

	public class DataVO 
	{   
		private var path:String 								= 'assets' + '/' + 'swf' + '/';
		
		// data
		public var urlsArray:Array                              = [ ];
		public var urlsDataArray:Array                          = [ ];
		public var swfArray:Array								= [ ];
		public var progressView:Array							= [ ];
		public var navigationBar:Array							= [ ];
		public var dataURL:String                               = '';  
		// SWF
		public var dataMainView:String                         	= path + 'MainView.swf'; 
	}
}