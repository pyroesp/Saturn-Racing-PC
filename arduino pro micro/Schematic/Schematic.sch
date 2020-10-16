EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x09 J1
U 1 1 5F89BF6B
P 6200 4850
F 0 "J1" H 6118 4225 50  0000 C CNN
F 1 "Saturn Controller Plug" H 6118 4316 50  0000 C CNN
F 2 "" H 6200 4850 50  0001 C CNN
F 3 "~" H 6200 4850 50  0001 C CNN
	1    6200 4850
	-1   0    0    1   
$EndComp
$Comp
L Connector:DB9_Male J3
U 1 1 5F89E92C
P 9150 3000
F 0 "J3" H 9250 3600 50  0000 L CNN
F 1 "DB9_Male" H 9150 3500 50  0000 L CNN
F 2 "" H 9150 3000 50  0001 C CNN
F 3 " ~" H 9150 3000 50  0001 C CNN
	1    9150 3000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x09 J5
U 1 1 5F89F814
P 5150 4850
F 0 "J5" H 4850 5500 50  0000 L CNN
F 1 "Racing controller PCB connector" H 4300 5400 50  0000 L CNN
F 2 "" H 5150 4850 50  0001 C CNN
F 3 "~" H 5150 4850 50  0001 C CNN
	1    5150 4850
	1    0    0    -1  
$EndComp
$Comp
L Connector:DB9_Female J4
U 1 1 5F8A2FAE
P 2150 4850
F 0 "J4" H 2068 4158 50  0000 C CNN
F 1 "DB9_Female" H 2068 4249 50  0000 C CNN
F 2 "" H 2150 4850 50  0001 C CNN
F 3 " ~" H 2150 4850 50  0001 C CNN
	1    2150 4850
	-1   0    0    1   
$EndComp
$Comp
L Connector:DB9_Male J2
U 1 1 5F89CBC6
P 9200 4850
F 0 "J2" H 9300 5450 50  0000 L CNN
F 1 "DB9_Male" H 9200 5350 50  0000 L CNN
F 2 "" H 9200 4850 50  0001 C CNN
F 3 " ~" H 9200 4850 50  0001 C CNN
	1    9200 4850
	1    0    0    -1  
$EndComp
Wire Bus Line
	7250 5400 8050 5400
Entry Wire Line
	7150 4450 7250 4550
Entry Wire Line
	7150 4550 7250 4650
Entry Wire Line
	7150 4650 7250 4750
Entry Wire Line
	7150 4750 7250 4850
Entry Wire Line
	7150 4850 7250 4950
Entry Wire Line
	7150 4950 7250 5050
Entry Wire Line
	7150 5050 7250 5150
Entry Wire Line
	7150 5150 7250 5250
Entry Wire Line
	7150 5250 7250 5350
Entry Wire Line
	8150 4450 8050 4550
Entry Wire Line
	8150 4550 8050 4650
Entry Wire Line
	8150 4650 8050 4750
Entry Wire Line
	8150 4750 8050 4850
Entry Wire Line
	8150 4850 8050 4950
Entry Wire Line
	8150 4950 8050 5050
Entry Wire Line
	8150 5050 8050 5150
Entry Wire Line
	8150 5150 8050 5250
Entry Wire Line
	8150 5250 8050 5350
Wire Wire Line
	6400 4450 7150 4450
Wire Wire Line
	6400 4550 7150 4550
Wire Wire Line
	6400 4650 7150 4650
Wire Wire Line
	6400 4750 7150 4750
Wire Wire Line
	6400 4850 7150 4850
Wire Wire Line
	6400 4950 7150 4950
Wire Wire Line
	6400 5050 7150 5050
Wire Wire Line
	6400 5150 7150 5150
Wire Wire Line
	6400 5250 7150 5250
Wire Wire Line
	8150 4450 8900 4450
Wire Wire Line
	8150 4550 8900 4550
Wire Wire Line
	8150 4650 8900 4650
Wire Wire Line
	8150 4750 8900 4750
Wire Wire Line
	8150 4850 8900 4850
Wire Wire Line
	8150 4950 8900 4950
Wire Wire Line
	8150 5050 8900 5050
Wire Wire Line
	8150 5150 8900 5150
Wire Wire Line
	8150 5250 8900 5250
Text Label 6650 4450 0    50   ~ 0
WHITE
Text Label 6650 4550 0    50   ~ 0
GRAY
Text Label 6650 4650 0    50   ~ 0
YELLOW
Text Label 6650 4750 0    50   ~ 0
BROWN
Text Label 6650 4850 0    50   ~ 0
RED
Text Label 6650 4950 0    50   ~ 0
ORANGE
Text Label 6650 5050 0    50   ~ 0
BLACK
Text Label 6650 5150 0    50   ~ 0
GREEN
Text Label 6650 5250 0    50   ~ 0
BLUE
Text Label 8400 4550 0    50   ~ 0
WHITE
Text Label 8400 4750 0    50   ~ 0
GRAY
Text Label 8400 4950 0    50   ~ 0
YELLOW
Text Label 8400 5150 0    50   ~ 0
BROWN
Text Label 8400 4450 0    50   ~ 0
RED
Text Label 8400 4650 0    50   ~ 0
ORANGE
Text Label 8400 4850 0    50   ~ 0
BLACK
Text Label 8400 5050 0    50   ~ 0
GREEN
Text Label 8400 5250 0    50   ~ 0
BLUE
Wire Notes Line
	5800 4050 5800 5500
