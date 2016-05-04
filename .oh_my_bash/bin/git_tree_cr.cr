#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

class GitPrompt
  getter :prompt
  setter :prompt

  SYMBOL =
  {
  :tiger  => "😸 " , :yinyang => "☯" , :recycle => "♻" , :hazard => "☢" , :sun     => "☀" ,
  :smiley => "☻"  , :flag    => "⚑" , :trust   => "♺" , :sword  => "⚔" , :parsley => "☘"
  }

  GIT_STATUS = Process.run("git",["status"], nil, false, false, nil, nil, nil,nil).to_s
  #GIT_BRANCH = Process.run("git branch") {|io| io.read }.split(/\n/).find{|i| i.match(/^\*/)}.to_s.chomp || "NO-VC"
  GIT_BRANCH = puts Process.run("git",["branch"], nil, false, false, nil, nil, nil,nil).to_s.match(/^\*/).to_s

  puts :HI
  
  def initialize
    self.prompt = String.build do |str|
      str << ""
      str << "NO-VC" if GIT_STATUS =~ /fatal:/
    end
    get_prompt
  end

  def get_prompt
    if prompt =~ /NO-VC/
      set_prompt
    end
  end

  def set_prompt
    case GIT_STATUS
    when /working directory clean/ && GIT_STATUS =~ /branch is ahead/ then
      self.prompt = String.build do |str|
        str << "\e[1;41m#{SYMBOL[:tiger]}"
      end
    when /branch is behind/ then
      self.prompt = String.build do |str|
        str << "\e[1;41m#{SYMBOL[:sword]}"
      end
    when /A\s+(.*)/ then
      self.prompt = String.build do |str|
        str << SYMBOL[:recycle]
      end
    when /M\s+(.*)/ then
      self.prompt = String.build do |str|
        str << SYMBOL[:hazard]
      end
    when /Untracked files/ then
      self.prompt = String.build do |str|
        str << SYMBOL[:sun]
      end
    else
      self.prompt = String.build do |str|
        str << SYMBOL[:yinyang]
      end
    end
    self.prompt = String.build do |str|
      str << GIT_BRANCH if GIT_BRANCH != ""
    end
  end

  def show
    puts prompt
  end
end

GitPrompt.new.show
