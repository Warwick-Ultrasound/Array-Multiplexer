function mp = openMP(port)
    % opens the multiplexer port and configures the correct settings.

    mp = serialport(port, 9600, 'Timeout', 3);
    configureTerminator(mp, "LF");
    pause(2);

end