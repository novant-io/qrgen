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

  ** Render this code to a PNG image. See `render` for details
  ** on the behavoir on 'w' and 'h'.
  Void renderPng(OutStream out, Int w, Int h)
  {
    img := RenderedImage(w, h)
    gx  := img.graphics

    // fill white for "light" modules
    gx.color = Color.white
    gx.fillRect(0f, 0f, img.size.w, img.size.h)

    // render code
    gx.color = Color.black
    this.render(img.graphics, 0f, 0f, w.toFloat, h.toFloat)

    // write file
    img.write(out, "png")
  }

  **
  ** Render this code to the given graphics context at the given
  ** offset and given scale factor. The current 'color' will be
  ** used for "dark" modules. The "light" modules will be left
  ** transparent.
  **
  ** This method will always scale on a even pixel boundry, which
  ** means target image may not match 'w' and 'h' exactly.  if
  ** rendered image is smaller than the requested size, it will
  ** be centered within the target bounds.
  **
  Void render(Graphics g, Float x, Float y, Float w, Float h)
  {
    // sanity checks
    if (w < size.toFloat) throw ArgErr("render width must be > size")
    if (h < size.toFloat) throw ArgErr("render height must be > size")

    // scale factor
    sx := (w / size.toFloat).floor
    sy := (h / size.toFloat).floor

    // center offset
    cx := (w - (size * sx)) / 2
    cy := (h - (size * sy)) / 2

    eachModule |mx, my, v|
    {
      // leave light modules transparent
      if (!v) return

      // dark module "pixel"
      dx := mx * sx
      dy := my * sy
      g.fillRect(x+cx+dx, y+cy+dy, sx, sy)
    }
  }

  private native Bool moduleAt(Int x, Int y)
}