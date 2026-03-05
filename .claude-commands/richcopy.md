Copy your most recent markdown output as rich text to the macOS clipboard.

Do this in exactly one step — run this single bash command with no other commentary:

```
pbpaste | cmark --to html > /tmp/richcopy.html && textutil -convert rtf /tmp/richcopy.html -output /tmp/richcopy.rtf && osascript -e 'set the clipboard to (read (POSIX file "/tmp/richcopy.rtf") as «class RTF »)'
```

Then confirm: "Rich text copied to clipboard."

IMPORTANT: The user should run /copy first to put markdown on the clipboard. Then run this command immediately — do not write any files or do any other processing beyond this one bash command.
