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
		

		var one:EventCallback = new EventCallback();
		one.call = function()
		{
			
			calls.push('one');
			//trace(one._args);
			//calls.push(one._args[0]);
		}

		var two:EventCallback = new EventCallback();
		two.call = function()
		{
			calls.push('two');
		}

		emitter.once('foo', one);
		emitter.once('fee', one);
		emitter.off('foo', one);

		emitter.emit('foo');
		  /**emitter.once('foo', one);
		  emitter.emit('foo', [1]);
		  emitter.emit('foo', [2]);
		  emitter.emit('foo', [3]);
		  emitter.emit('bar', [1]);**/
		  

		trace(calls);
	}

}