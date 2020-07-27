#!/usr/bin/env ruby
puts 'Notes on symbols'
puts <<EOF
 Symbols are very simple, useful programming language constructs
EOF

puts <<EOF
When you want some characters to stand for something, you simply need
to know if this is same as thad, quickly and reliablh. You use symbols.
EOF

puts <<EOF
Since we don't use symbols for data processing tasks, they lack
most of the classic string manipulation methiods.
EOF

a = :all
b = a
c = :all

puts a == c
puts a === c
puts a.eql?(c)
puts a.equal?(c)

puts <<EOF
Since ther can only be one instance of any fiven symbol, :all is always equal to itself
EOF

puts <<EOF
Since symbol comparision runs very fast, and never change, they make ideal hash keys.
EOF
