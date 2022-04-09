# keyboard

Explore the way to use hotkeys/window manager to control position and max/min app window in mac.

## hammerspoon

Set following [scottwhudson lunette](https://github.com/scottwhudson/Lunette)

Default Keybindings:

| CommandName  | (Chord) Activator |
| -------------|:-------------------:|
| `center`     | (⌥ ⌘) C          |
| `fullScreen` | (⌥ ⌘) F          |
| `leftHalf`   | (⌥ ⌘) ←          |
| `rightHalf`  | (⌥ ⌘) →          |
| `topHalf`    | (⌥ ⌘) ↑          |
| `bottomHalf` | (⌥ ⌘) ↓          |
| `topLeft`    | (⌃ ⌘) ←          |
| `bottomLeft` | (⌃ ⌘ ⇧) ←        |
| `topRight`   | (⌃ ⌘) →          |
| `bottomRight`| (⌃ ⌘ ⇧) →        |
| `nextDisplay`| (⌃ ⌥ ⌘) →        |
| `prevDisplay`| (⌃ ⌥ ⌘) ←        |
| `nextThird`  | (⌃ ⌥) →          |
| `prevThird`  | (⌃ ⌥) ←          |
| `enlarge`    | (⌃ ⌥ ⇧) →        |
| `shrink`     | (⌃ ⌥ ⇧) ←        |
| `undo`       | (⌥ ⌘) Z          |
| `redo`       | (⌥ ⌘ ⇧) Z        |

## kitty

Start to move to kitty as default terminal, utilise default kitty window management

### Scrolling

|Action           | Shortcut                                     |
|-----------------|:---------------------------------------------:|
|Scroll line up   | ctrl+shift+up (also ⌥+⌘+⇞ and ⌘+↑ on macOS)
|Scroll line down |ctrl+shift+down (also ⌥+⌘+⇟ and ⌘+↓ on macOS)
|Scroll page up   |ctrl+shift+page\_up (also ⌘+⇞ on macOS)
|Scroll page down |ctrl+shift+page\_down (also ⌘+⇟ on macOS)
|Scroll to top    |ctrl+shift+home (also ⌘+↖ on macOS)
|Scroll to bottom |ctrl+shift+end (also ⌘+↘ on macOS)

### Tabs

|Action            | Shortcut                                        |
|------------------|:------------------------------------------------:|
|New tab           | ctrl+shift+t (also ⌘+t on macOS)
|Close tab         | ctrl+shift+q (also ⌘+w on macOS)
|Next tab          | ctrl+shift+right (also ^+⇥ and ⇧+⌘+] on macOS)
|Previous tab      | trl+shift+left (also ⇧+^+⇥ and ⇧+⌘+\[ on macOS)
|Next layout       | ctrl+shift+l
|Move tab forward  | ctrl+shift+.
|Move tab backward | ctrl+shift+,
|Set tab title     | ctrl+shift+alt+t (also ⇧+⌘+i on macOS)

### Windows

|Action                | Shortcut                                 |
|----------------------|:-----------------------------------------:|
|New window            | ctrl+shift+enter (also ⌘+↩ on macOS)
|New OS window         | ctrl+shift+n (also ⌘+n on macOS)
|Close window          | ctrl+shift+w (also ⇧+⌘+d on macOS)
|Next window           | ctrl+shift+]
|Previous window       | ctrl+shift+\[
|Move window forward   | ctrl+shift+f
|Move window backward  | ctrl+shift+b
|Move window to top    | ctrl+shift+\`
|Focus specific window | ctrl+shift+1, ctrl+shift+2 … ctrl+shift+0 (also ⌘+1, ⌘+2 … ⌘+9 on macOS) (clockwise from the top-left)

## Reference

*   \[turn-your-keyboard-into-a-text-editing-rocket by Owen Caulfield] (
    https://medium.com/@caulfieldOwen/turn-your-keyboard-into-a-text-editing-rocket-1514d8474d2d#id\_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjAzMmIyZWYzZDJjMjgwNjE1N2Y4YTliOWY0ZWY3Nzk4MzRmODVhZGEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJuYmYiOjE2Mzc0NjAyMTksImF1ZCI6IjIxNjI5NjAzNTgzNC1rMWs2cWUwNjBzMnRwMmEyamFtNGxqZGNtczAwc3R0Zy5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsInN1YiI6IjExODA2NjY1MDE3NTQ3MDQxOTkzNiIsImVtYWlsIjoia2xlZS5qYXZhQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhenAiOiIyMTYyOTYwMzU4MzQtazFrNnFlMDYwczJ0cDJhMmphbTRsamRjbXMwMHN0dGcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJuYW1lIjoiS2V2aW4gTGVlIiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hL0FBVFhBSnhmaHFBUFBaTXZSZ1pLZkNIbWtUX2UxN3R0VUxwWG9KRjFmUGEyPXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IktldmluIiwiZmFtaWx5X25hbWUiOiJMZWUiLCJpYXQiOjE2Mzc0NjA1MTksImV4cCI6MTYzNzQ2NDExOSwianRpIjoiNTNjYmFkYjQ5ZDNiZWJhZjE5NWJmYTVlNDBhMzdhODIxNjQwOWYxZiJ9.m9tKY-uWOFWUCGQWCc1x20tCjYykcwod1Z6vGM9GGOYPrixNftKPZkF4A4YEz16\_5tsUAKVaxoP4nXzikUG5sgnO-T-XTvDMU1BE\_xCioas06CJSSPWTO8V1usP5MHDz5TjL-p9FTEF9pb65WOpwljOwNaE8i2WANHN9ZS\_jONO0tQcpJh1J8c-c38eGXKJt1JGe-yV\_vQYT8MCFvEYBj0zVaXJUTiCtmWS-1yMBoj8FPrmrrkTfpfppG2iY7zZK6vd-zlG7kUTQc-Oqn8QFJDsXETEcmmjBS7Sq1Xn1UBxZnf3NKZGtl7Xq2yQtHLFRNJrkzbLPKIF67p9HqQAd4Q)

*   https://github.com/jasonrudolph/keyboard

*   https://stevelosh.com/blog/2012/10/a-modern-space-cadet/#better-shifting

### command to install pynvim

\~/.pyenv/shims/python3 -m pip install pynvim
