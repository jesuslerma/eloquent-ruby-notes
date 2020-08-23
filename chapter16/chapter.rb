#!/usr/bin/env ruby

puts 'Use modules as mixins'

puts <<EOF
In practice, this means that if you have several unrelated classes that need to share some code, you don’t have to resort to restructuring your whole inheritance tree to get at that code. All you need to do is wrap the common stuff in a module and include that module in the classes that need it.
EOF

