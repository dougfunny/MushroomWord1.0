package  
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Assests
	{
		
		
		
		[Embed(source="/../media/assets/loading.png")]
		public static const Background:Class;
		 
		[Embed(source="/../media/assets/SplashScreen.png")]
		public static const BackgroundLogo:Class;
		
		[Embed(source="/../media/assets/SplashScreen.png")]
		public static const SplashLoading:Class;
	  
		[Embed(source = "../media/assets/SceneTwo.png")]		
		public static const LevelTwo:Class;
		
		[Embed(source = "../media/assets/SceneThree.png")]		
		public static const LevelThree:Class;
		
		[Embed(source = "../media/assets/levelFour.png")]		
		public static const LevelFour:Class;
		
	 
		
		private static var gameTextures:Dictionary  = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas;
		private static var gameTextureAtlasScore:TextureAtlas;
		private static var gameTextureAtlasMenu:TextureAtlas;
		private static var gameTextureAtlasBlue:TextureAtlas;
		private static var gameTextureAtlasRed:TextureAtlas;
		private static var gameTextureAtlasGreen:TextureAtlas;
		private static var gameTextureAtlasPurple:TextureAtlas;
		[Embed(source = "../media/assets/LetterSpriteSheet.png")]		
		public static const AtlasTextureGame:Class;
		
		[Embed(source = "../media/assets/LetterSpriteSheet.xml", mimeType = "application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		
		
		[Embed(source = "../media/assets/menuFlyTexture.png")]		
		public static const AtlasTextureMenu:Class;
		
		[Embed(source = "../media/assets/menuFlyTexture.xml", mimeType = "application/octet-stream")]
		public static const AtlasXmlMenu:Class;
		
		
		[Embed(source = "../media/assets/blueTexture.png")]		
		public static const AtlasTextureblue:Class;
		
		[Embed(source = "../media/assets/blueTexture.xml", mimeType = "application/octet-stream")]
		public static const AtlasXmlBlue:Class;
		
		[Embed(source = "../media/assets/greenTexture.png")]		
		public static const AtlasTextureGreen:Class;
		
		[Embed(source = "../media/assets/greenTexture.xml", mimeType = "application/octet-stream")]
		public static const AtlasXmlGreen:Class;
		
		
		[Embed(source = "../media/assets/redTexture.png")]		
		public static const AtlasTextureRed:Class;
		
		[Embed(source = "../media/assets/redTexture.xml", mimeType = "application/octet-stream")]
		public static const AtlasXmlRed:Class;
		
		[Embed(source = "../media/assets/purpleTexture.png")]		
		public static const AtlasTexturePurple:Class;
		
		[Embed(source = "../media/assets/purpleTexture.xml", mimeType = "application/octet-stream")]
		public static const AtlasXmlPurple:Class;
		
		
 
	
	 
		
		public static function getAtlasMenu():TextureAtlas
		{
			// TODO Auto Generated method stub
			if( gameTextureAtlasMenu == null)
			{
				var texture:Texture = getTexture("AtlasTextureMenu");
				var xml:XML  = XML( new AtlasXmlMenu ());
				gameTextureAtlasMenu = new  TextureAtlas(texture, xml);
			}
			
			return gameTextureAtlasMenu;
			
			
		}
		
		
		
		
		
		
		public static function getAtlas():TextureAtlas
		{
			// TODO Auto Generated method stub
			if( gameTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTextureGame");
				var xml:XML  = XML( new AtlasXmlGame ());
				gameTextureAtlas = new  TextureAtlas(texture, xml);
			}
			
			return gameTextureAtlas;
			
			
		}
		
		 
		
		
		public static function getAtlasBlue():TextureAtlas
		{
			// TODO Auto Generated method stub
			if( gameTextureAtlasBlue == null)
			{
				var texture:Texture = getTexture("AtlasTextureblue");
				var xml:XML  = XML( new AtlasXmlBlue ());
				gameTextureAtlasBlue = new  TextureAtlas(texture, xml);
			}
			
			return gameTextureAtlasBlue;
			
			
		}
		
		
		public static function getAtlasRed():TextureAtlas
		{
			// TODO Auto Generated method stub
			if( gameTextureAtlasRed == null)
			{
				var texture:Texture = getTexture("AtlasTextureRed");
				var xml:XML  = XML( new AtlasXmlRed ());
				gameTextureAtlasRed = new  TextureAtlas(texture, xml);
			}
			
			return gameTextureAtlasRed;
			
			
		}
		
		 
		
		public static function getAtlasGreen():TextureAtlas
		{
			// TODO Auto Generated method stub
			if( gameTextureAtlasGreen == null)
			{
				var texture:Texture = getTexture("AtlasTextureGreen");
				var xml:XML  = XML( new AtlasXmlGreen ());
				gameTextureAtlasGreen = new  TextureAtlas(texture, xml);
			}
			
			return gameTextureAtlasGreen;
			
			
		}
		
		
		public static function getAtlasPurple():TextureAtlas
		{
			// TODO Auto Generated method stub
			if( gameTextureAtlasPurple == null)
			{
				var texture:Texture = getTexture("AtlasTexturePurple");
				var xml:XML  = XML( new AtlasXmlPurple ());
				gameTextureAtlasPurple = new  TextureAtlas(texture, xml);
			}
			
			return gameTextureAtlasPurple;
			
			
		}
		
		
		public static  function getTexture(name:String):starling.textures.Texture
		{
			if(gameTextures[name] == undefined )
			{
				var bitmap:Bitmap = new Assests [name]();
				
				gameTextures[name] = starling.textures.Texture.fromBitmap(bitmap);
				
			}
			
			
			return gameTextures[name];
			
		}
		
		
		
		
		
	}
	
}