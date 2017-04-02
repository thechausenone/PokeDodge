package {
	import flash.display.Sprite;

	public class NewBall extends Sprite {
		public var radius:Number;
		private var color:uint;
	

		public function NewBall(radius:Number=20, color:uint=0x0000FF) {
			
			
			this.radius=radius;
			this.color=color;
			this.graphics.lineStyle(2, 0x000000);
			graphics.beginFill(color);
			graphics.drawCircle(0, 0, radius);
			graphics.endFill();
		}
	}

}