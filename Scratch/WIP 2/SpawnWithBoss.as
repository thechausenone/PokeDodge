package {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.*;
	import flash.events.*;


	public class SpawnWithBoss extends MovieClip {
		var tmrSpawn:Timer=new Timer(10);
		var arBalls:Array = new Array();
		var ball1:Ball;
		var ball2:MasterBall;
		var warningball:Sprite = new Sprite();
		var nNumBalls:int=0;
		var i:int;
		var nX:int;
		var nY:int;

		public function SpawnWithBoss() {

			warningball.graphics.lineStyle(2, 0x000000);
			warningball.graphics.beginFill(0xFFFFFF);
			warningball.graphics.drawCircle(0,0, 15);
			addChild(warningball);
			warningball.x=600;
			warningball.y=600;
			tmrSpawn.start();
			tmrSpawn.addEventListener("timer", timerFunction);

		}
		public function timerFunction(e:TimerEvent):void {
			i=0;
			if (nNumBalls<9) {
				if (tmrSpawn.currentCount==30) {
					nX=Math.random()*460+10;
					nY=Math.random()*360+10;
					warningball.x=nX;//create the warning ball
					warningball.y=nY;

				} else if (tmrSpawn.currentCount==60) {
					warningball.x=600;//move the warning ball out
					warningball.y=600;
					ball1 = new Ball();
					ball1.x=nX;
					ball1.y=nY;
					addChild(ball1);
					arBalls.push(ball1);
					nNumBalls++;
					addChild(arBalls[i]);//add to the index
					i++;
					tmrSpawn.reset();
					tmrSpawn.start();
					
				}

			} else if (nNumBalls==9) {

				if (tmrSpawn.currentCount==30) {
					nX=Math.random()*460+10;
					nY=Math.random()*360+10;
					warningball.x=nX;//create the warning ball
					warningball.y=nY;

				} else if (tmrSpawn.currentCount==60) {
					warningball.x=600;
					warningball.y=600;
					ball2 = new MasterBall();
					ball2.x=nX;
					ball2.y=nY;
					addChild(ball2);
					nNumBalls++;
					
				}
			}
		}
	}
}