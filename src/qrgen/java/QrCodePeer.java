//
// Copyright (c) 2023, Novant LLC
// Licensed under the MIT License
//
// History:
//   20 Sep 2023  Andy Frank  Creation
//

package fan.qrgen;

public class QrCodePeer
{
  public static QrCodePeer make(QrCode self)
  {
    return new QrCodePeer();
  }

  public static QrCode encodeStr(String s)
  {
    QrCode fcode = QrCode.make();
    fcode.peer.jcode = JQrCode.encodeText(s, JQrCode.Ecc.MEDIUM);
    return fcode;
  }

  long version(QrCode self) { return jcode.version; }

  long size(QrCode self) { return jcode.size; }

  boolean moduleAt(QrCode self, long x, long y)
  {
    return jcode.getModule((int)x, (int)y);
  }

  private JQrCode jcode;
}

