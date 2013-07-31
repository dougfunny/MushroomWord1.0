package 
{
	import flash.media.Sound;
	
 
	public class Sounds
	{
	 		
		[Embed(source="../media/assets/music/pop2a.mp3")]
		public static const SND_Pop_Letter:Class;
		 
		[Embed(source="../media/assets/music/pause.mp3")]
		public static const SND_Pause_Letter:Class;
		 
		
		[Embed(source="../media/assets/music/pointUp.mp3")]
		public static const SND_Score_Letter:Class;
		
		
		[Embed(source="../media/assets/music/menuLoop.mp3")]
		public static const SND_MenuLoop_Letter:Class;
		
		
		[Embed(source="../media/assets/music/levelPick.mp3")]
		public static const SND_LevelSelect_Letter:Class;
		
		[Embed(source="../media/assets/music/sceneTwoMusic.mp3")]
		public static const SND_LevelMusic_Letter:Class;
		
		[Embed(source="../media/assets/music/sceneOneMusic.mp3")]
		public static const SND_LevelOneMusic_Letter:Class;
		
		
		[Embed(source="../media/assets/music/welcomeSounds.mp3")]
		public static const SND_MainTheme_Letter:Class;
		
		[Embed(source="../media/assets/music/achievementTwo.mp3")]
		public static const SND_EndGame_Letter:Class;
		
		[Embed(source="../media/assets/music/loadingUp.mp3")]
		public static const SND_LoadingGame_Letter:Class;
		
		
		[Embed(source="../media/assets/music/win.mp3")]
		public static const SND_WinGame_Letter:Class;
		
		
 
		public static var sndPopLetter:Sound = new Sounds.SND_Pop_Letter() as Sound;
		public static var sndPauseGame:Sound = new Sounds.SND_Pause_Letter() as Sound;
		public static var sndScoreGame:Sound = new Sounds.SND_Score_Letter() as Sound;
		public static var sndLevelSelect:Sound = new Sounds.SND_LevelSelect_Letter() as Sound;
		public static var sndLevelMusic:Sound = new Sounds.SND_LevelMusic_Letter() as Sound;
		public static var sndLevelOneMusic:Sound = new Sounds.SND_LevelOneMusic_Letter() as Sound;
		public static var sndLevelMainTheme:Sound = new Sounds.SND_MainTheme_Letter() as Sound;
		public static var sndMenuLoop:Sound = new Sounds.SND_MenuLoop_Letter() as Sound;
		public static var sndLoadingGame:Sound = new Sounds.SND_LoadingGame_Letter() as Sound;
		public static var sndEndGame:Sound = new Sounds.SND_EndGame_Letter() as Sound;
		public static var sndWinGame:Sound = new Sounds.SND_WinGame_Letter() as Sound;
		public static var muted:Boolean = false;
	}
}