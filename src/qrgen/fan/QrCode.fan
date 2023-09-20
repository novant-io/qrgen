//
// Copyright (c) 2023, Novant LLC
// Licensed under the MIT License
//
// History:
//   20 Sep 2023  Andy Frank  Creation
//

*************************************************************************
** QrCode
*************************************************************************

class QrCode
{
  ** Encode the given string into a new 'QrCode' instance.
  static native QrCode encodeStr(Str text)

  ** Version of this code.
  native Int version()

  ** Width and height of this code measured in modules.
  native Int size()

  ** Iterate modules for this code.
  Void eachModule(|Int x, Int y, Bool v| f)
  {
    size.times |dy| {
      size.times |dx| {
        v := moduleAt(dx, dy)
        f(dx, dy, v)
      }
    }
  }

  private native Bool moduleAt(Int x, Int y)

  static Void test()
  {
    s := Env.cur.args.first ?: "Hello World"
    c := QrCode.encodeStr(s)
    echo(
      "## QR CODE ##
       version: $c.version
       size:    $c.size
       ")
    buf := StrBuf()
    ly := 0
    c.eachModule |x,y,v|
    {
      if (y != ly) buf.add("\n")
      ly = y
      buf.add(v ? "#" : " ")
    }
    echo(buf.toStr)
    echo("")
    echo("")
  }
}