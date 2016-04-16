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

  GIT_STATUS = Process.run("git status") {|io| io.read  }
  GIT_BRANCH = Process.run("git branch") {|io| io.read }.split(/\n/).find{|i| i.match(/^\*/)}.to_s.chomp || "NO-VC"

  def initialize
    self.prompt = ""
    self.prompt << "NO-VC" if GIT_STATUS =~ /fatal:/
    get_prompt
  end

  def get_prompt
    unless prompt[/NO-VC/]
      set_prompt
    end
  end

  def set_prompt
    case GIT_STATUS
    when /working directory clean/ && GIT_STATUS =~ /branch is ahead/ then
      self.prompt << "\e[1;41m#{SYMBOL[:tiger]}"
    when /branch is behind/ then self.prompt << "\e[1;41m#{SYMBOL[:sword]}"
    when /A\s+(.*)/ then self.prompt << SYMBOL[:recycle]
    when /M\s+(.*)/ then self.prompt << SYMBOL[:hazard]
    when /Untracked files/ then self.prompt << SYMBOL[:sun]
    else
      self.prompt << SYMBOL[:yinyang]
    end
    self.prompt << GIT_BRANCH if GIT_BRANCH != ""
  end

  def show
    puts prompt
  end
end

GitPrompt.new.show
