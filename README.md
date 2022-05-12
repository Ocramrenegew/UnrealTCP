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
![Test Application](/images/TestApp.png)

**Setting up an experiment**

In order to set up an experiment, a user should first enter a TestID (5 characters, e.g.: abc98). Without a valid TestID the experiment cannot be started.
Attributes that will be evaluated during the test can either be entered manually or directly imported from a .txt file (Data->Import attributes from file).
Note that attributes can also be entered once the experiment has already started. If attributes are added to a running experiment, the **Send Attributes**
button can be used to update Unreal's attribute list. Before starting the experiment the TCP server needs to be started using the **Start Server** button.
If the server is running Unreal will automatically connect to the server once the application is started.

**Finishing an experiment**

Pressing the **Finish** button will automatically save all results in .csv/.txt files as well as creating variables in the Matlab workspace
and saving a copy of the workspace.

# Unreal
## Overview
Unreal Projects can be edited in two main ways:
- **Blueprints:** A visual programming language using connected nodes
- **C++:** Using Visual Studio to directly write code in C++

**Using Blueprints**

Blueprints allow the user to quickly drag and drop nodes. Each node can have multiple inputs and outputs.
Each level starts of with a main Blueprint (Blueprints->Open Level Blueprint). Additional elements such as
Actors, Widgets, etc. will each have their own Blueprint.

In order to execute Blueprints they have to be triggered via an event or a function call. For example the
**Event BeginPlay** event will  be triggered when the level starts or the parent asset gets created.

**Using C++**

Classes and functions can also be directly created using Visual Studio. This has the advantage of potentially providing much more freedom than Blueprints can offer. Unreal projects can be opened in Visual Studio by navigating to the project directory and opening the .sln file present. If no .sln file can be seen it can be
created by right-clicking on your project's .uproject file and selecting **Generate Visual Studio project files**. Note that **pure Blueprint projects cannot be opened with Visual Studio** since they cannot contain any C++ code. In order to convert a Blueprint project to a C++ project, go to File->New C++ Class and create an empty C++ class (this can be deleted later). This will turn the project into a C++ project without any changes to existing content and Visual Studio project files can be generated.

The two main applications of C++ used here are:
- C++ Actors
- Function Library

A **C++ Actor** is an Actor that can be used normally in the Unreal Editor however functionality is not created via Blueprints but via C++ Code. An Actor is represented as a C++ class and can be edited the same way.
[Unreal provides](https://docs.unrealengine.com/4.27/en-US/) a large amount of classes, functions and data types that can be used in Visual Studio.

A **Function Library** allows users to create **UFUNCTIONS** that can be used via Blueprints. There are two main types of UFUNCTIONS:
- A Blueprint callable function has an execution pin.
![Blueprint Callable](/images/BlueprintCallable.png)
- A Blueprint pure function has no execution pin and will be called as soon as the application starts.
![Blueprint Pure](/images/BlueprintPure.png)
UFUNCTIONS are created by marking a static function with the UFUNCTION marker:
```
UFUNCTION([specifier1=setting1, specifier2,...])
static ReturnType FunctionName(parameters);
```
![Function Library](/images/FunctionLibrary.png)

## TCP Socket Plugin
CodeSpartan's TCP Socket Plugin facilitates communication with a TCP server purely in blueprints. It enables Unreal
to send and receive messages.
![SocketPlugin](/images/SocketPlugin.jpg)

Upon detecting Bytes in the buffer, the ReceivedMessage event is triggered which will process the message.
Data is sent in the Form of bytes which need to be decoded when receiving. For the sake of simplicity all floating point numbers are set to 3 decimal precision.

For more information see: [UE4TcpSocketPlugin](https://github.com/CodeSpartan/UE4TcpSocketPlugin)

## IHTAUnreal Plugin
The IHTAUnreal Plugin consists of two main components: 
- An Actor **TCPActor** that implements communication facilitated by the Socket Plugin and shows the test UI
- A Function Library responsible for collecting headtracking data and writing it to a .csv file

**Usage**

The **TCPActor** can simply be dragged into the map. Note that the test UI will be displayed on top of the Actor. 

The test UI consists of three sliders each corresponding to a scene as well as an attribute list. Using the buttons located under each slider the user can switch between different scenes and the two buttons on the top will switch between different attributes.
![Test UI](/images/TestUI.png)

The Function Library provides the function **writeToFile**. This function saves headtracking data collected into an already existing .csv file. Headtracking data is initially stored in arrays in Unreal. In order to reduce memory usage however, the data is written to file each time the 1500th entry is reached. Afterwards the array will be emptied.

**Adding Plugins to existing projects**
Plugins are usually stored in a seperate *Plugins* folder inside the project directory. In order to add the IHTAUnreal plugin (the TCP Socket Plugin can be downloaded from the Unreal Marketplace) insert it into the project directory: **Project\Plugins\IHTAUnreal**. Afterwards the Visual Studio project files will need to be
newly generated and the project has to be rebuilt. The plugins contents will then appear in Unreal's Content Browser.