# Package

version       = "0.0.1"
author        = "Nikita Bliznyuk"
description   = "Core of Moba Manager"
license       = "MIT"
srcDir        = "src"

# Dependencies

requires "nim >= 1.6.0"

# Tasks

task debug, "Compile debug library":
  exec "nim c --app:staticlib --processing:filenames --out:build/mmcore.a src/mmcore"
