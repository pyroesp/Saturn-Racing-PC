# Saturn Racing PC

I wanted to use my Sega Saturn racing controller on the PC, so I did this little project.  
The Arduino pro micro does the controller to PC interface.  

I've reversed the protocol and made my own functions to read the controller status.  
I then used a Joystick library from MHeironimus, see below or in code for the link, which made the Arduino pro micro into a USB HID Gamepad/Joystick.  

# Hardware

Connections are explained in the code, but I'll make a schematic just in case.  
You'll need an Arduino pro micro, or compatible, for this.  

I used DB9 connectors because that's what I had on hand. I would have liked to use something else.  
The wire between the pro micro and DB9 connector is a VGA cable.  

<img src="./arduino pro micro/Schematic/Schematic.png">  

<img src="./pics/Arduino Pro Micro cable.jpg">  

<img src="./pics/Saturn Racing Controller new wiring 1.jpg">  

<img src="./pics/Saturn Racing Controller new wiring 2.jpg">  

# Software

I've tried adding some comments in the code so it's easier to understand, but all in all I think it's fairly simple.  
Feel free to ask me on twitter or discord if you have any questions.  

# Saturn Racing Controller

<img src="./pics/Saturn Racing Controller PCB 1.jpg">  

<img src="./pics/Saturn Racing Controller PCB 2.jpg">  

# Reverse Engineering

<img src="./pics/Saturn Racing Controller PCB Logic Analyzer 1.jpg">  

<img src="./pics/Saturn Racing Controller PCB Logic Analyzer 2.jpg">  

# Dependencies

- Joystick library from MHeironimus: https://github.com/MHeironimus/ArduinoJoystickLibrary  

