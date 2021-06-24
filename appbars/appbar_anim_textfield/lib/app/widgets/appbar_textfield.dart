// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original  is by Elgan Sayer and Modified by Fredrick Allan Grott



import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;


import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

enum SearchState { title, searching }
double kdefaultDecorationHeightOffset = 12.0;

class AppBarTextField extends StatefulWidget implements PreferredSizeWidget {
  // Widgets to place after the search icon
  final List<Widget>? trailingActionButtons;
  // Widgets to place before the search icon
  final List<Widget>? leadingActionButtons;
  //When back icon button is pressed
  final VoidCallback? onBackPressed;
  //When clear icon button is pressed
  final VoidCallback? onClearPressed;

  /// The [Builder] is used in this example to ensure that the `context` refers
  /// to that part of the subtree. That way this code snippet can be used even
  /// inside the very code that is creating the [Scaffold] (in which case,
  /// without the [Builder], the `context` wouldn't be able to see the
  /// [Scaffold], since it would refer to an ancestor of that widget).
  ///
  /// See also:
  ///
  ///  * [Scaffold.appBar], in which an [AppBar] is usually placed.
  ///  * [Scaffold.drawer], in which the [Drawer] is usually placed.
  final Widget? leading;

  /// Controls whether we should try to imply the leading widget if null.
  ///
  /// If true and [leading] is null, automatically try to deduce what the leading
  /// widget should be. If false and [leading] is null, leading space is given to [title].
  /// If leading widget is not null, this parameter has no effect.
  final bool automaticallyImplyLeading;

  /// The primary widget displayed in the app bar.
  ///
  /// Typically a [Text] widget that contains a description of the current
  /// contents of the app.
  ///
  /// Becomes the middle component of the [NavigationToolBar] built by this widget.
  /// The [title]'s width is constrained to fit within the remaining space
  /// between the toolbar's [leading] and [actions] widgets. Its height is
  /// _not_ constrained. The [title] is vertically centered and clipped to fit
  /// within the toolbar, whose height is [toolbarHeight]. Typically this
  /// isn't noticeable because a simple [Text] [title] will fit within the
  /// toolbar by default. On the other hand, it is noticeable when a
  /// widget with an intrinsic height that is greater than [toolbarHeight]
  /// is used as the [title]. For example, when the height of an Image used
  /// as the [title] exceeds [toolbarHeight], it will be centered and
  /// clipped (top and bottom), which may be undesirable. In cases like this
  /// the height of the [title] widget can be constrained. For example:
  ///
  /// ```dart
  /// MaterialApp(
  ///   home: Scaffold(
  ///     appBar: AppBar(
  ///        title: SizedBox(
  ///        height: toolbarHeight,
  ///        child: child: Image.asset(logoAsset),
  ///      ),
  ///      toolbarHeight: toolbarHeight,
  ///   ),
  /// )
  /// ```
  final Widget? title;

  /// This widget is stacked behind the toolbar and the tab bar. It's height will
  /// be the same as the app bar's overall height.
  ///
  /// A flexible space isn't actually flexible unless the [AppBar]'s container
  /// changes the [AppBar]'s size. A [SliverAppBar] in a [CustomScrollView]
  /// changes the [AppBar]'s height when scrolled.
  ///
  /// Typically a [FlexibleSpaceBar]. See [FlexibleSpaceBar] for details.
  final Widget? flexibleSpace;

  /// This widget appears across the bottom of the app bar.
  ///
  /// Typically a [TabBar]. Only widgets that implement [PreferredSizeWidget] can
  /// be used at the bottom of an app bar.
  ///
  /// See also:
  ///
  ///  * [PreferredSize], which can be used to give an arbitrary widget a preferred size.
  final PreferredSizeWidget? bottom;

  /// The z-coordinate at which to place this app bar relative to its parent.
  ///
  /// This controls the size of the shadow below the app bar.
  ///
  /// The value is non-negative.
  ///
  /// If this property is null, then [ThemeData.appBarTheme.elevation] is used,
  /// if that is also null, the default value is 4, the appropriate elevation
  /// for app bars.
  final double? elevation;

  /// The color to paint the shadow below the app bar.
  ///
  /// If this property is null, then [ThemeData.appBarTheme.shadowColor] is used,
  /// if that is also null, the default value is fully opaque black, the appropriate
  /// color for shadows.
  // final Color shadowColor;

