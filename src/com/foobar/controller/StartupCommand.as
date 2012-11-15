package com.foobar.controller
{ 
	import com.lvlstudio.model.*; 
	import com.lvlstudio.view.ApplicationMediator;   
	import flash.display.MovieClip;
	import org.puremvc.as3.interfaces.ICommand;  
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class StartupCommand extends SimpleCommand implements ICommand
	{       
		override public function execute(notification:INotification):void  
		{       
			facade.registerProxy( new DataProxy() ); 
			facade.registerMediator( new ApplicationMediator( notification.getBody() as MovieClip ) );  
		}  
	}
}