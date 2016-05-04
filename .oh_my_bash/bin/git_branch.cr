#!/usr/bin/ruby

a = Process.run("git",["branch"], nil, false, false, nil, nil, nil,nil).to_s
s = a.match(/.*/)
puts s
