#!/usr/bin/env ruby
# This chapter is about regular expressions
puts 'Notes for chapter5'
puts <<EOF
The idea behind the regular expression -- that you construct a pattern that either will or will not match some string - is as simple as regular expressions are powerfull
EOF

puts <<EOF
Some basics about regular expressions: letters and numbers match themselves.
Most of the punctuation characters (. and *) have special meanings in regular expressions
One of the beauties of regular expressions is that you can combine the different kinds of expresions to build up more complex patterns.
EOF

puts <<EOF
Sets match any one of a bunch of caracters. This is a sample [aeiou] will match any the single charactar. This regular expression [0123456789abdef] will match any single hexadecimal digit like 7 or f
EOF

puts <<EOF
Range is defined by specifying the beginning and of of a sequence of characters, separated by a dash: [0-9], [a-z], [0-9abcdef] is equal to [0-9-a-f], [0-9a-zA-Z_]
EOF

puts <<EOF
| is used to separate different parts of the expression: A|B will match either A or B
EOF

puts <<EOF
In regular expressions an asterisk (*) matches zero or more of the thing that came just before it.
EOF

puts <<EOF
Regexp is one of the built-in data types.
EOF

puts /\d\d:\d\d (AM|PM)/ =~ '10:24 PM'

puts <<EOF
This zero is trying to tell us that the regular expression matched at index zero.
EOF

puts /PM/ =~ '10:24 PM'

puts /May/ =~ 'Sometime in June' || 'Not Match'

puts 'You can use regular expression matches as booleans'
the_time = '10:24 AM'
puts "It's morning!" if /AM/ =~ the_time

puts <<EOF
The =~ operator is also ambidextrous: It doesn't matter whether the string or the regular expression comes first.
EOF

puts "It's morning!" if the_time =~ /AM/


puts 'It matches!' if /AM/i =~ 'am'

current_time = '10:24 PM'
current_time.gsub!( /\d\d:\d\d (AM|PM)/, '**:** **' )
puts current_time

content = <<EOF
The Princess And the Monkey

Once upon a time there was a princess...
...and they lived happily every after.

The End
EOF

puts 'This is a tale!' if content =~ /^Once upon a time/

puts 'This is a tale!' if content =~ /^Once upon a time.*happily every after\.$/m


# Avoid this
puts /abc*/ == "abcccc"

# And use this
puts /abc*/ =~ "abcccc"

