Fatima has a simple routing system for navigation between [Pages](/page) and showing [Dialogs](/dialog) and [Snackbars](/snackbar) **without BuildContext**. 

for navigating between pages, you should register your pages into **FatimaApp** class like this:

```dart
FatimaApp(
	//..
	fatimaPages: [
		FatimaPage(
			name: '/home',
			page: () => const  HomePage(),
		),
	]
);
```

in the example above, **HomePage** can be any widget such as **StatelessWidget** and **/home** is address of page.
now you can navigate from any pages to HomePage like this:

```dart
Fatima.to(() => HomePage());
// or
Fatima.toNamed("/home");
// in web application
https://yourwebsite.com/#/home
```
for full documentation visit : [Page](/page)

For displaying dialogs with Fatima you can do like this:

```dart
Fatima.dialog(MyDialogWidget());
```
that **MyDialogWidget** can be any widget such as **StatelessWidget**

it is flexible and easy customizable.


for full documentation visit : [Dialog](/dialog)

And for displaying snackbars with Fatima you can do like this:

```dart
Fatima.snackbar("title", "message");
```
it is flexible and easy customizable.

for full documentation visit : [Snackbar](/snackbar)
