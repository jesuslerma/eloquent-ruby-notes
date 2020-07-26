#!/usr/bin/env ruby
# notes on smart strings
str = %q{"Stop", she said, "I can't live without 's and "s."}
pp str

# Document sample

heres_one = <<EOF
This is the beginning of my here document.
And this is the end.
EOF
pp heres_one

pp " hello ".lstrip.rstrip

pp 'It is warm outside'.sub('warm', 'cold')

# inflection is a class by rails that helps to keep
# the convention by configuration rule
# inflect.irregular('person', 'people')
# inflect.irregular('child', 'children')
# and this is the way rails apply those rules
# inflections.plurals.each do |(rule, replacement)|
#   break if result.gsub!(rule, replacement)
# end
# Since ruby stirngs are mutable take the habit of saying this:
# first_name = first_name.upcase
# Instead of this:
# first_name.upcase!


first_name = "Jesus"
pp first_name[-1]
