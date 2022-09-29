
Fatima Pages are using to navigate between screens. if you want to use Fatima Routing System, you should declare all of your application pages ( screens ) into FatimaApp like this :

```dart
FatimaApp(
//...
	fatimaPages: [
		FatimaPage(
			name: '/home',
			page: () => const  HomePage(),
		),
		FatimaPage(
			name: '/about',
			page: () => const  AboutPage(),
		),
		/// ...
	]
);
```


```example
```


and HomePage like this:

```dart
class HomePage extends StatelessWidget{}
```

## Class Navigation

now you can navigate from anywhere of your application into this two pages like this:

```dart
Fatima.to(() => HomePage()); // navigate to HomePage
Fatima.back(); // back to previous page
```

if you want to pop the current page and pushes a new page to the stack, you can use this:
```dart
Fatima.off(() => HomePage()); // pop current page and push HomePage
```

if you want to pop all pages in the stack and push new page, you can use this:
```dart
Fatima.offAll(() => HomePage()); // pop all in stack pages and push HomePage
```

## Named Navigation

if you want navigate to new page with its name declared in **FatimaPage**, you can use this:

```dart
Fatima.toNamed("/home");
```

if you want to pop the current page and pushes a new page to the stack, you can use this:
  
```dart
Fatima.offNamed("/home"); // pop current page and push HomePage
```
if you want to pop all pages in the stack and push new page, you can use this:
```dart
Fatima.offAllNamed("/home"); // pop all in stack pages and push HomePage
```
