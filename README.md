# CubeSat ADCS GNC Simulator

A closed-loop Guidance, Navigation, and Control (GNC) simulation of a 3-axis
CubeSat attitude determination and control system (ADCS): detumble and
pointing-mode guidance, an Extended Kalman Filter for attitude/gyro-bias
estimation, and an LQR reaction-wheel controller — designed in
MATLAB/Simulink, ported to C++ as flight-software-style modules, and
validated/visualized in Python.

## Why this project

This mirrors the actual model-based design workflow used on real GNC teams:
algorithms are designed and validated in MATLAB/Simulink, the flight-critical
pieces (navigation filter, controller) are ported to C++, and Python drives
automated regression testing between the two implementations plus
visualization.

## Architecture

```
Guidance (mode logic + reference trajectory)
        |
        v
Control (LQR)  --->  Actuators (reaction wheels)  --->  Dynamics (6-DOF plant)
        ^                                                       |
        |                                                       v
        +------------------ EKF <----------------------- Sensors (gyro, sun sensor)
```

- **Guidance**: Stateflow-driven mode switch between detumble (rate-only,
  B-dot law) and pointing (SLERP-interpolated slew trajectory).
- **Navigation**: multiplicative EKF (MEKF) estimating attitude quaternion
  and gyro bias from noisy gyro + sun sensor/magnetometer measurements.
- **Control**: LQR feedback on the linearized attitude error dynamics,
  driving reaction wheels with saturation and desaturation logic.
- **Dynamics**: 6-DOF rigid body attitude dynamics with disturbance torques
  (gravity gradient, aerodynamic, solar pressure).

## Repository layout

```
simulink/   Nonlinear plant, sensor models, EKF, controller (.slx)
matlab/     Linearization, LQR design, Monte Carlo dispersion, plotting
cpp/        Flight-software-style port of the EKF + controller, unit tests
python/     MATLAB-vs-C++ regression harness, 3D visualization
docs/       Architecture notes, plots, figures
```

## Status

Work in progress — see individual folder READMEs for current state.

## Build / run

_To be filled in as each piece comes online._

## License

MIT — see [LICENSE](LICENSE).
