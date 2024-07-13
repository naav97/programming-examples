{:ok, file} = File.open("file.txt", [:append])
IO.binwrite(file, "Hi!\n")
File.close(file)

{:ok, file} = File.read("file.txt")
IO.puts(file)
