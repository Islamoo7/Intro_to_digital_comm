function rec_bit_seq = DecodeBitsFromSamples(rec_sample_seq,case_type,p,fs)
%
% Inputs:
%   rec_sample_seq: The input sample sequence to the channel
%   case_type:      part1,part2,part3
%   fs:             * The sampling frequency used to generate the sample sequence
%   p:              * The bit  flibbing probability           
% Outputs:
%   rec_bit_seq: The sequence of sample sequence after passing through the channel
%
% This function takes the sample sequence after passing through the
% channel, and decodes from it the sequence of bits based on the considered
% case and the sampling frequence

if (nargin <= 3)
    fs = 1;
end

switch case_type
    
    case 'part_1'
        %%% WRITE YOUR CODE FOR PART 1 HERE
        if (p <= 0.5) 
            rec_bit_seq = rec_sample_seq; 
         
        elseif (p > 0.5)
                rec_bit_seq = ~rec_sample_seq;
        end 
        %%%
    case 'part_2'
        %%% WRITE YOUR CODE FOR PART 2 HERE
        rec_bit_seq_fs = zeros(1,length(rec_sample_seq));
        rec_bit_seq = zeros(1,length(rec_sample_seq)/fs);
        count1 = 0;
        count0 = 0;
        k = 1;
        
        if (p <= 0.5) 
            rec_bit_seq_fs = rec_sample_seq; 
         
        elseif (p > 0.5)
                rec_bit_seq_fs = ~rec_sample_seq;
        end 
        
        for i=1:fs:length(rec_sample_seq)
            count1 = nnz(rec_bit_seq_fs(i:i+fs-1));
            count0 = fs - count1;

           if (count1>count0)
               rec_bit_seq(k) = 1;
               
           else
               rec_bit_seq(k) = 0;
           end
           
           k = k+1;
           count1 = 0;
           count0 = 0;
        end
        %%%
    case 'part_3'
%         %%% WRITE YOUR CODE FOR PART 3 HERE
        rec_bit_seq_fs = zeros(1,length(rec_sample_seq));
        rec_bit_seq = zeros(1,length(rec_sample_seq)/fs);
        k = 1;
        if (p <= 0.5) 
            rec_bit_seq_fs = rec_sample_seq; 
         
        elseif (p > 0.5)
                rec_bit_seq_fs = ~rec_sample_seq;
        end 
        for i=1:fs:length(rec_sample_seq)
           if ((rec_bit_seq_fs(i))==1)
               rec_bit_seq(k) = 1;
           end
           if ((rec_bit_seq_fs(i))==0)
               rec_bit_seq(k) = 0;
           end
           k = k+1;  
        end

        %%%
end