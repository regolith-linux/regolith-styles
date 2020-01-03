# regolith-styles

A convention for organizing Xresource-based theme data.

# Overview

Regolith relies on a number of UI components that consume stand-alone theme information to determine how they look.  Some of these components support the Xresource facility to read this theme information.  In some cases the Xresource keys are predetermined by the program (such as st-term), in others, we must provide a mapping between a native theme value and the Xresource key (as is with i3-wm).  In other cases the UI component has no built-in ability to read from Xresources so we use glue scripts and Xresource utilities such as `xrdb` or `xrescat` to load values as needed.  

This repo defines a structure for Xresource key/value pairs that decomposes into two layers: an application layer, and a value layer.

## Application Layer

Files are named by the UI component they provide Xresources values for, such as `i3-wm` or `gnome`.  These files map the application specific keys to more general `#defines` which are then transformed into literal values via the c-preprocessor built into Xresources.

## Value Layer

A set of files organized by theme are defined which map general keys to specific values.  This is done so that changing the mappings of values can live in one place, and all applications that rely on those values can take a new value without having to be modified piece by piece.

## Example

A simplified example.  Let's say we have a few UI components; a menu and a clock.  We would like to define Xresource values for this UI comonents.  The simplest, most direct way would be something like:

```
menu.color.background: black
menu.color.foreground: white
clock.color.background: black
clock.color.foreground: white
```

Now let's say we'd like to update our whole UI to make the background color blue.  We the need to edit the file and find all places where `black` is referenced and swap it to `blue`:

```
menu.color.background: blue
menu.color.foreground: white
clock.color.background: blue
clock.color.foreground: white
```

In this case, it's straight forward to edit as needed.  However, real-world systems are more complex, and users may choose to mix and match UI components based on their preferences.  So, rather than having one monolithic file that defines the superset of all possible UI components, it's better to decompose them into seperate files.  This allows the user to only define and manage mappings they care about:

### root.xres
```
#include menu.xres
#include clock.xres
```

### menu.xres
```
menu.color.background: blue
menu.color.foreground: white
```

### clock.xres
```
clock.color.background: blue
clock.color.foreground: white
```

So if the user chooses to remove the clock, they can also remove the Xresource file cleanly without impacting other theme data.  However, now we have multiple files in which we need to make edits if we desire to change a theme element, such as a color or typeface.  This problem compounds with each additional UI component we add to our desktop environment.  To resolve this, we decompose the values into seperate files, as describe above.  One file for the application, and another for the general description of the thematic element, such as a color or typeface:

### root.xres
```
#include myfavoritecolors.xres
#include menu.xres
#include clock.xres
```

### myfavoritecolors.xres
```
#define BACKGROUND_COLOR black
#define FOREGROUND_COLOR white
```

### menu.xres
```
menu.color.background: BACKGROUND_COLOR
menu.color.foreground: FOREGROUND_COLOR
```

### clock.xres
```
clock.color.background: BACKGROUND_COLOR
clock.color.foreground: FOREGROUND_COLOR
```

And so with this additional layer of indirection, we are now able to define multiple color files, and simply toggle which one we desire in our root Xresources file.  All application Xresource files will pick up the desired value complements of the C preprosessor which performs the substitution when the files are parsed.  This in essence the convention that `regolith-styles` defines.  In this repo, the `Xresources` directory contains the application files, and other directories such as `cahuella` define a set of value files.

NOTE: This convention is just that, a convention.  Users are free to implement their Xresource files however they see fit.  As long as the required values can be read via `xrescat`, there is nothing else that needs to be of concern.  If you prefer to put all of your Xresource key/value pairs in one big file, by all means do that.   

# Looks

Based on the abstraction of application and value layers, we then add on the notion of a "look", or a composite set of value files which together create a complete UI theme for a desktop environment.  Note, these are only value files, but taken together they allow users to easily switch their entire desktop look simply by referencing a Look's root file.  See `solarized-dark/root` as an example.