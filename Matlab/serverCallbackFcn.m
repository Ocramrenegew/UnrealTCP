 function serverCallbackFcn(src, ~, connection)
%Called when a terminator is available in the server buffer
%   Terminator can be changed with configureTerminator(src, terminator).
%   Checks message header (see documentation) and passes message for
%   processing
%   
%   Command Syntax:
%   001 -> Headtracking data
%   002 -> Slider data
%   003 -> 
%   011 -> No HMD detected/enabled
%   012 -> Headtracking data written to file
%   013 -> Headtracking speed
%   014 -> Headtracking start time
%
   data = read(src, 38);
   switch char(data(1:4))
       case '00|' %ping
           writeline(src, "00");
       case '001|' %headtracking data
           connection.headtracking_data_count = connection.headtracking_data_count+1;
           connection.headtracking_data(connection.headtracking_data_count,:) = data(5:28);
       case '002|' %slider data
           connection.slider_data_count = connection.slider_data_count+1;
           connection.slider_data(connection.slider_data_count, 1:5) = connection.test_id;
           connection.slider_data(connection.slider_data_count, 6:39) = data(5:38);
       case '011|' %no HMD detected
           fprintf("Warning: No HMD is detected and/or enabled.\n");
           connection.hmd_enabled = 0;
       case '012|' %headtracking file written
           fprintf("File written\n");
       case '013|'
           connection.tracking_speed = string(typecast(uint8(data(5:8)), 'single'));
           fprintf("speed received\n");
       case '014|' %headtracking speed
           time = typecast(uint8(data(5:8)), 'single');
           min = floor(time / 60);
           sec = mod(time , 60);
           connection.headtracking_time = string(min) + "min " + string(sec) + "sec";
           fprintf("time received\n");
       otherwise
           fprintf("NONE\n");
   end
end