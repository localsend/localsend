# UX guidelines

Use these guidelines when changing the app's UI or interaction behavior. Preserve platform conventions unless LocalSend has a documented reason to differ.

## Interaction principles

- Keep the common path direct, but require an explicit choice when more than one primary action is available.
- Keep pointer, touch, and keyboard interactions consistent. Each input method should produce the same action and result.
- Prefer familiar platform behavior over custom interaction patterns.

## Keyboard interaction

- Tab and Shift+Tab move focus. Enter and Space activate the focused control.
- Escape dismisses a dismissible dialog or cancels the current transient interaction. It must not confirm an action or trigger a destructive action.
- A view with one unambiguous, safe primary action may focus that action initially or invoke it with an unmodified Enter key.
- When a view offers multiple primary actions, leave them without initial focus. Let the user choose an action through focus traversal before activation.
- Focus the main input when text entry is the clear purpose of a view.
- A view-level keyboard handler must yield to a focused child control so the control keeps its standard keyboard behavior.
- Use Enter for view-level default actions and Space for activating the focused control.
- Keep button labels focused on the action. Show keyboard shortcuts in desktop tooltips only when the action and shortcut are available.
