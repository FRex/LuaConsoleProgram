local pprint = require 'pprint'

pprint.setup{show_all = true, wrap_string = false}
demo.setPrettifier(pprint.pformat)

local oldecho = echo --we need old echo to send string we format in echo
function echo(...) --echo takes one str arg, we define better one here
    local arg = {...}
    local count = select('#', ...)
    for i=1, count do arg[i] = pprint.pformat(arg[i]) end --we need strs for concat
    oldecho(table.concat(arg, ' '))
end

function printf(format, ...) --just for convinence
    oldecho(format:format(...))
end

print = echo

return true --return false or nothing to not show console on init
