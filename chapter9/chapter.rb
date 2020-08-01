#!/usr/bin/env ruby
puts 'Write Specs!'

puts <<EOF
A key part of the Ruby style of programming is that no class,
and certainly no program, is ever done if it lacks automated
tests.
EOF

puts <<EOF
I you take a look at DocumentTest you will see that we
have methods that assert that result, but if you are reading
the DocumentTest code, you need to infer what Document behavior
is being tested from the test code.

In a more perfect world, the test whould focus on the behaviour
itself. Rspec, possibly the Ruby world's favorite testing
framework, does that.
EOF
