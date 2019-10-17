require 'sinatra/base'

module AnswerBot
  class Web < Sinatra::Base
    get '/' do
      "We live, fam!"
    end

    post '/' do
      "I'm awake!"
    end
  end
end
