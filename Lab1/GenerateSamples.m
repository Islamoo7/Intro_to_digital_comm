function sample_seq = GenerateSamples(bit_seq,fs)
%
% Inputs:
%   bit_seq:    Input bit sequence
%   fs:         Number of samples per bit
% Outputs:
%   sample_seq: The resultant sequence of samples
%
% This function takes a sequence of bits and generates a sequence of
% samples as per the input number of samples per bit

sample_seq = zeros(1,(length(bit_seq))*fs);

%%% WRITE YOUR CODE FOR PART 2 HERE
j = 1;
for i = 1:length(bit_seq)
   if (bit_seq(i) == 1)
       sample_seq(j:j+fs-1) = 1;
   else
       sample_seq(j:j+fs-1) = 0;
   end
   j = j + fs;
end
%%%