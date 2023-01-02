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

