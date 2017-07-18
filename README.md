# EventEmitter
Cross-Platform Minimal EventEmitter library implemented in Haxe. 


**USAGE**

```hx
class Test
{

	static function main()
	{
		var emitter:EventEmitter = new EventEmitter();
		var calls:Array<Any> = [];
    
		var one:EventCallback = new EventCallback(function(args:Array<Dynamic>)  //Event function to be called when emitted
		{
			calls.push('one');
			calls.push(args[0]); //Get first argument of this function
		});

		var two:EventCallback = new EventCallback(function(args:Array<Dynamic>)
		{
			calls.push('two');
		});
		

		emitter.on('foo', one); //Register a named event listener;
		emitter.on('foo', two);
		emitter.off('foo', two); //Turn off event listeners with name `foo`

		emitter.emit('foo', [1]); //Trigger the event with an array of callback parameters
		trace(calls); 
	}

}
```