Wire Notes Line
	5800 5500 9650 5500
Wire Notes Line
	9650 5500 9650 4050
Wire Notes Line
	9650 4050 5800 4050
Text Notes 5800 4000 0    50   ~ 0
Saturn Cable: Original Saturn cable to Male DB9 connector
Text Notes 3150 3200 0    50   ~ 0
Saturn Controller Plug Pinout:\n1. VCC (Blue)\n2. Data 1 (Green)\n3. Data 0 (Black)\n4. Controller Enable (Orange)\n5. Request Data (Red)\n6. Data Ready (Brown)\n7. Data 3 (Yellow)\n8. Data 2 (Gray)\n9. GND (White)
Wire Notes Line
	3050 2300 3050 3300
Wire Notes Line
	3050 3300 4400 3300
Wire Notes Line
	4400 3300 4400 2300
Wire Notes Line
	4400 2300 3050 2300
Wire Notes Line
	3000 2250 3000 3350
Wire Notes Line
	3000 3350 4450 3350
Wire Notes Line
	4450 3350 4450 2250
Wire Notes Line
	4450 2250 3000 2250
Wire Bus Line
	5950 3600 8050 3600
Entry Wire Line
	6050 2600 5950 2700
Entry Wire Line
	6050 2700 5950 2800
Entry Wire Line
	6050 2800 5950 2900
Entry Wire Line
	6050 2900 5950 3000
Entry Wire Line
	6050 3000 5950 3100
Entry Wire Line
	6050 3100 5950 3200
Entry Wire Line
	6050 3200 5950 3300
Entry Wire Line
	6050 3300 5950 3400
Entry Wire Line
	7950 2600 8050 2700
Wire Wire Line
	7950 2600 7550 2600
Entry Wire Line
	8150 2600 8050 2700
Entry Wire Line
	8150 2700 8050 2800
Entry Wire Line
	8150 2800 8050 2900
Entry Wire Line
	8150 2900 8050 3000
Entry Wire Line
	8150 3000 8050 3100
Entry Wire Line
	8150 3100 8050 3200
Entry Wire Line
	8150 3200 8050 3300
Entry Wire Line
	8150 3300 8050 3400
Wire Wire Line
	8150 2600 8850 2600
Wire Wire Line
	8150 2800 8850 2800
Wire Wire Line
	8150 2900 8850 2900
Wire Wire Line
	8150 3000 8850 3000
Wire Wire Line
	8150 3100 8850 3100
Wire Wire Line
	8150 3200 8850 3200
Wire Wire Line
	8150 3300 8850 3300
Entry Wire Line
	8150 3400 8050 3500
Text Label 6100 2600 0    50   ~ 0
GND
Text Label 8200 2700 0    50   ~ 0
GND
Text Label 7650 2600 0    50   ~ 0
VCC
Text Label 8200 3400 0    50   ~ 0
VCC
Text Label 6100 2700 0    50   ~ 0
REQUEST_DATA
Text Label 6100 2800 0    50   ~ 0
ENABLE
Text Label 6100 2900 0    50   ~ 0
DATA_READY
Text Label 6100 3000 0    50   ~ 0
DATA0
Text Label 6100 3100 0    50   ~ 0
DATA1
Text Label 6100 3200 0    50   ~ 0
DATA2
Text Label 6100 3300 0    50   ~ 0
DATA3
NoConn ~ 6750 3400
NoConn ~ 6750 2500
NoConn ~ 6750 2400
NoConn ~ 6750 2300
NoConn ~ 7550 2300
NoConn ~ 7550 2400
NoConn ~ 7550 2500
NoConn ~ 7550 2700
NoConn ~ 7550 2800
NoConn ~ 7550 2900
NoConn ~ 7550 3000
NoConn ~ 7550 3100
NoConn ~ 7550 3200
NoConn ~ 7550 3300
NoConn ~ 7550 3400
$Comp
L promicro:ArduinoProMicro U1
U 1 1 5F8E248A
P 7150 2750
F 0 "U1" H 7200 3500 50  0000 R CNN
F 1 "ArduinoProMicro" H 7450 3350 50  0000 R CNN
F 2 "" H 7150 2750 50  0001 C CNN
F 3 "" H 7150 2750 50  0001 C CNN
	1    7150 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 2600 6750 2600
Wire Wire Line
	6050 3300 6750 3300
Wire Wire Line
	6050 3200 6750 3200
Wire Wire Line
	6050 3100 6750 3100
Wire Wire Line
	6050 3000 6750 3000
