package {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class MasterBall extends Sprite {
		var masterball:Sprite = new Sprite();
		
		public function MasterBall() {
	
			masterball.graphics.lineStyle(2, 0x000000);
			masterball.graphics.beginFill(0x00FF00);
			masterball.graphics.drawCircle(0, 0, 15);
			masterball.graphics.endFill();
			addChild(masterball);
			masterball.addEventListener(Event.ENTER_FRAME, followIt);

		}
		function followIt(event:Event):void {
			masterball.x=0.9*(masterball.x-mouseX)+mouseX-1;			
			masterball.y=0.9*(masterball.y-mouseY)+mouseY-1;
		}
	}
}