# QrGen

A Fantom API for generating QR codes.

```fantom
// generate code
c := QrCode.encodeStr("Hello World")

// echo pixels to stdout
buf := StrBuf()
c.eachModule |x,y,v|
{
  buf.add(v ? "#" : " ")
  if (x == c.size-1) buf.add("\n")
}
echo(buf.toStr)

// stdout
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

This project is based on and includes code from [QR-Code-generator](https://github.com/nayuki/QR-Code-generator).