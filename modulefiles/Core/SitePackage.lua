-- @module SitePackage
require("strict")


function url_quote(str)
  if (str) then
    str = string.gsub (str, "\n", "\r\n")
    str = string.gsub (str, "([^%w %-%_%.%~])",
        function (c) return string.format ("%%%02X", string.byte(c)) end)
    str = string.gsub (str, " ", "+")
  end
  return str    
end


function get_project(str)
    if (str) then
        for match in string.gmatch(str, "ProjectName%s+=%s+\"(.-)\"") do
            return match
        end
    end
    return ''
end

function get_username(str)
    if (str) then
        for match in string.gmatch(str, "Owner%s+=%s+\"(%S-)\"") do
            print(match, "----", "\n")
            return match
        end
        for match in string.gmatch(str, "Owner%s+=%s+\"(%S-)@%S-\"") do
            print(match, "----", "\n")
            return match
        end
    end
    return ''
end

function get_site(str)
    if (str) then
        for match in string.gmatch(str, "JOBGLIDEIN_ResourceName%s+=%s+\"(%S-)\"") do
            return match
        end
        for match in string.gmatch(str, "GLIDEIN_Site%s+=%s+\"(%S-)\"") do
            return match
        end
    end
    return ''
end

-- By using the hook.register function, this function "load_hook" is called
-- ever time a module is loaded with the file name and the module name.

function report_load(module_name)
   -- software name should be the name of the 
   -- software that should be reported
   -- e.g. "R/3.3.2"

   local username = os.getenv("OSGVO_SUBMITTER")
   if username == nil then
      username = 'UNAVAILABLE'
   end
   local project = os.getenv("OSGVO_PROJECT_NAME")
   if project == nil then
      project = 'UNAVAILABLE'
   end
   local site = os.getenv("OSG_SITE_NAME")
   if site == nil then
      site = 'UNAVAILABLE'
   end
   local fhandle = io.popen('/bin/hostname -f', 'r')
   local host = fhandle:read()
   fhandle:close()
   if host == nil then
      host = 'UNAVAILABLE'
   end

   local classads = ''
   local condor_classad_file = os.getenv('_CONDOR_JOB_AD')
   if condor_classad_file ~= nil then
       local f = io.open(condor_classad_file, 'r')
       classads = f:read("*all")
   end
   condor_classad_file = os.getenv('_CONDOR_MACHINE_AD')
   if condor_classad_file ~= nil then
       local f = io.open(condor_classad_file, 'r')
       classads = classads .. f:read("*all")
   end

   if classads ~= nil then
       local test_username = get_username(classads)
       if test_username ~= '' then
           username = test_username
       end
       if site == 'UNAVAILABLE' then
           site = get_site(classads)
       end
       if project == 'UNAVAILABLE' then
           project = get_project(classads)
       end
   end
   if username ~= '' and module_name ~= '' then
      -- We don't want failure to log to block jobs or give errors. Make an
      -- effort to log things, but ignore anything that goes wrong. Also do
      -- not wait on the subprocess.
      local http = require("socket.http")
      http.TIMEOUT = 30
      local uri = 'http://modules.ci-connect.net/register_module2.wsgi?'
      uri = uri .. 'user=' .. url_quote(username)
      uri = uri .. '&project=' .. url_quote(project)
      uri = uri .. '&module=' .. url_quote(module_name)
      uri = uri .. '&site=' .. url_quote(site)
      uri = uri .. '&host=' .. url_quote(host)
      http.request(uri)
   end
end

sandbox_registration { report_load = report_load }

