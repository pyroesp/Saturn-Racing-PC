#include <stdint.h>
#include <Joystick.h> // Joystick library from https://github.com/MHeironimus/ArduinoJoystickLibrary


/*
  Arduino connections:
  ====================
  Request Data       - OUTPUT  - 2
  Controller Enable  - OUTPUT  - 3
  Data Ready         - INPUT   - 4
  Data 0             - INPUT   - 5
  Data 1             - INPUT   - 6
  Data 2             - INPUT   - 7
  Data 3             - INPUT   - 8

  Saturn Racing Controller Pinout:
  ================================
  1. BLUE     -   Vcc
  2. GREEN    -   Data1
  3. BLACK    -   Data0
  4. ORANGE   -   Request Data
  5. RED      -   Controller Enable / Controller Select / ...
  6. BROWN    -   Ready Data
  7. YELLOW   -   Data3
  8. GRAY     -   Data2
  9. WHITE    -   GND

  Reverse Engineering:
  ====================
  * 16ms break between data transmissions
  * 80us settle time after enable before first request
  * 100us hold time before disabling
  * 14us minimum request pulse (?)
  * 10 requests for data (10 packets)

  Packets:
  ========
     (D0 - D1 - D2 - D3)
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
*/


// Input
#define READY 4
#define DATA0 5
#define DATA1 6
#define DATA2 7
#define DATA3 8
// Output
#define REQUEST 2
#define ENABLE 3
// Timing
#define BREAK_TIME 16 // ms
#define SETTLE_TIME 80 // us
#define REQUEST_TIME 14 // us
#define HOLD_TIME 100 // us
// Packets
#define PACKETS 10
// Button packet number and bits
#define PACKET_DU 2 // Packet down up
#define BTN_DOWN 0
#define BTN_UP 1
#define PACKET_ABCS 3 // Packet a-b-c-start
#define BTN_B 0
#define BTN_C 1
#define BTN_A 2
#define BTN_START 3
#define PACKET_XYZ 4 // Packet x-y-z
#define BTN_Z 0
#define BTN_Y 1
#define BTN_X 2
// Wheel packet
#define PACKET_WHEEL_HIGH_NIBBLE 6
#define PACKET_WHEEL_LOW_NIBBLE 7

#define BUTTON_PRESSED 0 // Button pressed is logic low

// Controller Structure
typedef struct{
    int16_t x;
    union{
        uint16_t buttons;
        struct{
            uint8_t btn_a: 1;
            uint8_t btn_b: 1;
            uint8_t btn_c: 1;
            uint8_t btn_x: 1;
            uint8_t btn_y: 1;
            uint8_t btn_z: 1;
            uint8_t btn_start: 1;
            uint8_t btn_up: 1;
            uint8_t btn_down: 1;
            uint8_t unused: 7;
        };
    };
}SaturnRacing;


// Initialize controller structure and I/O
void controllerInit(SaturnRacing *ctrl);
// Read controller data (ie. do the controller protocol magic here)
void controllerRead(SaturnRacing *ctrl);
// Used by controllerRead to make the controller protocol)
void controllerEnable(void);
void controllerDisable(void);
void controllerSendReadRequest(void);
void controllerRequestToIdle(void);
void controllerWaitForDataReady(void);


// Global joystick variable/object from Joystick library
Joystick_ j(
  JOYSTICK_DEFAULT_REPORT_ID, JOYSTICK_TYPE_JOYSTICK,
  9, 0,                  // Button Count, Hat Switch Count
  true, true, false,     // X on, Y on, Z off
  false, false, false,   // No Rx, Ry, or Rz
  false, false,          // No rudder or throttle
  false, false, false    // accelerator off, brake off, steering off
);

// Global SaturnRacing controller struct
SaturnRacing controller;


void setup() {
  controllerInit(&controller); // Init controller
  j.begin(true); // Begin joystick in auto mode enabled
  j.setXAxisRange(0, 255); // Set range of X-axis
  j.setYAxisRange(0, 255); // Set range of Y-axis (probably not needed)
}

