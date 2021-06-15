require 'socket'

server = TCPServer.new(2345)

loop do
  socket = server.accept
  they_said = ""

  until they_said == "quit"
    socket.puts "What do you say?"
    they_said = socket.gets.chomp
    if they_said == "quit"
      socket.puts "You said: #{they_said}. Goodbye!"
    else
      socket.puts "You said: #{they_said}."
    end
  end
  
  socket.close
end
