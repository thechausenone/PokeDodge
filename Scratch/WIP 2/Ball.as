package {
	import flash.display.MovieClip;
	import flash.events.Event;

	public class Ball extends MovieClip {
		var dVelX:Number=5;
		var dVelY:Number=5;
		var nX:int;
		var nY:int;

		public function Ball() {
	
			this.graphics.lineStyle(2, 0x000000);
			this.graphics.beginFill(0xFF0000);
			this.graphics.drawCircle(nX,nY,15);
			this.graphics.endFill();
			this.addEventListener(Event.ENTER_FRAME,moveIt);

		}
		function moveIt(event:Event):void {
			this.x+=dVelX;
			this.y+=dVelY;


			if (this.x > stage.stageWidth - 7.5 || this.x < 7.5)
			{
			dVelX *=  -1;
			}
			else if (this.y > stage.stageHeight - 7.5 || this.y < 7.5)
			{
			dVelY *=  -1;

		}
	}
}
}