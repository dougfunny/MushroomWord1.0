package
{
	
	import objects.Health;
	import starling.display.Sprite;
	
	public class HealthPool extends Sprite{
	 
		private static var pool:Vector.<Health>;
	 
		
		public static function init(poolSize:int):void {
			 
			pool = new Vector.<Health>(poolSize);
			
			for(var i:int=0;i<pool.length;i++){
				
				pool[i] = new Health();
			 
				 
			}
			
		}
		
		public static function retrieveF():Health {
			 
			if (pool.length>0) {
			
				return pool.pop();
				
			} else {
				
				 
				return new Health();
				
			}
			
		}
		
		public static function returnF(view:Health):void {
			
			pool.push(view);
			
		}
		
	}
}