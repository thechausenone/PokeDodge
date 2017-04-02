package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;

	public class physicstest1 extends Sprite {
		//We create our variable ball, a new instance of the picture we imported
		var arHorizontalBorders:Array= new Array();
		var arVerticalBorders:Array = new Array();
		var border:Sprite=new Sprite();
		var ball:Sprite = new Sprite();
		var sqr:Sprite = new Sprite();
		var i:int;
		var dx:Number;
		var dy:Number;
		var dRad:Number;
		var dSpeed:Number=20;
		var vx:Number;
		var vy:Number;
		public function physicstest1() {
			ball.graphics.beginFill(0xFF0000);
			ball.graphics.drawCircle(225,200,25);
			addChild(ball);
			
			sqr.graphics.beginFill(0x000000);
			sqr.graphics.drawRect(0,0,20,20);
			addChild(sqr);

			border.graphics.lineStyle(2, 0x000000);
			border.graphics.moveTo(0,0);
			border.graphics.lineTo(550,0);
			addChild(border);
			arHorizontalBorders.push(border);

			border = new Sprite();
			border.graphics.lineStyle(2, 0x000000);
			border.graphics.moveTo(550,0);
			border.graphics.lineTo(550,400);
			addChild(border);
			arVerticalBorders.push(border);

			border = new Sprite();
			border.graphics.lineStyle(2, 0x000000);
			border.graphics.moveTo(0,400);
			border.graphics.lineTo(550,400);
			addChild(border);
			arHorizontalBorders.push(border);

			border = new Sprite();
			border.graphics.lineStyle(2, 0x000000);
			border.graphics.moveTo(0,0);
			border.graphics.lineTo(0,400);
			addChild(border);
			arVerticalBorders.push(border);

			dx=25;
			dy=25;
			dRad=Math.atan2(dy,dx);
			vx=Math.cos(dRad)*dSpeed;
			vy=Math.sin(dRad)*dSpeed;

			stage.addEventListener(Event.ENTER_FRAME, ballMove);

		}
		private function ballMove(e:Event):void {
			Mouse.hide();
			sqr.x=mouseX;
			sqr.y=mouseY;
			ball.x+=vx;
			ball.y+=vy;
			for (i=0; i<2; i++) {
				if (ball.hitTestObject(arHorizontalBorders[i])) {
					vy*=-1;
				} else if (ball.hitTestObject(arVerticalBorders[i])) {
					vx*=-1;

				}
			}
			if (sqr.hitTestObject(ball)) {
				vx=0;
				vy=0;
			}
		}
	}
}