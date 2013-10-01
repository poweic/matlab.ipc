function [] = read()

while 1
  fprintf('XD\n');
  data = read_fifo;
  data = data + 1;
  write_fifo(data);
end

end