Wire Wire Line
	6050 2900 6750 2900
Wire Wire Line
	6050 2800 6750 2800
Wire Wire Line
	6050 2700 6750 2700
Wire Wire Line
	8150 3400 8850 3400
Wire Wire Line
	8150 2700 8850 2700
Text Label 8200 2600 0    50   ~ 0
REQUEST_DATA
Text Label 8200 2800 0    50   ~ 0
ENABLE
Text Label 8200 3300 0    50   ~ 0
DATA_READY
Text Label 8200 3000 0    50   ~ 0
DATA0
Text Label 8200 3200 0    50   ~ 0
DATA1
Text Label 8200 2900 0    50   ~ 0
DATA2
Text Label 8200 3100 0    50   ~ 0
DATA3
Wire Notes Line
	5800 1900 5800 3800
Wire Notes Line
	5800 3800 9650 3800
Wire Notes Line
	9650 3800 9650 1900
Wire Notes Line
	9650 1900 5800 1900
Text Notes 5800 1850 0    50   ~ 0
PC Cable : Arduino Pro Micro to Male DB9 connector
Wire Bus Line
	4100 5400 3300 5400
Entry Wire Line
	4200 4450 4100 4550
Entry Wire Line
	4200 4550 4100 4650
Entry Wire Line
	4200 4650 4100 4750
Entry Wire Line
	4200 4750 4100 4850
Entry Wire Line
	4200 4850 4100 4950
Entry Wire Line
	4200 4950 4100 5050
Entry Wire Line
	4200 5050 4100 5150
Entry Wire Line
	4200 5150 4100 5250
Entry Wire Line
	4200 5250 4100 5350
Entry Wire Line
	3200 4450 3300 4550
Entry Wire Line
	3200 4550 3300 4650
Entry Wire Line
	3200 4650 3300 4750
Entry Wire Line
	3200 4750 3300 4850
Entry Wire Line
	3200 4850 3300 4950
Entry Wire Line
	3200 4950 3300 5050
Entry Wire Line
	3200 5050 3300 5150
Entry Wire Line
	3200 5150 3300 5250
Entry Wire Line
	3200 5250 3300 5350
Wire Wire Line
	4200 4450 4950 4450
Wire Wire Line
	4200 4550 4950 4550
Wire Wire Line
	4200 4650 4950 4650
Wire Wire Line
	4200 4750 4950 4750
Wire Wire Line
	4200 4850 4950 4850
Wire Wire Line
	4200 4950 4950 4950
Wire Wire Line
	4200 5050 4950 5050
Wire Wire Line
	4200 5150 4950 5150
Wire Wire Line
	4200 5250 4950 5250
Wire Wire Line
	2450 4450 3200 4450
Wire Wire Line
	2450 4550 3200 4550
Wire Wire Line
	2450 4650 3200 4650
Wire Wire Line
	2450 4750 3200 4750
Wire Wire Line
	2450 4850 3200 4850
Wire Wire Line
	2450 4950 3200 4950
Wire Wire Line
	2450 5050 3200 5050
Wire Wire Line
	2450 5150 3200 5150
Wire Wire Line
	2450 5250 3200 5250
Text Label 4450 5250 0    50   ~ 0
WHITE
Text Label 4450 4750 0    50   ~ 0
GRAY
Text Label 4450 4650 0    50   ~ 0
YELLOW
Text Label 4450 4850 0    50   ~ 0
BROWN
Text Label 4450 4450 0    50   ~ 0
RED
Text Label 4450 4550 0    50   ~ 0
ORANGE
Text Label 4450 5150 0    50   ~ 0
BLACK
Text Label 4450 5050 0    50   ~ 0
GREEN
Text Label 4450 4950 0    50   ~ 0
BLUE
Text Label 2700 4550 0    50   ~ 0
WHITE
Text Label 2700 4750 0    50   ~ 0
GRAY
Text Label 2700 4950 0    50   ~ 0
YELLOW
Text Label 2700 5150 0    50   ~ 0
BROWN
Text Label 2700 4450 0    50   ~ 0
RED
Text Label 2700 4650 0    50   ~ 0
ORANGE
Text Label 2700 4850 0    50   ~ 0
BLACK
Text Label 2700 5050 0    50   ~ 0
GREEN
Text Label 2700 5250 0    50   ~ 0
BLUE
Wire Notes Line
	1800 4050 1800 5500
Wire Notes Line
	1800 5500 5600 5500
Wire Notes Line
	5600 5500 5600 4050
Wire Notes Line
	5600 4050 1800 4050
Text Notes 1800 4000 0    50   ~ 0
Saturn Racing controller: Female DB9 to PCB connector.
Wire Bus Line
	8050 2600 8050 3600
Wire Bus Line
	5950 2600 5950 3600
Wire Bus Line
	8050 4550 8050 5400
Wire Bus Line
	7250 4550 7250 5400
Wire Bus Line
	3300 4550 3300 5400
Wire Bus Line
	4100 4550 4100 5400
$EndSCHEMATC
