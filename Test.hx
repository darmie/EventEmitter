package;
import EventCallback;
using EmitterTools;

/**
 * ...
 * @author Damilare Akinlaja
 */
class Test
{

	static function main()
	{
		var emitter:EventEmitter = new EventEmitter();
		
		var bar:EventCallback = new EventCallback(function(args:Array<Dynamic>){
			//Do something
			trace(args[0]); //Bar
		});
		
		emitter.on('foo', bar);
		
		emitter.emit('foo', ['Bar']);
		
		//Test Mixin/Static Extenion event tools;
		var proto = ({}).event();
		proto.on('foo', bar);
		proto.emit('foo', ['Bar Mixin']);
	}

}



