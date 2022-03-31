inFID = fopen('Smooth_topographic_realization_50.csv');
if inFID == -1, error('Cannot open file for reading'); end
Line   = fgetl(inFID);
Comma  = strfind(Line, ',');  % It is a comma separated file, isn't it?
Dummy  = sscanf(Line(Comma(1) + 1:end), '%g,', [1, Inf]);
nCol   = numel(Dummy);
outFID = zeros(1, nCol);
for iOut = 1:nCol
  outFID(iOut) = fopen(sprintf('Column%03d.bin', iOut), 'w');
end
if any(outFID == -1), error('Cannot open file for writing'); end
fseek(inFID, 0, -1);  % Return to start
while ~feof(inFID)
  Line = fgetl(inFID);
  if ischar(Line)
    Comma = strfind(Line, ',');  % It is a comma separated file, isn't it?
    Data  = sscanf(Line(Comma(1) + 1:end), '%g,', [1, nCol]);
    for iOut = 1:nCol
      fwrite(outFID(iOut), Data(iOut), 'double');
    end
  end
end
fclose(inFID);
for iOut = 1:nOut
  fclose(outFID(iOut));
  endconvert 
end