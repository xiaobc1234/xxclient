local bbstr = require "bblibs/StrUtilsAPI"
local http = require "bblibs/socket/http"
local ltn12 = require "bblibs/socket/ltn12"
local bbjson = require "bblibs/JSON"
require "init"


--上传图片方法
function postImg(url,file)
  sysLog(url)
  if url==nil or file==nil then return false end
  local resbody ={}
  local str = ''
  local boundary = 'abcde'
  --组建body  
  str = str .. "------------------------------" .. boundary .. "\r\n"  
  str = str .. 'Content-Disposition: form-data; name="img"; filename="img.png"\r\n'  
  str = str .. "Content-Type: image/png\r\n\r\n"  
  str = str .. file .. "\r\n"  
  str = str .. "------------------------------" .. boundary .. "--\r\n" 
  
  
  local _file = [[--abcde]].."\r\n"..[[Content-Disposition: form-data;name="img"; filename="img.png"]].."\r\n"..[[Content-Type: image/png]].."\r\n\r\n"..file
  local _end = "\r\n"..[[--abcde--]].."\r\n"
  
  local body,code,headers,status = http.request{
    url=url,
    method="POST",
    headers={
      ["Content-Type"]="multipart/form-data;boundary=abcde",
      ["Content-Length"]=#_file+#_end
    },
    sink=ltn12.sink.table(resbody),
    source=ltn12.source.cat(ltn12.source.string(_file),ltn12.source.string(_end))
    --    protocol="tlsv1"
  }
  
  
  --  sysLog(body)
  if code==200 then
    return resbody
  else
    return 'error'
  end
  
end



--截图并上传到服务器
function uploadSnapshot()
  
  -- 截图 
  local name="img"
  local snapshotname = name.."_"..os.date("%m-%d", os.time())..".png"
  sysLog(snapshotname)
  
  sysLog(h_.."---"..w_)
  local file ='[public]'..snapshotname
  
  snapshot(file,0,0,h_,w_)--截图
  
  while true do
    local filePoint = io.open(file,"rb")
    if filePoint then
      local fileData = filePoint:read("*a")
      filePoint:close()
      local res = postImg(httpHost..'/file/upload',fileData)
      
      while true do
        if res then 
          sysLog(res)
          break
        end
      end
      --    local imgBase64 = bbstr.toBase64(fileData)
      --    sysLog(imgBase64)
      break
    else
      if filePoint then
        filePoint:close()
      end
    end
    
  end
  
  
end






