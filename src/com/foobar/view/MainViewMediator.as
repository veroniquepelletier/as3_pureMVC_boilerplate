package com.foobar.view
{
	import com.foobar.model.*;
	import com.foobar.model.LocalisationProxy;
	import com.foobar.view.component.TerrasseView;
	import com.foobar.view.component.NavigationBarView;
	import com.foobar.view.component.VideoPlayerView;
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class MainViewMediator extends Mediator implements IMediator
	{
		public static const NAME:String                         = 'TerrasseViewMediator';
		
		private var _mainView:MainView;
		
		public function TerrasseViewMediator(viewComponent:Object=null)
		{
			super( NAME, viewComponent);
		}
		
		override public function onRegister():void
		{
			_mainView = new MainView();
			_mainView.addEventListener( MainView.CLICKED, handleViewClicked, false, 0, true );
			_mainView.init(
				dataProxy.vo.swfArray[0],
			);
			viewComponent.addChild( _MainView );
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				MainView.SHOW,
				MainView.DESTROY
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var name:String = notification.getName();
			var body:Object = notification.getBody();

			switch ( name )
			{
				case MainView.SHOW:
					_mainView.show();
					break
				case MainView.DESTROY:
					_mainView.destroy();
					break;
			}
		}
		
		private function handleViewClicked(e:DataEvent):void
		{
			sendNotification( MainView.CLICKED, { index: e.data } );
		}
		
		private function get dataProxy():DataProxy
		{
			return facade.retrieveProxy( DataProxy.NAME ) as DataProxy;
		}
		
	}
}