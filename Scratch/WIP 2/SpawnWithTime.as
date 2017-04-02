package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.*;
	import flash.events.*;


	public class SpawnWithTime extends MovieClip
	{
		var tmrSpawn:Timer = new Timer(1);
		var arBalls:Array = new Array();
		var ball1:Ball;
		var warningball:Sprite = new Sprite();
		var nNumBalls:int = 0;
		var i:int;
		var nX:int;
		var nY:int;

		public function SpawnWithTime()
		{
			
			warningball.graphics.lineStyle(2, 0x000000);
			warningball.graphics.beginFill(0xFFFFFF);
			warningball.graphics.drawCircle(0,0, 15);
			addChild(warningball);
			warningball.x = 600;
			warningball.y = 600;
			tmrSpawn.start();
			tmrSpawn.addEventListener("timer", timerFunction);

		}
		public function timerFunction(e:TimerEvent):void
		{
			i = 0;
			if (nNumBalls<1000)
			{
				if (tmrSpawn.currentCount == 30)
				{
					nX = Math.random() * 460 + 10;
					nY = Math.random() * 360 + 10;


					warningball.x = nX;//create the warning ball
					warningball.y = nY;

				}
				else if (tmrSpawn.currentCount==40)
				{
					warningball.x = 600;//move the warning ball out
					warningball.y = 600;
					ball1 = new Ball();
					ball1.x = nX;
					ball1.y = nY;
					addChild(ball1);
					arBalls.push(ball1);
					nNumBalls++;
					addChild(arBalls[i]);//add to the index
					i++;
					tmrSpawn.reset();
					tmrSpawn.start();
					trace(nNumBalls);

				}
			}
		}

	}
}