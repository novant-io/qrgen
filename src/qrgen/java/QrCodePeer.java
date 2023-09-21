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

  public static QrCode encodeStr(String s, QrEcc ecc)
  {
    JQrCode.Ecc jecc = JQrCode.Ecc.MEDIUM;
    switch ((int)ecc.ordinal())
    {
      case 0: jecc = JQrCode.Ecc.LOW;    break;
      case 1: jecc = JQrCode.Ecc.MEDIUM; break;
      case 2: jecc = JQrCode.Ecc.HIGH;   break;
    }

    System.out.println("# jecc -> " + jecc);

    QrCode fcode = QrCode.make();
    fcode.peer.jcode = JQrCode.encodeText(s, jecc);
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

