Objective-C / iOS Technical Questions:
----

#### Explain retain counts
When created, objects begin their lives with a retain count of 1. In manual memory management, upon subsequent retain messages (i.e. `[object retain]`) to the object, the retain count is incremented by one for each received retain message. In order to decrement the retain count, the object is sent the release message (i.e. `[object release]`). As long as the retain count of an object is greater than zero, it will remain in memory. Once the retain count reaches zero, the object will be destroyed. 

#### What is automatic reference counting?
ARC (Automatic Reference Counting) handles the insertion of these retain and release method for us when the code is being compiled. As a result, we cannot manually send the retain, release, or autorelease messages to objects.

#### Is a delegate object ever retained?
No, a delegate object should never be retained. If a delegate is retained, then it leads to what is referred to as a retain cycle. Retain cycles come about when an object retains a child object, and the child object retains its owner. As a result, the reference counts of either object will never reach zero, which leads to a memory leak as the objects will be stuck in memory forever. 

#### What happens when you call autorelease on an object?
Sending the autorelease message to an object places the object into an autorelease pool. At some unspecified time in the future, the release method will automatically be sent to all objects in the autorelease pool. 

#### What is UIResponder in the iOS class hierarchy perform?
UIResponder handles user interaction with the device (e.g. touch, movement) and what objects respond to an event by managing the responder chain. The responder chain is simply the hierarchy of objects that handle user interaction events. For example, when a user touches the screen, the touch event is sent to the First Responder (e.g. the view controller on-screen). If the First Responder is unable to handle the event, it passes the event up to the next responder and so on. 

#### How would you add a formatted floating point number to a string?
You could use the `+stringWithFormat` method on NSString to concatenate the string and the floating point number. Because NSStrings are immutable, this method will return a new NSString. 

```Objective-C
// Returns a string prefixed with a float (to 5 floating point digits of precision)
[NSString stringWithFormat:@"%.5f%@", float, string]; 
```

#### What's the difference between NSArray and NSMutableArray?
NSArray is immutable, whereas NSMutableArray can be modified after creation. 

#### What is the easiest way to loop through an array of objects?
We can use fast enumeration to loop through all objects in the array. 

```Objective-C
// Fast enumeration of an array of NSStrings
for (NSString *string in stringArray) {
	...
}
```

#### What is the easiest way to loop through a dictionary?
Fast enumeration also works on NSDictionary objects, although it is crucial to state that this enumerates through the keys in our dictionary and not the values.

```Objective-C
// Fast enumeration of a dictionary with NSStrings as keys
for (NSString *key in stringDictionary) {
	...
}
```

#### What does the "new" class method do?
As implemented in Cocoa, the 'new' class method serves as a convenience method to call alloc and init on an object, in that order. Keep in mind that this will not call any custom init methods of your object (e.g. `+initWithAuthor`), only the `+init` method.

```Objective-C
// These two statements are the same
Book *book = [Book alloc] init];
Book *book = [Book new];
```

#### What's the difference between the @synthesize and @dynamic statement?
The @synthesize tells the compiler to automatically create getter and setter methods for the specified property. Additionally, you can specify the name of the backing instance variable that will be created. The @dynamic statement tells the compiler to not do this, as the developer will provide their own getter/setter implementations. In recent versions of llvm, the compiler will auto synthesize properties, so the @synthesize declaration is no longer explicitly needed. 

```Objective-C
// Book.h
@property NSString *author;

// Book.m
@synthesize author; // Auto generates:
					// - (void)setAuthor:(NSString*)author; 
					// - (NSString *)author;
```

#### How are property getter and setter methods named?
Property getter and setter methods are named in the following way, for a property NSString title:

```Objective-C
// Getter/Setters for property 'title'
- (void)setTitle:(NSString *)title;
- (NSString*)title;
```

#### What is the NSCoder class useful for?
The NSCoder class is useful for saving your object instances as they exist in some state for serialization or deserialization. For example, the NIB loading mechanism uses NSCoder to decode/encode the data in the object graph specified by the NIB. 

#### What is the main iOS class used for retrieving data over the network?
NSURLConnection is the main class used for retrieving data over the network. Depending on the protocol, other classes may be more useful.

#### What are the two most prevalent data formats used in network APIs?
JSON (JavaScript Object Notation) and XML (eXtensible Markup Language).

#### What are the advantages of JSON over XML? 
In general, the main advantage of JSON over XML is that JSON is simpler in terms of syntax. In terms of network footprint, JSON is typically smaller than XML due to the fact that no opening and closing tags are needed (as in XML). As a result, JSON tends to be more readable which simplifies debugging. Parsing JSON is typically a simpler process as well, as parsers tend to be simpler due again to the simplicity of the spec (i.e. no need to match tags). If you're consuming a JSON API in a web client, the resulting JSON can be natively accessed as a JavaScript object, assuming proper formatting. 

#### How is a low memory event signaled in iOS?
 When a low memory event occurs, iOS alerts the active view controller with the `-didReceiveMemoryWarning message`. Upon receiving this message, the app has to chance to free up as much memory as possible to avoid being killed by the OS. Additionally, the app's appDelegate also receives a similar message if the `-applicationDidReceiveMemoryWarning` method is implemented.
