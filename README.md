<div align="center">

<img src="https://github.com/user-attachments/assets/7e351130-2cdd-45f5-9921-7a67026c3663" width="350px">

# `NiTch`

<h3>
  My fork of the incredibly fast system fetch written in <code>nim👑</code>
</h3>
<br>

![Maintenance](https://shields.io/maintenance/yes/2025?style=for-the-badge)
![License](https://shields.io/github/license/nijon4rch/pngitch?style=for-the-badge)

![GitHub Repo stars](https://img.shields.io/github/stars/nijon4rch/pngitch?style=for-the-badge)
![GitHub issues](https://img.shields.io/github/issues/nijon4rch/pngitch?style=for-the-badge)
![GitHub pull requests](https://img.shields.io/github/issues-pr/nijon4rch/pngitch?style=for-the-badge)

![GitHub release (latest by date)](https://img.shields.io/github/v/release/nijon4rch/pngitch?style=for-the-badge)

</div>

# Description 📖

<img src="https://github.com/user-attachments/assets/6179db79-d3cb-40c3-bb99-2d2a3e1bbe1d" width="42%" align="right">

My fork of https://github.com/ssleert/nitch with support for rendering png logo with kitty image protocol and a few changed modules.
>[!WARNING]
> It is suggested to use square images as logo; Wide rectangular images will overlap the fetch.

>[!NOTE]
> I've made this fork primarily for myself. AI help was used in creation of some code. At some point I decided that it may be worth to publish on Github, so I've polished it a little, added some comments, and here you go!

If you want to contribute <s>for some reason</s>, you're welcome! :)

`nitch` is a small and incredibly fast system fetch written fully in `nim👑` without any dependencies, on my PC
it executes in around 10 miliseconds.

>[!NOTE]
> My PC is slower than original autor's; However, my fork is slower too 😔
> It takes around 4ms to execute original nitch on my system, 10ms for my version and 12ms with image logo.

btw written in `nim👑`

why `nim👑`? because it's fast and simple

<br>

# Usage 🪨
```
nitch
```

flags:
```
  -a --ascii               | return fetch with ascii art
  -l --logo <path_to_png>  | return fetch with png logo
  -h --help                | return help message
  -v --version             | return version of program
```

<br>

# Configuration ⚙️
### `nitch` is configured by changing the source code
### `src/funcs/drawing.nim` - config file

# Building 📦
### 0) install [nim](https://nim-lang.org/)

### 1) clone repo
```fish
git clone https://github.com/nijon4rch/pngitch.git
```
### 2) change dir to `nitch`
```fish
cd nitch/
```

### 3) build program with `nimble`
```fish
nimble build
```
After that you will get a binary file in the root directory of the project.

<br>

# Thanks for the original project
- [nitch](https://github.com/ssleert/nitch)
# Thanks for ideas & examples 💬
- [pfetch](https://github.com/dylanaraps/pfetch/)
- [neofetch](https://github.com/dylanaraps/neofetch)
- [paleofetch](https://github.com/ss7m/paleofetch)
- [rxfetch](https://github.com/Mangeshrex/rxfetch)
- [nerdfetch](https://github.com/ThatOneCalculator/NerdFetch)