  /// The material's shape as well its shadow.
  ///
  /// A shadow is only displayed if the [elevation] is greater than
  /// zero.
  final ShapeBorder? shape;

  /// The color to use for the app bar's material. Typically this should be set
  /// along with [brightness], [iconTheme], [textTheme].
  ///
  /// If this property is null, then [ThemeData.appBarTheme.color] is used,
  /// if that is also null, then [ThemeData.primaryColor] is used.
  final Color? backgroundColor;

  /// The brightness of the app bar's material. Typically this is set along
  /// with [backgroundColor], [iconTheme], [textTheme].
  ///
  /// If this property is null, then [ThemeData.appBarTheme.brightness] is used,
  /// if that is also null, then [ThemeData.primaryColorBrightness] is used.
  final Brightness? brightness;

  /// The color, opacity, and size to use for app bar icons. Typically this
  /// is set along with [backgroundColor], [brightness], [textTheme].
  ///
  /// If this property is null, then [ThemeData.appBarTheme.iconTheme] is used,
  /// if that is also null, then [ThemeData.primaryIconTheme] is used.
  final IconThemeData? iconTheme;

  /// The color, opacity, and size to use for the icons that appear in the app
  /// bar's [actions]. This should only be used when the [actions] should be
  /// themed differently than the icon that appears in the app bar's [leading]
  /// widget.
  ///
  /// If this property is null, then [ThemeData.appBarTheme.actionsIconTheme] is
  /// used, if that is also null, then this falls back to [iconTheme].
  final IconThemeData? actionsIconTheme;

  /// The typographic styles to use for text in the app bar. Typically this is
  /// set along with [brightness] [backgroundColor], [iconTheme].
  ///
  /// If this property is null, then [ThemeData.appBarTheme.textTheme] is used,
  /// if that is also null, then [ThemeData.primaryTextTheme] is used.
  final TextTheme? textTheme;

  /// Whether this app bar is being displayed at the top of the screen.
  ///
  /// If true, the app bar's toolbar elements and [bottom] widget will be
  /// padded on top by the height of the system status bar. The layout
  /// of the [flexibleSpace] is not affected by the [primary] property.
  final bool primary;

  /// Whether the title should be centered.
  ///
  /// If this property is null, then [ThemeData.appBarTheme.centerTitle] is used,
  /// if that is also null, then value is adapted to the current [TargetPlatform].
  final bool? centerTitle;

  /// Whether the title should be wrapped with header [Semantics].
  ///
  /// Defaults to false.
  final bool excludeHeaderSemantics;

  /// The spacing around [title] content on the horizontal axis. This spacing is
  /// applied even if there is no [leading] content or [actions]. If you want
  /// [title] to take all the space available, set this value to 0.0.
  ///
  /// Defaults to [NavigationToolbar.kMiddleSpacing].
  final double titleSpacing;

  /// How opaque the toolbar part of the app bar is.
  ///
  /// A value of 1.0 is fully opaque, and a value of 0.0 is fully transparent.
  ///
  /// Typically, this value is not changed from its default value (1.0). It is
  /// used by [SliverAppBar] to animate the opacity of the toolbar when the app
  /// bar is scrolled.
  final double toolbarOpacity;

  /// How opaque the bottom part of the app bar is.
  ///
  /// A value of 1.0 is fully opaque, and a value of 0.0 is fully transparent.
  ///
  /// Typically, this value is not changed from its default value (1.0). It is
  /// used by [SliverAppBar] to animate the opacity of the toolbar when the app
  /// bar is scrolled.
  final double bottomOpacity;

  /// A size whose height is the sum of [toolbarHeight] and the [bottom] widget's
  /// preferred height.
  ///
  /// [Scaffold] uses this size to set its app bar's height.
  @override
  final Size preferredSize;

  /// Defines the height of the toolbar component of an [AppBar].
  ///
  /// By default, the value of `toolbarHeight` is [kToolbarHeight].
  final double? toolbarHeight;

