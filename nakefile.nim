import nake
import std / sequtils


const
  TestFolder = "tests/"


proc getFilesInFolder(folder: string): seq[string] {.inline.} =
  for file in walkDirRec(folder): result.add(file)
  result = result.filter(proc(x: string): bool = x.endsWith(".nim"))


task "echo-test-files", "Echo all test files":
  let files = getFilesInFolder(TestFolder)
  echo files


task "run-tests", "Run all tests":
  let files = getFilesInFolder(TestFolder)
  for file in files: discard shell(nimExe, "c", "-r" , "--path:.", "--hint:Link:off", "--hint:Conf:off", "--hint:SuccessX:off", file)
