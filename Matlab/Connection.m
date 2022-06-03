classdef Connection < handle
    
    %Properties
    properties (Access = public)
        server                   %TCP server object
        headtracking_data        %collected headtracking data    
        slider_transformed_data  %transformed data received from sliders
        slider_data              %raw slider data (in bytes) 
        slider_data_count        %amount of values received
        test_id                  %ID of current test
        hmd_enabled              %wether hmd is enabled or not
        tracking_speed           %speed of headtracking
        headtracking_time        %start time of headtracking
    end
    
    %Methods
    methods (Access = public)
        %Constructor
        function obj = Connection(address, portNr)
            arguments
                address char
                portNr  double
            end
            obj.slider_data = zeros(1000000,37);
            obj.slider_data_count = 0;
            obj.slider_transformed_data = 0;
            obj.hmd_enabled = 1;
            startServer(obj, address, portNr);
            flush(obj.server);
        end
        
        %Starts tcp-server
        function startServer(obj, address, portNr)  
            arguments
                obj     Connection
                address char
                portNr  double
            end
            obj.server = tcpserver(address, portNr, "ConnectionChangedFcn", @serverConnectedFcn, "Timeout", 5);
            configureCallback(obj.server, "byte", 38, @(src, eventdata)serverCallbackFcn(src, eventdata, obj));
        end

        %Transforms data from byte arrays to singles
        function transformData(obj, attributes)
            arguments
                obj    Connection
                attributes table
            end

            obj.slider_transformed_data = cell(obj.slider_data_count, 11);
            for n = 1:obj.slider_data_count
                obj.slider_transformed_data{n, 1} = obj.test_id;                                              %ID
                obj.slider_transformed_data{n, 2} = uint8(obj.slider_data(n,6));                             %SliderNr
                obj.slider_transformed_data{n, 3} = typecast(uint8(obj.slider_data(n,10:13)), 'single');     %StartValue
                obj.slider_transformed_data{n, 4} = typecast(uint8(obj.slider_data(n,14:17)), 'single');     %Value
                obj.slider_transformed_data{n, 5} = uint8(obj.slider_data(n,18));                            %Discrete
                if obj.slider_transformed_data{n, 5} == 0
                    obj.slider_transformed_data{n, 6} = 0;
                else
                    obj.slider_transformed_data{n, 6} = typecast(uint8(obj.slider_data(n,22:25)), 'single'); %Stepsize
                end
                obj.slider_transformed_data{n, 7} = uint8(obj.slider_data(n, 26));                           %Reset
                obj.slider_transformed_data{n, 8} = char(obj.slider_data(n,30:31));                            %LevelState
                attrID = uint8(obj.slider_data(n,32));
                obj.slider_transformed_data{n, 9} = char(attributes(attrID+1,:).Variables);                  %Attribute               
                time = typecast(uint8(obj.slider_data(n,36:39)), 'single');
                obj.slider_transformed_data{n, 10} = floor(time / 60);                                       %Min
                obj.slider_transformed_data{n, 11} = mod(time, 60);                                          %Sec
            end
            
            obj.slider_transformed_data = cell2table(obj.slider_transformed_data,...
                "VariableNames",["TestID" "SliderNr" "StartValue" "Value" "Discrete" "Stepsize" "Reset" "LevelState" "Attribute" "Min" "Sec"]);
            pause(0.2);
            obj.headtracking_data = readtable('Data.csv',...
                'Delimiter', ' ', 'VariableNamingRule', 'preserve');
            obj.headtracking_data.Properties.VariableNames = {'Pitch', 'Yaw', 'Rotation', 'X', 'Y' 'Z'};
            
        end       
        
        %resets server
        function resetData(obj)
            flush(obj.server);
            obj.slider_data = zeros(100000, 37);
            obj.slider_data_count = 0;
        end
    end
end

