//
// Copyright (c) 2023, Novant LLC
// Licensed under the MIT License
//
// History:
//   20 Sep 2023  Andy Frank  Creation
//

using graphics

*************************************************************************
** QrCode
*************************************************************************

const class QrCode
{
  ** Encode the given string into a new 'QrCode' instance.
  static native QrCode encodeStr(Str text, QrEcc ecc := QrEcc.medium)

  ** Version of this code.
  native Int version()

  ** Width and height of this code measured in modules.
  native Int size()

  ** Iterate modules for this code.
  Void eachModule(|Int x, Int y, Bool v| f)
  {
    size.times |my| {
      size.times |mx| {
        v := moduleAt(mx, my)
        f(mx, my, v)
      }
    }
  }

  ** Render this code to a PNG image
  Void renderPng(OutStream out, Int scale := 4)
  {
    isz := size * scale
    img := RenderedImage(isz, isz)
    gx  := img.graphics

    // fill white for "light" modules
    gx.color = Color.white
    gx.fillRect(0f, 0f, img.size.w, img.size.h)

    // render code
    gx.color = Color.black
    this.render(img.graphics, 0f, 0f, scale)

    // write file
    img.write(out, "png")
  }

  ** Render this code to the given graphics context at the given
  ** offset and given scale factor. The current 'color' will be
  ** used for "dark" modules. The "light" modules will be left
  ** transparent.
  Void render(Graphics g, Float x, Float y, Int scale := 4)
  {
    ss := scale.toFloat
    eachModule |mx, my, v|
    {
      // leave light modules transparent
      if (!v) return

      // dark module "pixel"
      sx := mx * scale
      sy := my * scale
      g.fillRect(x+sx, x+sy, ss, ss)
    }
  }

  private native Bool moduleAt(Int x, Int y)
}