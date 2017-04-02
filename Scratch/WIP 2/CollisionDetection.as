package {
	import flash.display.Sprite;
	import flash.utils.*;
	import flash.events.*;
	import flash.display.*;
	import flash.text.*;
	import flash.ui.Mouse;
	import flash.display.Shape;

	public class CollisionDetection extends Sprite {
		var movingBall:NewBall;
		var stationaryBall:NewBall;
		var dDistX:Number;
		var dDistY:Number;
		var dDistApart:Number;
		var dMinDist:Number;
		var txtStatement:TextField = new TextField();

		public function CollisionDetection() {

			stationaryBall = new NewBall();
			stationaryBall.x=stage.stageWidth/2;
			stationaryBall.y=stage.stageHeight/2;
			addChild(stationaryBall);


			movingBall = new NewBall();
			movingBall.x=0;
			movingBall.y=0;
			addChild(movingBall);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, moveIt);

			Mouse.hide();

			txtStatement.x=20;
			txtStatement.y=20;
			txtStatement.width=150;
			addChild(txtStatement);

			//colour1=Math.random()*0xFFFFFF;
			//colour2=Math.random()*0xFFFFFF;

			/*movingBall.graphics.beginFill(colour1);
			movingBall.graphics.drawCircle(0, 0, 20);
			addChild(movingBall);
			
			
			stationaryBall.graphics.beginFill(colour2);
			stationaryBall.graphics.drawCircle(stage.stageWidth/2, stage.stageHeight/2, 20);
			addChild(stationaryBall);
			//stationaryBall.addEventListener(MouseEvent.MOUSE_MOVE, moveIt);*/

		}

		private function moveIt(e:MouseEvent):void {
			//gamedev.tutsplus.com/tutorials/implementation/when-worlds-collide-simulating-circle-circle-collisions/
			movingBall.x=mouseX;
			movingBall.y=mouseY;
			dDistX=movingBall.x-stationaryBall.x;
			dDistY=movingBall.y-stationaryBall.y;
			dMinDist=20+20;
			dDistApart = Math.sqrt( (dDistX * dDistX) + (dDistY * dDistY)); 

			if (dDistApart<=dMinDist) {
				txtStatement.text="Hurrah!";
			} else {
				txtStatement.text="Boo!";
			}




		}
	}
}