  /// Defines the width of [leading] widget.
  ///
  /// By default, the value of `leadingWidth` is 56.0.
  // final double leadingWidth;

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController].
  final TextEditingController? controller;

  /// Defines the keyboard focus for this widget.
  ///
  /// The [focusNode] is a long-lived object that's typically managed by a
  /// [StatefulWidget] parent. See [FocusNode] for more information.
  ///
  /// To give the keyboard focus to this widget, provide a [focusNode] and then
  /// use the current [FocusScope] to request the focus:
  ///
  /// ```dart
  /// FocusScope.of(context).requestFocus(myFocusNode);
  /// ```
  ///
  /// This happens automatically when the widget is tapped.
  ///
  /// To be notified when the widget gains or loses the focus, add a listener
  /// to the [focusNode]:
  ///
  /// ```dart
  /// focusNode.addListener(() { print(myFocusNode.hasFocus); });
  /// ```
  ///
  /// If null, this widget will create its own [FocusNode].
  ///
  /// ## Keyboard
  ///
  /// Requesting the focus will typically cause the keyboard to be shown
  /// if it's not showing already.
  ///
  /// On Android, the user can hide the keyboard - without changing the focus -
  /// with the system back button. They can restore the keyboard's visibility
  /// by tapping on a text field.  The user might hide the keyboard and
  /// switch to a physical keyboard, or they might just need to get it
  /// out of the way for a moment, to expose something it's
  /// obscuring. In this case requesting the focus again will not
  /// cause the focus to change, and will not make the keyboard visible.
  ///
  /// This widget builds an [EditableText] and will ensure that the keyboard is
  /// showing when it is tapped by calling [EditableTextState.requestKeyboard()].
  final FocusNode? focusNode;

  /// The decoration to show around the text field.
  ///
  /// By default, draws a horizontal line under the text field but can be
  /// configured to show an icon, label, hint text, and error text.
  ///
  /// Specify null to remove the decoration entirely (including the
  /// extra padding introduced by the decoration to save space for the labels).
  final InputDecoration? decoration;

  /// {@macro flutter.widgets.editableText.keyboardType}
  final TextInputType? keyboardType;

  /// The type of action button to use for the keyboard.
  ///
  /// Defaults to [TextInputAction.newline] if [keyboardType] is
  /// [TextInputType.multiline] and [TextInputAction.done] otherwise.
  final TextInputAction? textInputAction;

  /// {@macro flutter.widgets.editableText.textCapitalization}
  final TextCapitalization textCapitalization;

  /// The style to use for the text being edited.
  ///
  /// This text style is also used as the base style for the [decoration].
  ///
  /// If null, defaults to the `subtitle1` text style from the current [Theme].
  final TextStyle? style;

  /// {@macro flutter.widgets.editableText.strutStyle}
  final StrutStyle? strutStyle;

  /// {@macro flutter.widgets.editableText.textAlign}
  final TextAlign textAlign;

  /// {@macro flutter.widgets.inputDecorator.textAlignVertical}
  final TextAlignVertical? textAlignVertical;

  /// {@macro flutter.widgets.editableText.textDirection}
  final TextDirection? textDirection;

  /// {@macro flutter.widgets.editableText.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.editableText.obscuringCharacter}
  // final String obscuringCharacter;

  /// {@macro flutter.widgets.editableText.obscureText}
  final bool obscureText;

  /// {@macro flutter.widgets.editableText.autocorrect}
  final bool autocorrect;

  /// {@macro flutter.services.textInput.smartDashesType}
  final SmartDashesType? smartDashesType;

  /// {@macro flutter.services.textInput.smartQuotesType}
  final SmartQuotesType? smartQuotesType;

  /// {@macro flutter.services.textInput.enableSuggestions}
  final bool enableSuggestions;

  /// {@macro flutter.widgets.editableText.maxLines}
  final int maxLines;

  /// {@macro flutter.widgets.editableText.minLines}
  final int? minLines;

  /// {@macro flutter.widgets.editableText.expands}
  final bool expands;

  /// {@macro flutter.widgets.editableText.readOnly}
  final bool readOnly;

  /// Configuration of toolbar options.
  ///
  /// If not set, select all and paste will default to be enabled. Copy and cut
  /// will be disabled if [obscureText] is true. If [readOnly] is true,
  /// paste and cut will be disabled regardless.
  final ToolbarOptions? toolbarOptions;

  /// {@macro flutter.widgets.editableText.showCursor}
  final bool? showCursor;

  /// If [maxLength] is set to this value, only the "current input length"
  /// part of the character counter is shown.
  static const int noMaxLength = -1;

  /// The maximum number of characters (Unicode scalar values) to allow in the
  /// text field.
  ///
  /// If set, a character counter will be displayed below the
  /// field showing how many characters have been entered. If set to a number
  /// greater than 0, it will also display the maximum number allowed. If set
  /// to [TextField.noMaxLength] then only the current character count is displayed.
  ///
  /// After [maxLength] characters have been input, additional input
  /// is ignored, unless [maxLengthEnforcement] is set to false. The text field
  /// enforces the length with a [LengthLimitingTextInputFormatter], which is
  /// evaluated after the supplied [inputFormatters], if any.
  ///
  /// This value must be either null, [TextField.noMaxLength], or greater than 0.
  /// If null (the default) then there is no limit to the number of characters
  /// that can be entered. If set to [TextField.noMaxLength], then no limit will
  /// be enforced, but the number of characters entered will still be displayed.
  ///
  /// Whitespace characters (e.g. newline, space, tab) are included in the
  /// character count.
  ///
  /// If [maxLengthEnforcement] is set to false, then more than [maxLength]
  /// characters may be entered, but the error counter and divider will
  /// switch to the [decoration.errorStyle] when the limit is exceeded.
  ///
  /// ## Limitations
  ///
  /// The text field does not currently count Unicode grapheme clusters (i.e.
  /// characters visible to the user), it counts Unicode scalar values, which
  /// leaves out a number of useful possible characters (like many emoji and
  /// composed characters), so this will be inaccurate in the presence of those
  /// characters. If you expect to encounter these kinds of characters, be
  /// generous in the maxLength used.
  ///
  /// For instance, the character "Ã¶" can be represented as '\u{006F}\u{0308}',
  /// which is the letter "o" followed by a composed diaeresis "Â¨", or it can
  /// be represented as '\u{00F6}', which is the Unicode scalar value "LATIN
  /// SMALL LETTER O WITH DIAERESIS". In the first case, the text field will
  /// count two characters, and the second case will be counted as one
  /// character, even though the user can see no difference in the input.
  ///
  /// Similarly, some emoji are represented by multiple scalar values. The
  /// Unicode "THUMBS UP SIGN + MEDIUM SKIN TONE MODIFIER", "ðŸ‘ðŸ½", should be
  /// counted as a single character, but because it is a combination of two
  /// Unicode scalar values, '\u{1F44D}\u{1F3FD}', it is counted as two
  /// characters.
  ///
  /// See also:
  ///
  ///  * [LengthLimitingTextInputFormatter] for more information on how it
  ///    counts characters, and how it may differ from the intuitive meaning.
  final int? maxLength;

  /// If true, prevents the field from allowing more than [maxLength]
  /// characters.
  ///
  /// If [maxLength] is set, [maxLengthEnforcement] indicates whether or not to
  /// enforce the limit, or merely provide a character counter and warning when
  /// [maxLength] is exceeded.
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// {@macro flutter.widgets.editableText.onChanged}
  ///
  /// See also:
  ///
  ///  * [inputFormatters], which are called before [onChanged]
  ///    runs and can validate and change ("format") the input value.
  ///  * [onEditingComplete], [onSubmitted], [onSelectionChanged]:
  ///    which are more specialized input change notifications.
  final ValueChanged<String>? onChanged;

  /// {@macro flutter.widgets.editableText.onEditingComplete}
  final VoidCallback? onEditingComplete;

  /// {@macro flutter.widgets.editableText.onSubmitted}
  ///
  /// See also:
  ///
  ///  * [EditableText.onSubmitted] for an example of how to handle moving to
  ///    the next/previous field when using [TextInputAction.next] and
  ///    [TextInputAction.previous] for [textInputAction].
  final ValueChanged<String>? onSubmitted;

  /// {@macro flutter.widgets.editableText.inputFormatters}
  final List<TextInputFormatter>? inputFormatters;

  /// If false the text field is "disabled": it ignores taps and its
  /// [decoration] is rendered in grey.
  ///
  /// If non-null this property overrides the [decoration]'s
  /// [Decoration.enabled] property.
  final bool? enabled;

  /// {@macro flutter.widgets.editableText.cursorWidth}
  final double cursorWidth;

  /// {@macro flutter.widgets.editableText.cursorHeight}
  // final double cursorHeight;

  /// {@macro flutter.widgets.editableText.cursorRadius}
  final Radius? cursorRadius;

  /// The color to use when painting the cursor.
  ///
  /// Defaults to [TextSelectionThemeData.cursorColor] or [CupertinoTheme.primaryColor]
  /// depending on [ThemeData.platform].
  final Color? cursorColor;

  /// Controls how tall the selection highlight boxes are computed to be.
  ///
  /// See [ui.BoxHeightStyle] for details on available styles.
  final ui.BoxHeightStyle selectionHeightStyle;

  /// Controls how wide the selection highlight boxes are computed to be.
  ///
  /// See [ui.BoxWidthStyle] for details on available styles.
  final ui.BoxWidthStyle selectionWidthStyle;

  /// The appearance of the keyboard.
  ///
  /// This setting is only honored on iOS devices.
  ///
  /// If unset, defaults to the brightness of [ThemeData.primaryColorBrightness].
  final Brightness? keyboardAppearance;

  /// {@macro flutter.widgets.editableText.scrollPadding}
  final EdgeInsets scrollPadding;

  /// {@macro flutter.widgets.editableText.enableInteractiveSelection}
  final bool enableInteractiveSelection;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// {@template flutter.material.textField.onTap}
  /// Called for each distinct tap except for every second tap of a double tap.
  ///
  /// The text field builds a [GestureDetector] to handle input events like tap,
  /// to trigger focus requests, to move the caret, adjust the selection, etc.
  /// Handling some of those events by wrapping the text field with a competing
  /// GestureDetector is problematic.
  ///
  /// To unconditionally handle taps, without interfering with the text field's
  /// internal gesture detector, provide this callback.
  ///
  /// If the text field is created with [enabled] false, taps will not be
  /// recognized.
  ///
  /// To be notified when the text field gains or loses the focus, provide a
  /// [focusNode] and add a listener to that.
  ///
  /// To listen to arbitrary pointer events without competing with the
  /// text field's internal gesture detector, use a [Listener].
  /// {@endtemplate}
  final GestureTapCallback? onTap;

  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// widget.
  ///
  /// If [mouseCursor] is a [MaterialStateProperty<MouseCursor>],
  /// [MaterialStateProperty.resolve] is used for the following [MaterialState]s:
  ///
  ///   [MaterialState.error].
  ///   [MaterialState.hovered].
  ///   [MaterialState.focused].
  ///   [MaterialState.disabled].
  ///
  /// If this property is null, [MaterialStateMouseCursor.textable] will be used.
  ///
  /// The [mouseCursor] is the only property of [TextField] that controls the
  /// appearance of the mouse pointer. All other properties related to "cursor"
  /// stand for the text cursor, which is usually a blinking vertical line at
  /// the editing position.
  // final MouseCursor mouseCursor;

  /// Callback that generates a custom [InputDecorator.counter] widget.
  ///
  /// See [InputCounterWidgetBuilder] for an explanation of the passed in
  /// arguments.  The returned widget will be placed below the line in place of
  /// the default widget built when [counterText] is specified.
  ///
  /// The returned widget will be wrapped in a [Semantics] widget for
  /// accessibility, but it also needs to be accessible itself.  For example,
  /// if returning a Text widget, set the [semanticsLabel] property.
  ///
  /// {@tool snippet}
  /// ```dart
  /// Widget counter(
  ///   BuildContext context,
  ///   {
  ///     int currentLength,
  ///     int maxLength,
  ///     bool isFocused,
  ///   }
  /// ) {
  ///   return Text(
  ///     '$currentLength of $maxLength characters',
  ///     semanticsLabel: 'character count',
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  ///
  /// If buildCounter returns null, then no counter and no Semantics widget will
  /// be created at all.
  final InputCounterWidgetBuilder? buildCounter;

  /// {@macro flutter.widgets.editableText.scrollPhysics}
  final ScrollPhysics? scrollPhysics;

  /// {@macro flutter.widgets.editableText.scrollController}
  final ScrollController? scrollController;

  /// {@macro flutter.widgets.editableText.autofillHints}
  /// {@macro flutter.services.autofill.autofillHints}
  // final Iterable<String> autofillHints;

  // Text that shows as hintText for textField
  final String defaultHintText;

  // The animation duration used for reveal
  final Duration revealAnimationDuration;
  // The curve used for the reveal animation
  final Curve revealAnimationCurve;

  // The widget used for the search button
  // default is Icon(Icons.search)
  final Widget searchButtonIcon;

  // The colour of the search bar container
  final Color searchContainerColor;
  // The icon used for the cleartext icon button
  final Icon clearBtnIcon;
  // The widget used for the back arrow button
  // Icon(Icons.arrow_back)
  final Icon backBtnIcon;

  AppBarTextField({
    Key? key,
    this.trailingActionButtons,
    this.leadingActionButtons,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    // this.shadowColor,
    this.shape,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    // this.leadingWidth,
    this.controller,
    this.focusNode,
    this.decoration,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = true,
    // this.obscuringCharacter = 'â€¢',
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement = MaxLengthEnforcement.enforced,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    // this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    this.onTap,
    // this.mouseCursor,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    // this.autofillHints,
    this.keyboardType,
    this.smartDashesType,
    this.smartQuotesType,
    this.toolbarOptions,
    this.defaultHintText = 'Search...',
    this.revealAnimationDuration = const Duration(milliseconds: 250),
    this.revealAnimationCurve = Curves.easeIn,
    this.searchButtonIcon = const Icon(Icons.search),
    this.searchContainerColor = Colors.lightBlueAccent,
    this.clearBtnIcon = const Icon(Icons.close),
    this.backBtnIcon = const Icon(Icons.arrow_back),
    this.onBackPressed,
    this.onClearPressed,
  })  : preferredSize = Size.fromHeight(toolbarHeight ??
            kToolbarHeight + (bottom?.preferredSize.height ?? 0.0)),
        super(key: key);

  @override
  _AppBarTextFieldState createState() => _AppBarTextFieldState();
}

