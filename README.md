# Traffic Light Sequence Controller

A synthesizable implementation of logic that can be used to regulate the flow of traffic in a two-road intersection.

---

## How It Works

The controller is implemented as a **6-state Finite State Machine (FSM)**, cycling through the following sequence:

|State|Road 1|Road 2|Duration|Purpose|
|-|-|-|-|-|
|1|🟢 GREEN|🔴 RED|45 seconds|Road 1 traffic flows|
|2|🟡 YELLOW|🔴 RED|5 seconds|Warning to Road 1 — road switching incoming|
|3|🔴 RED|🔴 RED|10 seconds|Intersection clears — vehicles in between exit safely|
|4|🔴 RED|🟢 GREEN|45 seconds|Road 2 traffic flows|
|5|🔴 RED|🟡 YELLOW|5 seconds|Warning to Road 2 — road switching incoming|
|6|🔴 RED|🔴 RED|10 seconds|Intersection clears — vehicles in between exit safely|

After State 6, the sequence repeats from State 1.

---

## Technologies Used

|Tool / Language|Purpose|
|-|-|
|**Verilog**|RTL design and synthesizable implementation|
|**UVM (Universal Verification Methodology)**|Functional verification and testbench development|

---

## Project Structure

```
traffic-light-controller/
├── traffic_light_controller.v                       # Main RTL design
├── tb_traffic_light.v                               # Testbench
├── traffic_light.vcd                                # Simulation outputs / waveforms
└── README.md
```

---

## How to Run

1. Clone the repository:

```bash
   git clone https://github.com/YOUR\\\_USERNAME/traffic-light-controller.git
   ```

2. Open in your preferred HDL simulator (e.g., ModelSim, Vivado, QuestaSim)
3. Compile the RTL and testbench files
4. Run the UVM simulation to verify FSM state transitions

---

## Limitations

* Currently designed for a **single two-road intersection** only
* Signal timing is **fixed** and does not adapt to real-time traffic conditions
* Does not include pedestrian crossing signals

---

## Future Improvements

* \[ ] Scale to **multi-intersection road networks**
* \[ ] Add **pedestrian signal** support
* \[ ] Implement **adaptive timing logic** — dynamically adjust waiting periods based on traffic density on each road
* \[ ] Add **emergency vehicle priority** — preempt normal sequence to give right-of-way to emergency vehicles

---

## Author

**Rajat**  
rs7773892@gmail.com

