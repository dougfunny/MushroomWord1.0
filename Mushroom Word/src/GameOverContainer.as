package  
{
	import flash.display.Screen;
	import flash.events.TimerEvent;
	import flash.media.SoundMixer;
	import flash.net.SharedObject;
	import flash.utils.Timer;
	
	import events.NavigationEvent;
	
	import objects.GameFont;
	
	import screens.InGame;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.VAlign;
	
	public class GameOverContainer extends Sprite
	{	 
		
		private var ScoreText:TextField;
		private var Score:objects.GameFont;
		/** Background image. */
		private var bg:Quad;
		
		/** Message text field. */
		private var messageText:TextField;
		
		/** Score container. */
		private var scoreContainer:Sprite;
		
		/** Score display - distance. */
		private var distanceText:TextField;
		
		/** Score display - score. */
		private var scoreText:TextField;
		
		/** Play again button. */
		private var playAgainBtn:Button;
		
		/** Main Menu button. */
		private var mainBtn:Button;
		
		/** About button. */
		private var aboutBtn:Button;
		
		/** Font - score display. */
		private var fontScore:GameFont;;
		
		/** Font - message display. */
		private var fontMessage:GameFont;;
		
		/** Score value - distance. */
		private var _distance:int;
		
		/** Score value - score. */
		private var _score:int;
		
		private var image:Image;
		private var _gameOver:Boolean;
		private var menuFly:MovieClip;
		private var PointTimer:Timer;
		private var PointTime:int;
		
		public function GameOverContainer(gameOver)
		{
			super();
	
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this._gameOver = gameOver;
		}
		
		/**
		 * On added to stage. 
		 * @param event
		 * 
		 */
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			save();
			
			
			drawGameOver(_gameOver);
		}
		private function save():void
		{
			// Get the shared object.
			var so:SharedObject = SharedObject.getLocal("myApp");
			
			// Update the age variable.
			so.data['age'] = int(so.data['age']) + _score;
			
			// And flush our changes.
			so.flush();
			
			// Also, indicate the value for debugging.
			trace("Saved generation " + so.data['age']);
			load();
		}
		
		private function load():void
		{
			// Get the shared object.
			var so:SharedObject = SharedObject.getLocal("myApp");
			// And indicate the value for debugging.
			trace("Loaded generation " + so.data['age']);
		}
		
		
		/**
		 * Draw game over screen. 
		 * 
		 */
		private function drawGameOver(_gameOver):void
		{	
			// Get fonts for text display.
			fontMessage = Fonts.getFont("ScoreValue");
			fontScore = Fonts.getFont("ScoreValue");
			
			if(_gameOver){
			// Background quad.
			bg = new Quad(stage.stageWidth, stage.stageHeight, 0x000000);
			bg.alpha = 0.85;
		 
			this.addChild(bg);
			
			
			Score = Fonts.getFont("ScoreValue");
			ScoreText = new TextField(250, 100, "", Score.fontName, 35,0xE8E8E8   );
			ScoreText.x =620;
			ScoreText.y =80;
			this.addChild(ScoreText);
			image = new Image(Assests.getAtlas().getTexture("level"));
	        image.x = 200;
			this.addChild(image);
			
			
		//	playAgainBtn = new Button(Assests.getAtlas().getTexture("clickhere"));
			//playAgainBtn.x = 250;
		//	playAgainBtn.y = 550;
		 
		//	playAgainBtn.addEventListener(Event.TRIGGERED, onPlayAgainClick);
			//this.addChild(playAgainBtn);
		
		
			
			
			}
			
		
		}
 
		/**
		 * On play-again button click. 
		 * @param event
		 * 
		 */
		private function onPlayAgainClick(event:Event):void
		{	
			//	if (!Sounds.muted) Sounds.sndMushroom.play();
			if (!Sounds.muted) Sounds. sndLevelSelect.play(); 
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "playAgain"}));
		 
		}
		
		
		
		/**
		 * Initialize Game Over container. 
		 * @param _score
		 * @param _distance
		 * 
		 */
		public function initialize(_score:int, _distance:int):void
		{//if (!Sounds.muted) Sounds. sndLevelMainTheme.play(0, 999);
			this._distance = _distance;
			this._score = _score;
			
			//distanceText.text = "TOTAL POINTS" + this._distance.toString();
			ScoreText.text = "TOTAL POINTS " + this._score.toString();
			
			this.alpha = 0;
			this.visible = true;
		 
		}
		
		/**
		 * Score. 
		 * @return 
		 * 
		 */
		public function get score():int { return _score; }
		
		/**
		 * Distance. 
		 * @return 
		 * 
		 */
		public function get distance():int { return _distance; }
	}
}