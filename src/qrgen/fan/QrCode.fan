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

  ** Render this code to a PNG image.
  Void renderPng(OutStream out, Float w, Float h)
  {
    // create img
    mime := MimeType("image/png")
    size := Size(w, h)
    img  := Image.render(mime, size) |gx|
    {
      // fill white for "light" modules
      gx.color = Color.white
      gx.fillRect(0f, 0f, w, h)

      // render code
      gx.color = Color.black
      this.render(gx, 0f, 0f, w, h)
    }

    // write file
    img.write(out)
  }

  ** Render this code to the given graphics context at the given
  ** offset and size. The current 'color' will be used for "dark"
  ** modules. The "light" modules will be left transparent.
  Void render(Graphics g, Float x, Float y, Float w, Float h)
  {
    // scale factor
    sx := w / size.toFloat
    sy := h / size.toFloat

    // scale to fit bounds and render
    g.push(Rect(x, y, w, h))
    g.transform(Transform.scale(sx, sy))
    eachModule |mx, my, v| {
      if (v) g.fillRect(mx.toFloat, my.toFloat, 1f, 1f)
    }
    g.pop
  }

  private native Bool moduleAt(Int x, Int y)
}