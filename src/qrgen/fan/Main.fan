//
// Copyright (c) 2023, Novant LLC
// Licensed under the MIT License
//
// History:
//   20 Sep 2023  Andy Frank  Creation
//

const class Main
{
  Void main()
  {
    if (Env.cur.args.size < 2)
      abort("usage: fan qrgen <text> [--dump | --png <file>]")

    text := Env.cur.args.first
    ecc  := QrEcc.medium
    code := QrCode.encodeStr(text, ecc)

    op := Env.cur.args[1]
    switch (op)
    {
      case "--dump":
        dump(code, ecc, text)

      case "--png":
        file := Env.cur.args.getSafe(2)
        if (file == null) abort("Missing filename")
        out  := File.os(file).out
        // echo("# $code.size")
        code.renderPng(out, 256f, 256f)
        out.sync.close

      default:
        abort("Unknown option '${op}'")
    }
  }

  ** Dump code to stdout using '#' for dark modules.
  Void dump(QrCode code, QrEcc ecc, Str text)
  {
    // meta-data
    echo(
      "## QR CODE ##
         text: $text
         ver:  $code.version
         ecc:  $ecc
         size: $code.size
       ")

    buf := StrBuf()
    code.eachModule |x,y,v|
    {
      buf.add(v ? "#" : " ")
      if (x == code.size-1) buf.add("\n")
    }
    echo(buf.toStr)
  }

  Void abort(Str msg)
  {
    Env.cur.err.printLine(msg)
    Env.cur.exit(1)
  }
}