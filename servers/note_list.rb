require 'socket'

server = TCPServer.new(2345)

loop do
  socket = server.accept
  notes = []
  note = ""

  until note == "quit"
    socket.puts "What do you want to remember?"
    note = socket.gets.chomp
    notes << note

    if note != "quit"
      socket.puts "You added the note: #{note}"
    else
      socket.puts "Your list of notes: #{notes.tap(&:pop)}"
    end
  end

  socket.close
end


