# QrGen

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