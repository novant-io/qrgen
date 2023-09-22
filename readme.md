# QrGen

<p>
  <img src="src/qrgen/doc/icon.png" style="width:160px" />
</p>

## Installation

Install into your current Fantom repo using fanr -- full API docs over on
[Eggbox](http://eggbox.fantomfactory.org/pods/qrgen):

$ fanr install qrgen

## Usage

A Fantom API for generating QR codes.

```fantom
c := QrCode.encodeStr("Hello World")
c.renderPng(out)
```

Command line utilties:

```bash
$ fan qrgen "Hello World" --png test.png

$ fan qrgen "Hello World" --dump
## QR CODE ##
  text: Hello World
  ver:  1
  ecc:  medium
  size: 21

#######    #  #######
#     # # ##  #     #
# ### # ####  # ### #
# ### #    #  # ### #
# ### #  #  # # ### #
#     #  ##   #     #
####### # # # #######
         ###
 ### ##   # #     ##
   ##  # ##  ###### #
## # ### #   # #   ##
 #####      #  # # #
# # ###### ####     #
        #  ## ##  # #
#######   # #####
#     # ## # # # ####
# ### #  # ##    ##
# ### # ##    #  ###
# ### # ##  #  #  #
#     # ## # ####   #
#######   ## ###  #
```

This project is based on and includes code from
[QR-Code-generator](https://github.com/nayuki/QR-Code-generator).