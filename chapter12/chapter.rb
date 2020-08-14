#!/usr/bin/env ruby
puts 'Create Classes that understand Equality'
puts <<EOF
 The problem is that we have defined equality relationships that violate the principal of symmetry: People tend to expect that if a == b then b == a.There really is no magic elixir that will fix an asymmetrical equality relationship: You can either change the == methods on both classes so that they agree, or you can simply live with (and perhaps document) a less-than-intuitive, asymmetrical equality.
EOF
