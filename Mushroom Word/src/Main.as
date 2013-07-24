package 
{
	import flash.desktop.NativeApplication;
	import flash.display.Bitmap;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	
	import objects.Game;
	import objects.Letters;
	
	import starling.core.Starling;
	import flash.display.Loader;
	import flash.system.LoaderContext;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display.DisplayObject;
	import starling.display.Image;

	/**
	 * SWF meta data defined for iPad 1 & 2 in landscape mode. 
	 */	
	
	
   [SWF(frameRate="60", width="960", height="640",BackgroundColor="0x000000")]
	//[SWF(frameRate="60", width="1024", height="768",BackgroundColor="0x000000")]
	public class Main extends Sprite
	{
		
		
		private  var LetterBox:Letters;
		private  var myStarling:Starling;
		private var PointTimer:Timer;
		private var PointTime:int;
		private var sprite:MovieClip = new MovieClip();
		private var Background:Bitmap =  new Assests.Background();
	 
		
		private var bgSplash:Bitmap =  new Assests.Background();
 
		
		public function Main( )
			 
		{  
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			//if (!Sounds.muted) Sounds.sndLoadingGame.play();
			// set general properties
			
			// Create a suitable viewport for the screen size.
			// 
			// On the iPhone, the viewPort will fill the complete screen; on the iPad, there
			// will be black bars at the left and right, because it has a different aspect ratio.
			// Since the game is scaled up a little, it won't be as perfectly sharp as on the 
			// iPhone. Alernatively, you can exchange this code with the one used in the Starling
			// demo: it does not scale the viewPort, but adds bars on all sides.
			
			var screenWidth:int  = stage.fullScreenWidth;
			var screenHeight:int = stage.fullScreenHeight;
			var viewPort:Rectangle = new Rectangle();
			
			
			viewPort.height = screenHeight;
			viewPort.width  =screenWidth;
			
			// While Stage3D is initializing, the screen will be blank. To avoid any flickering, 
			// we display a startup image for now, but will remove it when Starling is ready to go.
			//
			// (Note that we *cannot* embed the "Default*.png" images, because then they won't
			//  be copied into the package any longer once they are embedded.) 
			
			var startupImage:MovieClip = createStartupImage(viewPort, screenWidth > 320);
			addChild(startupImage);
			
			
			
			myStarling = new Starling(Game, stage, null, null, "auto", "baseline");
			myStarling.antiAliasing = 10;
			
			
			myStarling.stage3D.addEventListener(Event.CONTEXT3D_CREATE, function(e:Event):void 
			{
				// Starling is ready! We remove the startup image and start the game.
				removeChild(startupImage);
				myStarling.start();
			});
			
			// When the game becomes inactive, we pause Starling; otherwise, the enter frame event
			// would report a very long 'passedTime' when the app is reactivated. 
			
			NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, 
				function (e:Event):void { myStarling.start(); });
			
			NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, 
				function (e:Event):void { myStarling.stop(); });
		}
		
	 
		
		private function createStartupImage(viewPort:Rectangle, isHD:Boolean):MovieClip
		{
			var sprite:MovieClip = new MovieClip();
			
			var Background:Bitmap = isHD ?
				new Assests.BackgroundLogo() : new Assests.BackgroundLogo();
			
			
			Background.smoothing = true;
			sprite.addChild(Background);
			sprite.x =300;
			sprite.y = 300;
			
			
			return sprite;
		}
		
		
		
		
		
		
	}
}