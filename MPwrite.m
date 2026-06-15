function [flag, diag] = MPwrite(MP, updown, trans1, trans2)
    % sends commands to the multiplexer (MP) to set the upstream/downstream
    % direction and the transducers in each ring. updown can take values 0
    % or 1 to indicate the two directions, and the two transducers can take
    % values 0 through 7 (inclusive) to set which transducer is used in
    % each ring. The flag is 1 if the multiplexer reports a sucess and 0
    % otherwise. diag is an empty string if the operation was successful
    % and otherwise contains diagnostic information from the
    % microcontroller to indicate why it failed.

    writestr = sprintf('S%i%i%iE', updown, trans1, trans2);
    writeline(MP, writestr);   % sends LF automatically
    response = readline(MP);   % waits for LF
    response = strtrim(response);
    if response == "ACK"
        flag = 1;
        diag = "";
    else
        flag = 0;
        diag = response;
    end
end