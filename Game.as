package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	  * This is the document-level class that runs our entire game.
	  */
	public class Game extends MovieClip {
		
		var score:int = 0;
		
		var gameOver:GameOver = new GameOver();
		var restart:Restart = new Restart();
		
		var bgMusic:BGMusic = new BGMusic();
		
		/** The constructor of the Game class. */
		public function Game() {
			//Start background music.
			bgMusic.play();
			
			//Start gameLoop.
			addEventListener(Event.ENTER_FRAME, gameLoop);
			
			//Spawn gameOver and restart screens, but keep them invisible.
			addChild(gameOver);
			gameOver.visible = false;
			
			addChild(restart);
			restart.visible = false;
			
		}
		/**
		 * This is our game loop. It is an event-handler function that
		 * runs on the ENTER_FRAME event.
		 * @param e The Event object that is triggering this event-handler.
		 */
		function gameLoop(e:Event):void {
			
			thingy.update(); // update design pattern!
			thingy2.update();
			thingy3.update();
			if(thingy.unscoredPoints > 0 || thingy2.unscoredPoints > 0 || thingy3.unscoredPoints > 0){
				score += thingy.unscoredPoints;
				thingy.unscoredPoints = 0;
				
				score += thingy2.unscoredPoints;
				thingy2.unscoredPoints = 0;
				
				score += thingy3.unscoredPoints;
				thingy3.unscoredPoints = 0;
			}
			
			//Update scoreboard.
			scoreboard.text = "SCORE: " + score;
			
			//Displays gameover and restart screen when all objects are out of bounds.
			if(thingy.isOutOfBounds && thingy2.isOutOfBounds && thingy3.isOutOfBounds){
				
				gameOver.x = 400;
				gameOver.y = 250;
				gameOver.visible = true;
				
				scoreboard.x = 300;
				scoreboard.y = 300;
				
				restart.x = 400;
				restart.y = 400;
				restart.visible = true;
				restart.buttonMode = true;
				restart.addEventListener(MouseEvent.CLICK, restartGame);
				
			}
			else{
				gameOver.visible = false;
				restart.visible = false
				restart.buttonMode = false;
				restart.removeEventListener(MouseEvent.CLICK, restartGame);
			}
			
		} // ends gameLoop
		
		//Restarts the game.
		function restartGame(e:MouseEvent):void {
			
			thingy.resetThingy();
			thingy2.resetThingy();
			thingy3.resetThingy();
			
			scoreboard.x = 15.35;
			scoreboard.y = 11.30;
			
			score = 0;
			
		} // ends restartGame
		
	} // ends Game class
	
} // end package