void loop() {
  controllerRead(&controller); // Read controller status
  j.setXAxis(controller.x); // Set USB joystick X position
  j.setYAxis(127); // Set USB joystick Y position (probably not needed)
  // Set USB controller buttons
  j.setButton(0, controller.btn_a);
  j.setButton(1, controller.btn_b);
  j.setButton(2, controller.btn_c);
  j.setButton(3, controller.btn_x);
  j.setButton(4, controller.btn_y);
  j.setButton(5, controller.btn_z);
  j.setButton(6, controller.btn_up);
  j.setButton(7, controller.btn_down);
  j.setButton(8, controller.btn_start);
}


void controllerInit(SaturnRacing *ctrl){
  ctrl->buttons = 0;
  ctrl->x = 0;

  digitalWrite(REQUEST, HIGH);
  digitalWrite(ENABLE, HIGH);
  pinMode(REQUEST, OUTPUT);
  pinMode(ENABLE, OUTPUT);
  
  pinMode(READY, INPUT_PULLUP);
  pinMode(DATA0, INPUT_PULLUP);
  pinMode(DATA1, INPUT_PULLUP);
  pinMode(DATA2, INPUT_PULLUP);
  pinMode(DATA3, INPUT_PULLUP);
}

void controllerRead(SaturnRacing *ctrl){
  uint8_t i = 0;
  uint8_t data[PACKETS] = {0};
  controllerEnable();
  delayMicroseconds(SETTLE_TIME);
  for (i = 0; i < PACKETS; i++){
    controllerSendReadRequest();
    controllerWaitForDataReady();
    delayMicroseconds(REQUEST_TIME >> 1);
    data[i] = digitalRead(DATA3) << 3 | digitalRead(DATA2) << 2 | digitalRead(DATA1) << 1 | digitalRead(DATA0);
    delayMicroseconds(REQUEST_TIME >> 1);
  }
  controllerRequestToIdle();
  delayMicroseconds(HOLD_TIME);
  controllerDisable();

  ctrl->btn_a = (data[PACKET_ABCS] & _BV(BTN_A)) == BUTTON_PRESSED;
  ctrl->btn_b = (data[PACKET_ABCS] & _BV(BTN_B)) == BUTTON_PRESSED;
  ctrl->btn_c = (data[PACKET_ABCS] & _BV(BTN_C)) == BUTTON_PRESSED;
  ctrl->btn_start = (data[PACKET_ABCS] & _BV(BTN_START)) == BUTTON_PRESSED;

  ctrl->btn_x = (data[PACKET_XYZ] & _BV(BTN_X)) == BUTTON_PRESSED;
  ctrl->btn_y = (data[PACKET_XYZ] & _BV(BTN_Y)) == BUTTON_PRESSED;
  ctrl->btn_z = (data[PACKET_XYZ] & _BV(BTN_Z)) == BUTTON_PRESSED;

  ctrl->btn_down = (data[PACKET_DU] & _BV(BTN_DOWN)) == BUTTON_PRESSED;
  ctrl->btn_up = (data[PACKET_DU] & _BV(BTN_UP)) == BUTTON_PRESSED;

  ctrl->x = data[PACKET_WHEEL_HIGH_NIBBLE] << 4 | data[PACKET_WHEEL_LOW_NIBBLE];

  delay(BREAK_TIME);
}

void controllerEnable(void){
  digitalWrite(ENABLE, LOW);
}

void controllerDisable(void){
  digitalWrite(ENABLE, HIGH);
}

void controllerSendReadRequest(void){
  if (digitalRead(REQUEST) == HIGH)
    digitalWrite(REQUEST, LOW);
  else
    digitalWrite(REQUEST, HIGH);
}

void controllerRequestToIdle(void){
  digitalWrite(REQUEST, HIGH);
}

void controllerWaitForDataReady(void){
  while(digitalRead(REQUEST) != digitalRead(READY));
}
