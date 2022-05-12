# UnrealTCP Documentation
UnrealTCP is a framework for creating an interface between [Unreal Engine](https://www.unrealengine.com/en-US/) and 
[Matlab](https://de.mathworks.com/products/matlab.html) with the goal of allowing easy data collection during listening experiments conducted in VR.
Data transmission is provided via a TCP connection with Matlab acting as a server. The framework consists of:
- A plugin created for Unreal Engine
- A Matlab application allowing for control of VR experiments

## Contents
1. [Requirements](https://github.com/Ocramrenegew/UnrealTCP/new/main?readme=1#requirements)
2. Matlab
   - Connection Class
     - Message Format 
   - Test Application
3. Unreal Engine
   - Unreal Overview
   - TCP Socket Plugin
   - IHTAUnreal Plugin

## Requirements
- [Unreal Engine version 4.27](https://www.unrealengine.com/en-US/)
  - [CodeSpartan's TCP Socket Plugin](https://github.com/CodeSpartan/UE4TcpSocketPlugin)
- [Matlab 2021a or newer](https://de.mathworks.com/products/matlab.html)
  - [Instrument Control Toolbox](https://de.mathworks.com/products/instrument.html)

## Matlab
### Connection Class
The *Connection* object handles everything related to communication. It consists of a TCP server, collected data and a callback function to handle input.
Note that **only one** *Connection* object with a given IP address and port combination can exists at once.

**Properties**
- **server:** *tcpserver* object establishing connection
- **headtracking_data:** *table* holding collected headtracking data
- **slider_data:** *table* holding raw data in the form of Byte Arrays
- **slider_transformed_data:** *table* holding formatted data
- **test_id:** ID of current experiment

**Opening a connection**
```
conn = Connection('address', portNr)
```
The default values are 'localHost' (127.0.0.1) and port 4000, which is also used as default value in Unreal.

**Communicating with clients**
In this project communication with a client is achieved by sending data in the form of strings:
```
writeline(conn.server, "some text")
```

**Message format**
In order to effectively handle message on both sides of the interface, all messages are prefaced with a header composed of three numbers
indicating the purpose and length of the message:
```
header|message
```

- **002**
  - Unreal to Matlab. Transmits each time a slider in Unreal is moved.
  - Format: 002|sliderNr discrete reset levelState attribute time
- **004**
  -  Matlab to Unreal. Transmits start value for a slider.
  -  Format: 004|slider value
  -  Example:
```
004|A0.300
sets start value of slider A to 0.300
```
- **005**
  - Matlab to Unreal. Transmits wether sliders reset on scene change.
  - Format: 005|value 
- **006**
  - Matlab to Unreal. Transmits wether sliders have set step sizes (and step size if applicable)
  - Format: 006|value stepsize
  - Example:
```
006|10.100
sets slider to discrete values with step size 0.100
```
- **007**
  - Matlab to Unreal. Transmits an attribute to Unreal
  - Format: 007|attribute 
- **008**
  - Matlab to Unreal. Changes visibility of test UI
  - Format: 008|
- **009**
  - Matlab to Unreal. Instructs Unreal to write collected headtracking data to file.
  - File name and location can be edited in Unreal.  
- **010**
  - Matlab to Unreal. Starts/Stops collection of headtracking data.
- **011**
  - Unreal to Matlab. Sent when no HMD was detected or when HMD is disabled.
- **012**
  - Unreal to Matlab. Sent when writing of headtracking has finished.
- **013**
  - Unreal to Matlab. Transfers speed of headtracking data collection.
  - Tracking speed can be edited in Unreal.   
- **014**
  - Unreal to Matlab. Transfers start time of headtracking collection in seconds.
- **015**
  - Matlab to Unreal. Requests headtracking speed and start time.  

### Test Application
The test application is used to control the rest running in unreal by sending/receiving the commands explained above.
The GUI consists of two main panels:
- **The left panel** is used for setting up tests(TestID, server config, etc...)
- **The right panel** is used to edit test parameters, most notably slider parameters

**Setting up an experiment**

In order to set up an experiment, a user should first enter a TestID (5 characters, e.g.: abc98). Without a valid TestID the experiment cannot be started.
Attributes that will be evaluated during the test can either be entered manually or directly imported from a .txt file (Data->Import attributes from file).
Note that attributes can also be entered once the experiment has already started. If attributes are added to a running experiment, the **Send Attributes**
button can be used to update Unreal's attribute list. Before starting the experiment the TCP server needs to be started using the **Start Server** button.
If the server is running Unreal will automatically connect to the server once the application is started.

**Finishing an experiment**

Pressing the **Finish** button will automatically save all results in .csv/.txt files as well as creating variables in the Matlab workspace
and saving a copy of the workspace.
