package {
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.display.*;

	public class BallBouncing extends MovieClip {

		private var ball1:NewBall;
		private var ball2:NewBall;
		var dVelX:Number=10;
		var dVelY:Number=10;

		public function BallBouncing() {

			ball1 = new NewBall();
			ball1.x=0;
			ball1.y=0;
			addChild(ball1);
			ball1.addEventListener(Event.ENTER_FRAME, moveIt);

			ball2 = new NewBall();
			ball2.x=550;
			ball2.y=400;
			addChild(ball2);
			ball2.addEventListener(Event.ENTER_FRAME, moveIt);

		}
		function moveIt(event:Event):void {
			ball1.x+=dVelX;
			ball1.y+=dVelY;
			ball2.x-=dVelX;
			ball2.y-=dVelY;


			if (ball1.x>stage.stageWidth-ball1.width/2||ball1.x<0+10) {
				dVelX*=-1;
			} else if (ball1.y>stage.stageHeight - ball1.height / 2 || ball1.y<0 + 10 ) {
				dVelY*=-1;
			}


		}
	}
}