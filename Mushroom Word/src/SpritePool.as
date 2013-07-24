package
{
	 
	import objects.Mushroom;

	public class SpritePool {
		
		private static var pool:Vector.<Mushroom>;
		
		public static function init(poolSize:int):void {
			
			pool = new Vector.<Mushroom>(poolSize);
			
			for(var i:int=0;i<pool.length;i++){
				
				pool[i] = new Mushroom();
				
			}
			
		}
		
		public static function retrieveF():Mushroom {
			
			if (pool.length>0) {
				
				return pool.pop();
				
			} else {
				
				// this branch should not execute. 
				
				return new Mushroom();
				
			}
			
		}
		
		public static function returnF(view:Mushroom):void {
			
			pool.push(view);
			
		}
		
	}
}