class _AppBarTextFieldState extends State<AppBarTextField>
    with SingleTickerProviderStateMixin {
  SearchState _searchState = SearchState.title;

  late Animation<double> _revealAnimation;
  late AnimationController _revealAnimationController;
  final GlobalKey _appBarKey = GlobalKey();
  final GlobalKey _searchIconBtnKey = GlobalKey();
  late TextEditingController _textController;
  bool _showClearButton = false;
  Offset? _searchBtnPosition;

  @override
  void initState() {
    super.initState();

    _textController = widget.controller ?? TextEditingController();

    // ignore: unnecessary_this
    this._textController.addListener(_onTextController);

    _revealAnimationController = AnimationController(
      vsync: this,
      duration: widget.revealAnimationDuration,
    );

    _revealAnimation = CurvedAnimation(
      parent: _revealAnimationController,
      curve: widget.revealAnimationCurve,
    );

    // Clear the text when the animation has opened/closed
    _revealAnimationController.addListener(() {
      if (_revealAnimationController.isCompleted) {
        // ignore: unnecessary_this
        this._textController.clear();
      }
    });
  }

  void _onTextController() {
    if (_textController.text.isNotEmpty && !_showClearButton) {
      setState(() {
        _showClearButton = true;
      });
    } else if (_textController.text.isEmpty && _showClearButton) {
      setState(() {
        _showClearButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
          key: _appBarKey,
          title: widget.title,
          leading: widget.leading,
          automaticallyImplyLeading: widget.automaticallyImplyLeading,
          flexibleSpace: widget.flexibleSpace,
          bottom: widget.bottom,
          elevation: widget.elevation,
          // shadowColor: widget.shadowColor,
          shape: widget.shape,
          backgroundColor: widget.backgroundColor,
          brightness: widget.brightness,
          iconTheme: widget.iconTheme,
          actionsIconTheme: widget.actionsIconTheme,
          textTheme: widget.textTheme,
          primary: widget.primary,
          centerTitle: widget.centerTitle,
          excludeHeaderSemantics: widget.excludeHeaderSemantics,
          titleSpacing: widget.titleSpacing,
          toolbarOpacity: widget.toolbarOpacity,
          bottomOpacity: widget.bottomOpacity,
          // toolbarHeight: widget.toolbarHeight,
          // leadingWidth: widget.leadingWidth,
          actions: <Widget>[
            ...widget.leadingActionButtons ?? [Container()],
            _searchButton(),
            ...widget.trailingActionButtons ?? [Container()],
          ],
        ),
        Positioned.fill(child: _buildSearchTitle()),
      ],
    );
  }

  Widget _searchButton() {
    return IconButton(
        key: _searchIconBtnKey,
        icon: widget.searchButtonIcon,
        onPressed: () {
          _onSearchPressed();
        },);
  }

  void _onBackPressed() {
    if (widget.onBackPressed != null) {
      widget.onBackPressed!();
    }

    _onSearchPressed();
  }

  void _onSearchPressed() {
    final RenderBox renderBoxAppBar =
        // ignore: cast_nullable_to_non_nullable
        _appBarKey.currentContext!.findRenderObject() as RenderBox;
    final Size appBarSize = renderBoxAppBar.size;

    final RenderBox renderBoxSearchBtn =
        // ignore: cast_nullable_to_non_nullable
        _searchIconBtnKey.currentContext!.findRenderObject() as RenderBox;
    final Size btnSize = renderBoxSearchBtn.size;

    // Get the position of the search button widget,
    final offset = renderBoxSearchBtn.localToGlobal(btnSize.center(Offset.zero));
    final offsetAppBar =
        renderBoxAppBar.localToGlobal(appBarSize.center(Offset.zero));
    // ignore: unnecessary_this
    this._searchBtnPosition = Offset(offset.dx, offsetAppBar.dy);

    // ignore: unnecessary_this
    int oldIndex = this._searchState.index;
    final int newIndex = oldIndex = 1 - oldIndex;

    setState(() {
      // ignore: unnecessary_this
      this._searchState = SearchState.values[newIndex];

      // ignore: unnecessary_this
      this._searchState == SearchState.searching
          ? _revealAnimationController.forward()
          : _revealAnimationController.reverse();
    });
  }

  // ignore: long-method
  Widget _buildSearchTitle() {
    return SafeArea(
      child: CircularRevealAnimation(
        animation: _revealAnimation,
        centerOffset: _searchBtnPosition,
        child: Container(
          color: widget.searchContainerColor,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            // ignore: avoid_redundant_argument_values
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: widget.backBtnIcon,
                onPressed: () {
                  _onBackPressed();
                },
              ),
              Expanded(
                child: TextField(
                  controller: _textController,
                  focusNode: widget.focusNode,
                  decoration: widget.decoration ??
                      InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            top: kdefaultDecorationHeightOffset,),
                        hintText: widget.defaultHintText,
                      ),
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.textInputAction,
                  textCapitalization: widget.textCapitalization,
                  style: widget.style,
                  strutStyle: widget.strutStyle,
                  textAlign: widget.textAlign,
                  textAlignVertical: widget.textAlignVertical,
                  textDirection: widget.textDirection,
                  readOnly: widget.readOnly,
                  toolbarOptions: widget.toolbarOptions,
                  showCursor: widget.showCursor,
                  autofocus: widget.autofocus,
                  // obscuringCharacter: widget.obscuringCharacter,
                  obscureText: widget.obscureText,
                  autocorrect: widget.autocorrect,
                  smartDashesType: widget.smartDashesType,
                  smartQuotesType: widget.smartQuotesType,
                  enableSuggestions: widget.enableSuggestions,
                  maxLines: widget.maxLines,
                  minLines: widget.minLines,
                  expands: widget.expands,
                  maxLength: widget.maxLength,
                  maxLengthEnforcement: widget.maxLengthEnforcement,
                  onChanged: widget.onChanged,
                  onEditingComplete: widget.onEditingComplete,
                  onSubmitted: widget.onSubmitted,
                  inputFormatters: widget.inputFormatters,
                  enabled: widget.enabled,
                  cursorWidth: widget.cursorWidth,
                  // cursorHeight: widget.cursorHeight,
                  cursorRadius: widget.cursorRadius,
                  cursorColor: widget.cursorColor,
                  selectionHeightStyle: widget.selectionHeightStyle,
                  selectionWidthStyle: widget.selectionWidthStyle,
                  keyboardAppearance: widget.keyboardAppearance,
                  scrollPadding: widget.scrollPadding,
                  dragStartBehavior: widget.dragStartBehavior,
                  enableInteractiveSelection: widget.enableInteractiveSelection,
                  onTap: widget.onTap,
                  // mouseCursor: widget.mouseCursor,
                  buildCounter: widget.buildCounter,
                  scrollController: widget.scrollController,
                  scrollPhysics: widget.scrollPhysics,
                  // autofillHints: widget.autofillHints,
                ),
              ),
              _buildClearButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClearButton() {
    if (!_showClearButton) {
      return Container();
    }

    return IconButton(
      icon: widget.clearBtnIcon,
      onPressed: () {
        //Clear pressed feedback
        if (widget.onClearPressed != null) {
          widget.onClearPressed!();
        }

        // Text is cleared
        if (widget.onChanged != null) {
          widget.onChanged!('');
        }

        // ignore: unnecessary_this
        this._textController.clear();
        _showClearButton = false;
      },
    );
  }

  @override
  void dispose() {
    _revealAnimationController.dispose();
    super.dispose();
  }
}
