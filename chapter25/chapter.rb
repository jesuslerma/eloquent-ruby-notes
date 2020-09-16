#!/usr/bin/env ruby
require('./document.rb')
puts 'Create Self-Modifying Classes'

class MostlyEmpty
  puts "The value of self is #{self}"
end

class LessEmpty
  pp instance_methods(false)

  def do_something
    puts "I'm doing something!"
  end
  pp instance_methods(false)
end

class TheSameMethodTwice
  def do_something
    puts "first version"
  end

  def do_something
    puts "second version"
  end
end

twice = TheSameMethodTwice.new
twice.do_something

class AnotherSameMethodTwice
  def do_something
    puts "first version"
  end
end


class AnotherSameMethodTwice
  def do_something
    puts "second version"
  end
end

another_twice = AnotherSameMethodTwice.new
another_twice.do_something

Document.enable_encryption( false )
