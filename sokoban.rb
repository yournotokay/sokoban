#!/usr/bin/env ruby

require 'io/console'
Dir["sokoban/*.rb"].each {|file| require_relative file }

God.start(ARGV[0])

