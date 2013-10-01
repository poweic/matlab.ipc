function [] = write_fifo(data)

fifo_out = '/tmp/fifo2';
fout = fopen(fifo_out, 'w');

precision = ['*' class(data)];
length = numel(data);

info = whos('data');
nBytePerElement = info.bytes / length;

fwrite(fout, length, '*uint64');
fwrite(fout, nBytePerElement, '*uint64');

fwrite(fout, data, precision);

fclose(fout);

end
