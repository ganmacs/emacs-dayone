## emacs-dayone

## How to use

* Download and install dayone command line tool [here](https://dayone.zendesk.com/hc/en-us/articles/200258954-Day-One-Tools)
* Add this code on your `Cask` file

```lisp
(depends-on "emacs-dayone")
```

* Add this code on your `init.el` file

```lisp
(global-set-key (kbd "C-x C-d") 'emacs-dayone/save)
```
