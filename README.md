# dotfiles
<!-- ![](https://img.shields.io/badge/works%20on-RedHat-00AAD4.svg) -->
![](https://img.shields.io/badge/works%20on-MacOS-lightgrey.svg)
[![license](https://img.shields.io/github/license/naoto0822/dotfiles.svg)](https://github.com/naoto0822/dotfiles/blob/master/LICENSE)
[![CircleCI](https://circleci.com/gh/naoto0822/dotfiles.svg?style=svg)](https://circleci.com/gh/naoto0822/dotfiles)

<img src="./docs/screenshot.png" width="800" height="400">

## Getting Started

### before manual settings

1. tmp disable sleep on mac

2. install iterm2

[here](https://www.iterm2.com/)

2. set Solarized Dark in iTerm2

3. login AppStore for Homebrew

4. kick `make bootstrap`

- install command line tools
- change permission zsh dir

5. generate and set a ssh key for github

### install

```sh
$ git clone git@github.com:naoto0822/dotfiles.git --recursive
$ cd dotfiles
$ make install
```
### after manual settings

1. restart iTerm2 and start installing zinit plugins

2. exec `p10k configure`

> not override settings

3. open vim and exec `:PlugInstall`

4. install go, node, ruby... by goenv, nodebrew, rbenv

### update

```sh
$ make update
```

## Requirements

- zsh
- vim8
- macOS
- iTerm2 (Solarized Dark)

## TODO

- [ ] for RedHat
- [ ] build multi OS in GH action
- [ ] update CircleCI ver2

## License

```
MIT License

Copyright (c) 2017 naoto yamaguchi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
