﻿$ErrorActionPreference = 'Stop'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'atomicparsley'
  unzipLocation = $toolsDir
  fileType      = 'ZIP' 
  url           = "$toolsDir\AtomicParsleyWindows.zip"
}

Install-ChocolateyZipPackage @packageArgs
Move-Item -Path "$toolsDir\Release\*.exe" -Destination "$toolsDir"
Remove-Item "$toolsDir\Release" -EA SilentlyContinue | Out-Null
Remove-Item "$toolsDir\*.zip" -EA SilentlyContinue | Out-Null
