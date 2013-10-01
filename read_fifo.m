function [data] = read_fifo()

fifo_in = '/tmp/fifo1';
fin = fopen(fifo_in, 'r');

nData = [];
fprintf('reading...\n');
while numel(nData) == 0
  nData = fread(fin, 1, '*uint64');
end 

fprintf('data received\n');
nData = uint32(nData);
nBytePerElement = uint32(fread(fin, 1, '*uint64'));

fprintf('nBytePerElement = %d\n', nBytePerElement);

switch (nBytePerElement)
  case 8
    precision = '*double';
  case 4
    precision = '*single';
end

data = fread(fin, [nData, 1], precision); 

fclose(fin);

end

