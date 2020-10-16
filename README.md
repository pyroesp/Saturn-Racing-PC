# Saturn Racing PC

I wanted to use my Sega Saturn racing controller on the PC, so I did this little project.  
The Arduino pro micro does the controller to PC interface.  

I've reversed the protocol and made my own functions to read the controller status.  
I then used a Joystick library from MHeironimus, see below or in code for the link, which made the Arduino pro micro into a USB HID Gamepad/Joystick.  

Here's a video of the finished controller, setup in Wreckfest:

[![Wreckfest with Sega Saturn racing controller](https://img.youtube.com/vi/E5IDyN7Fv7s/0.jpg)](https://www.youtube.com/watch?v=E5IDyN7Fv7s)

# Hardware

The Sega Saturn racing controller has a few wires for the buttons and it uses some sort of open wheel encoder to get the wheel position.  
<img src="./pics/Saturn Racing Controller PCB 1.jpg">   

<img src="./pics/Saturn Racing Controller PCB 2.jpg">  

Here you can see the two IR modules for the encoder.
<img src="./pics/Saturn Racing Controller encoder 1.jpg">   

And here the actual holes of the wheel encoder.
<img src="./pics/Saturn Racing Controller encoder 2.jpg">   

As you can see there are two bands on the encoder. One that has holes going from one side to the other and then one singular hole.  
The singular hole is used for detecting when the steering wheel is in the center.
This also forces the steering wheel counter, sent to the Saturn, to get reset to it's center value (127).


On the back of the PCB there's a SEGA branded chip.  
<img src="./pics/Saturn Racing Controller unknown SEGA chip.jpg">  

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


# Reverse Engineering

Probing all pins coming from the Sega Saturn to see what's going on:  
<img src="./pics/Saturn Racing Controller PCB Logic Analyzer 1.jpg">  

Below is the scope signal, already rearranged to what seemed the most logical to me.  
<img src="./pics/Saturn Racing Controller PCB Logic Analyzer 2.jpg">  
\* I love the green color of my HP 54645D screen

As you can see the signal isn't that difficult.  
At first glance you can see some sort of chip select or let's call it console select on the top most signal (bit 1).  
This is easy to recognize as any data we see happens when bit 1 is logic low.  

Then we have what looks like two clocks on bit 0 and bit 4.  
Turns out the clock on bit 0 is actually a 'request data' from the Sega Saturn to the controller.  
The clock on bit 4 is a 'data ready' signal from the controller to the Sega Saturn.  

The next 4 signals on bit 2, 3, 6 and 7 are data.  
When pressing buttons on the controller there are low pulses that appear on those signals.  

Bit 5 is Vcc.  


Looking more into the location of pressed buttons in relation with the 'request data' and 'data ready' signal we can see that a data request happens on both falling and rising edge.  
This means we have 10 packets of 4 bits sent from the controller to the Saturn.  


The controller has a few different buttons: A, B, C, X, Y, Z, START. The steering is also data sent to the Saturn.  
Playing around with these buttons we can figure out their location in the packets:
0. 4 bits UNKNOWN (Controller ID ?)
1. 4 bits UNKNOWN (Controller ID ?)
2. DOWN - UP - 2 bits UNKNOWN
3. B - C - A - START
4. Z - Y - X - 1 bit UNKNOWN
5. 4 bits UNKNOWN
6. HIGH NIBBLE COUNTER
7. LOW NIBBLE COUNTER
8. 4 bits UNKNOWN
9. 4 bits UNKNOWN

Packet 0 and 1 are most likely some sort of controller ID so the Saturn knows what's plugged into the port.  
To know for sure I'd need to decode multiple Saturn controllers, but for now I don't think that's really useful so I'm not going to bother.  


The steering wheel position is an unsigned byte going from 0 to 255, with the center being 127.  
All other buttons just send a 0 when pressed and 1 when released.  

# Dependencies

- Joystick library from MHeironimus: https://github.com/MHeironimus/ArduinoJoystickLibrary  

