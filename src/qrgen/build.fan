#! /usr/bin/env fan

using build

class Build : build::BuildPod
{
  new make()
  {
    podName = "qrgen"
    summary = "QR code generator library"
    version = Version("1.1")
    meta = [
      "org.name":     "Novant",
      "org.uri":      "https://novant.io/",
      "license.name": "MIT",
      "vcs.name":     "Git",
      "vcs.uri":      "https://github.com/novant-io/qrgen",
      "repo.public":  "true"
    ]
    depends = [
      "sys 1.0",
      "graphics 1.0",
    ]
    resDirs  = [`doc/`]
    srcDirs  = [`fan/`]
    javaDirs = [`java/`]
    docApi = true
    docSrc = true
  }
}