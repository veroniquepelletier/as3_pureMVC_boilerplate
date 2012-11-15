package com.foobar.controller
{
	import com.lvlstudio.model.*;
	import com.lvlstudio.view.component.*;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class DataCommand extends SimpleCommand implements ICommand
	{
		
		
		override public function execute(notification:INotification):void
		{
			
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			
			switch ( name )
			{
				
				case MainView.DATA_GET:	
					dataProxy.swfsDataGet(DataProxy.DATA_MAIN_VIEW);
					break;
			}
		}
		
		private function get dataProxy():DataProxy  
		{       
			return facade.retrieveProxy( DataProxy.NAME ) as DataProxy;
		}
		
	}
}