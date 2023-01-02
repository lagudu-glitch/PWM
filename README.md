# PULSE WIDTH MODULATOR (PWM)<br>
Produces a digital waveform (i.e. either 0 or 1), with a specific duty cycle. PWM starts high
and goes low when the c (count) value of the counter present in the PWM is equal to the CCR value
set by the user. Counter counts to the maximum ARR (set by the user) value.<br>
## Usage<br>
There are two modes present in this implementation of the PWM.<br>
> ### Modes
>
> - COUNT UP   (set ``dir = 1'b1``)
> - COUNT DOWN (set ``dir = 1'b0``)
>
1. In count up mode the PWM starts counting from 0 till the ARR value.
2. In count down mode the PWM starts counting from ARR value till 0.

PWM by default +1 both the ARR value and CCR value. **So set (ARR - 1)/(CCR - 1)**<br>
> ### Example
>
> 10 % Duty Cycle (UP COUNT)
> CCR = 100 and ARR = 1000, since 100 is 10% of 1000 
> Set ``CCR = (100 - 1)`` and ``ARR = (1000 - 1)``
>
## MAKEFILE<br>
Make commands<br>
```
make build
```
Compiles ***PWM.sv*** and ***tb.sv*** with **iverilog** and creates a simulation file ***sim.vvp***.
```
make verify
```
Simulates the ***sim.vvp*** and dumps the signals and variables into ***dump.vcd*** and runs
the ***dump.vcd*** with **gtkwave**.
```
make clean
```
Removes the ***sim.vvp*** and ***dump.vcd*** files that were created.<br>
## Simulation Results


