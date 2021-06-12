# Flutter Begin

A beginning Flutter app project to show how to use DartPad embedding.

## The Gist's Produced

[flutter being](https://gist.github.com/fredgrott/7236c857582d8541828c55aa9a51614e)

## DartPad Result

To load via a gist it's:

Prefix is

```html

https://dartpad.dev/

```

then

```html

embed-flutter.html?

```

Since it's a gist, we need a gist id

```html
7236c857582d8541828c55aa9a51614e
```

the split percentage:

```html
&split=80

```

and the last part is the theme:

```html

&theme=dark

```

And so the full sequence would be:

```html
<iframe src="https://dartpad.dev/embed-flutter.html?id=7236c857582d8541828c55aa9a51614e&split=80&theme=dark&null_safety=true"></iframe>

```

Note that GitHub Flavored Markdown does not allow iframes so this for submitting this as embed in a Medium.com article for example.

## DartPad Parameters

DartPad looks for the following parameters in its query string:

-split: Percentage of the iframe width to use for the editor (the rest may be used by the console or Flutter/HTML output).
-theme: Set this to 'dark' to use the dark theme (seen in the first screenshot above).
-null_safety: Set this to true to enable null safety mode.
-run: Set this to 'true' to auto-run the sample once loaded.
-id: ID of a GitHub gist to load into the editor
-sample_id: ID of an API doc sample to load into the editor (see https://api.flutter.dev/snippets/index.json for a list)
-sample_channel: If this parameter is set to "master", DartPad will load API Doc samples from the master doc server (master-api.flutter.dev). Any other values (or no value) will cause DartPad to load from the stable doc server (api.flutter.dev).
The following parameters are used together when loading a sample directly from a GitHub repo:

-gh_owner: Owner of the GitHub account.
-gh_repo: Name of the repo within the above account.
-gh_path: Path to a dartpad_metadata.yaml file within the repo.
-gh_ref: (optional) Branch to use when loading the file. Defaults to master.

## DartPad Resources

[How to embed a Flutter app in Website Using DartPad](https://medium.com/flutter/how-to-embed-a-flutter-application-in-a-website-using-dartpad-b8fd0ee8c4b9)

[Embedding Guide](https://github.com/dart-lang/dart-pad/wiki/Embedding-Guide)

[DartPad in tutorials: Best practices](https://dart.dev/resources/dartpad-best-practices)

## About Me, Fred Grott

My journey is creating a maker and creator studio by bootstrapping through teaching developers and designers how to develop dart and flutter applications. My premise in front-end app creation is that we as developers and creators are not creating code, graphics, and the experience but instead teaching humans how to learn about that task they want to do.

That journey we as app creators invite them on with our app is a journey that works backwards from inside the user to outside the user. make an impact on the user's inner life and then 100% of what you want to teach automatically becomes taught. This new premise came from my journey in getting my ADHD under control.

Part of my teaching process is also to out-loud introduce you to the meta conversation that every successful developer and designer has in their head when they confront new challenges and produce solutions.

You can DM me at my Keybase Profile as there are growing community of both app developers, backend coders, and app designers on keybase:

[My keybase profile](https://keybase.io/fredgrott)
