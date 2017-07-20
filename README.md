# Haxe Event Emitter
A Minimal Cross-Platform Events Emitter library implemented in Haxe. 


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
		emitter.off('foo', two); //Turn off event listener called `foo` that has a function two

		emitter.emit('foo', [1]); //Trigger the event with an array of callback parameters
		trace(calls);  //should print [one, 1]
	}

}
```

# API
## EventEmitter() Intance Methods
### *implements IEmitter*
#### Note: All public instance methods of an Event emitter returns it's instance, unless otherwise stated

### _on_ 
: Listens on a given event with callback function. 

`emitter.on(event:String, fn:EventCallback):EventEmitter`
			
### _addEventListener_ 
: Alias of **on**. 

`emitter.addEventListener(event:String, fn:EventCallback):EventEmitter`

### _once_ 
: Adds an `event` listener that will be invoked a single time then automatically removed.

`emitter.once(event:String, fn:EventCallback):EventEmitter`

### _off_ 
: Remove the given callback for `event` or all registered callbacks.

`emitter.off(?event:String, ?fn:EventCallback):EventEmitter`

### _removeListener_ 
: Alias of **off**

`emitter.removeListener(event:String, ?fn:EventCallback):EventEmitter`

### _removeAllListeners_ 
: Alias of **off**

`emitter.removeAllListeners():EventEmitter`

### _removeEventListener_ 
: Alias of **off**

`emitter.removeEventListener(event:String, fn:EventCallback):EventEmitter`

### _emit_ 
: Emit `event` with the given args.

`emitter.emit(event:String, ?args:Array<Dynamic>):EventEmitter`

### _listeners_ : Array
: Return array of callbacks for `event`

`emitter.listeners(event:String):Array<Dynamic>`

### _hasListeners_ : Bool
: Check if this emitter has `event` handlers.

`emitter.hasListeners(event:String):Bool`


## EventCallback(fn) 
:
This class holds the function to be called when an event is triggered. It also serves as an utility class instance to internally trigger the function and access it's arguments

```hx
//The instance
new EventCallback(func:Array<Dynamic>->Void)

//The function
function(args:Array<Dynamic>):Void
{
	//Do something.
}

/**
 * Usage
 */
 
var listener = new EventCallback(function(args:Array<Dynamic>):Void
{
	//Do something.
	trace(args[0]) //Print the first argument
}) 

var emitter:EventEmitter = new EventEmitter();
emitter.on('event-name', listener); //Add this listener to an event called `event-name`
emitter.emit('event-name'); //Internally calls listener or each listener registered to `event-name`
emitter.emit('event-name', ['message']) //Sends an array of arguments to the callback function, then call the function 
```


## Event Emitter Static Extension 
:
This is a mixin that binds events emitter methods to a dynamic object. Must be used by adding `using {path.to.eventemitter.}EmitterTools;` at the top of your class;

```
using EmitterTools;

class Test{
	
	static function main()
	{
		var emitter:EventEmitter = new EventEmitter();
		
		var bar:EventCallback = new EventCallback(function(args:Array<Dynamic>){
			//Do something
			trace(args[0]); //prints 'Bar Mixin'
		});
		
		//Test Mixin/Static Extenion event tools;
		var myObject:Dynamic = {};
		var proto = (myObject).event(); //event() method is bound by the EmitterTools extension
		proto.on('foo', bar);
		proto.emit('foo', ['Bar Mixin']);
	}	
}
```

## Target Platforms supported
: EventEmitter has been tested and works on C++, Java, AS3 and Neko. It fails on Javascript target, because I stored the events listeners in an HashMap, which is not working properly on javascript target. May have to use an alternative to HashMap. You should default to native EventEmitter that is built into Javascript runtime.

## Haxe Version
: Haxe 3.0+





