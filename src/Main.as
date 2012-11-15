package
{
	import ApplicationFacade;
	import com.foobar.debug.ExceptionManager;
	import com.foobar.debug.FreeDebugPanel;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import com.lvlstudio.utils.Global;
	
	[SWF( width='1024', height='768', frameRate='30',backgroundColor='#CCCCCC')]
	
	public class Main extends MovieClip
	{
		public function Main()
		{
			var mc:MovieClip = new MovieClip();
			ApplicationFacade.getInstance().startup( mc );
		}
	}
}