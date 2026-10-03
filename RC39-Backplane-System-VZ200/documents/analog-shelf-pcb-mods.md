# Analog Board PCB Modifications

The analog board is set up to connect to the MIC input jack on a 2-track tape deck. You can remove the DC offset to connect to a PC line-in jack by following these instructions.

## Line-In Modification
Replace **R22** with a **10kΩ** resistor and cut the trace between **R18** and **R22**. Solder a **0.47µF – 1µF** capacitor between the two points. This will remove the DC offset and bring the output levels to approximately **1.5V to 2V p-p**, which is suitable for recording on a standard PC jack at 50% volume for most systems.

## Replacing R14 (820Ω) with Common Values
The **820Ω** resistor can be a difficult value to find. If you prefer to use common E12/E24 resistor values, you can use the **AUX** position with a parallel resistor:
1. Replace **R14** with a **1kΩ** resistor.
2. Populate **R15 (AUX)** with a **4.7kΩ** resistor.

This combination provides an equivalent resistance of approximately **824.5Ω**, which is well within tolerance.
