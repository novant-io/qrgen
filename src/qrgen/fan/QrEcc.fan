//
// Copyright (c) 2023, Novant LLC
// Licensed under the MIT License
//
// History:
//   21 Sep 2023  Andy Frank  Creation
//

*************************************************************************
** QrEcc
*************************************************************************

** QR error correction code levels.
enum class QrEcc
{
  ** Code can tolerate ~7% erroneous codewords.
  low,

  ** Code can tolerate ~15% erroneous codewords.
  medium,

  ** Code can tolerate ~30% erroneous codewords.
  high
}
