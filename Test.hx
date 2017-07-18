package;
import EventCallback;
/**
 * ...
 * @author Damilare Akinlaja
 */
class Test
{

	static function main()
	{
		var emitter:EventEmitter = new EventEmitter();
		var calls:Array<Any> = [];

		//function one(args:Array<Dynamic>) { calls.push('one'); return null; }
		//function two(args:Array<Dynamic>) { calls.push('two'); return null; }
		

		var one:EventCallback = new EventCallback(function(args:Array<Dynamic>)
		{
			
			calls.push('one');
			//trace(one._args);
			calls.push(args[0]);			
		});


		var two:EventCallback = new EventCallback(function(args:Array<Dynamic>)
		{
			calls.push('two');
		});
		

		emitter.on('foo', one);
		emitter.on('foo', two);
		emitter.off('foo', two);

		emitter.emit('foo', [1]);
		  /**emitter.once('foo', one);
		  emitter.emit('foo', [1]);
		  emitter.emit('foo', [2]);
		  emitter.emit('foo', [3]);
		  emitter.emit('bar', [1]);**/
		  

		trace(calls);
	}

}