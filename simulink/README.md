# simulink/

Simulink models for the closed-loop ADCS simulation.

- `models/adcs_plant.slx` — 6-DOF rigid body attitude dynamics + disturbance torques
- `models/adcs_sensors.slx` — gyro, sun sensor / magnetometer models with noise
- `models/adcs_ekf.slx` — multiplicative EKF for attitude + gyro bias estimation
- `models/adcs_guidance.slx` — Stateflow mode logic (detumble / pointing) + trajectory generation
- `models/adcs_controller.slx` — LQR reaction wheel controller
- `models/adcs_top.slx` — top-level closed-loop integration
