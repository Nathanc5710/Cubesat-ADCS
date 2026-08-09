# cpp/

Flight-software-style C++ port of the EKF and LQR controller, validated
against the MATLAB/Simulink outputs (see `python/` for the comparison harness).

- `include/` — public headers (EKF, controller, math utilities)
- `src/` — implementation + simulation loop entry point
- `tests/` — unit tests
