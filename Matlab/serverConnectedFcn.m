function serverConnectedFcn(src,~)
%Called when a server connection is changed
    if src.Connected
        disp("Client has connected.");
    else
        disp("Client has disconnected.");
    end
end