package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class CoolThing extends MovieClip {
		
		/** The y-component of the acceleration pixels/tick/tick. */
		var accelerationY:Number = 0.25;
		/** The y-component of the acceleration pixels/tick/tick. */
		var accelerationX:Number = 0;
		
		/** The x-component of the velocity in pixels/tick. */
		var velocityX:Number = 0;
		/** The y-component of the velocity in pixels/tick. */
		var velocityY:Number = 0;
		/** Rotational velocity in degrees/tick. */
		var velocityR:Number = -1;
		
		/** Wall sound effect. */
		var wallBlip:WallBlip = new WallBlip();
		
		/** Sets if the game over sound has been played. */
		var gameOverSoundPlayed:Boolean = false;
		
		/** Checks for out of bounds */
		public var isOutOfBounds:Boolean = false;
		/** Tracks points to be added to score */
		public var unscoredPoints:int = 0;
		
		/** The constructor of the CoolThing class. */
		public function CoolThing() {
			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		} // ends CoolThing
		
		public function update():void {
			
			/** Updates ball's coordinates, velocity, and rotation. */
			velocityX += accelerationX;
			velocityY += accelerationY;
			x += velocityX;
			y += velocityY;
			rotation += velocityR;
			
			/** Left and right wall sounds. */
			if(x < 37 || x > 767) {
				wallBlip.play();
				velocityX *= -1;
			}		
			/** Ceiling sounds */
			if(y < 37) {
				wallBlip.play();
				velocityY *= -1;
			}			
			/** Initiates game over sound and screen. */
			if(y > 600) {
				var gameOverBlip:GameOverBlip = new GameOverBlip();
				if (gameOverSoundPlayed == false){
					gameOverBlip.play();
					gameOverSoundPlayed = true;
				}
				isOutOfBounds = true;
			} 
			else{
				isOutOfBounds = false;
			}
			
		} // ends update
		/**
		 * This function is called when the `thingy` is clicked. Neat.
		 * @param e The MouseEvent object that is triggering this event-handler.
		 */
		function handleClick(e:MouseEvent):void {
			velocityX = Math.random() * 20 - 10; // -10 to 10
			velocityY = -10;
			velocityR = Math.random() * 4 - 2; // -2 to 2
			unscoredPoints = 100;
			
			var blip:SoundBlip = new SoundBlip();
			blip.play();
			
		} // ends handleClick
		
		/**
		 * This function is called when the 'reset' button is clicked.
		 * It resets the object's coordinates and velocity/acceleration.
		 */
		public function resetThingy(){
			
			accelerationY = 0.25;
			accelerationX = 0;
			velocityX = 0;
			velocityY = 0;
			velocityR = -1;
			x = Math.random() * 600 + 50;
			y = Math.random() * 200 + 50;
			
			gameOverSoundPlayed = false;
			
		} // ends resetThingy
		
	} // ends class
	
} // ends package
