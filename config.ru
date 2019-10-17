require_relative 'config/environment'

Thread.abort_on_exception = true

Thread.new do
  begin
    AnswerBot::App.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run AnswerBot::Web
